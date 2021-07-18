//
//  RSArtistVC.m
//  RSSchool_T8
//
//  Created by Anna Ershova on 15.07.2021.
//

#import "RSArtistVC.h"
#import "RSUIButton.h"
#import "RSPalletVC.h"
#import "RSHeadView.h"
#import "RSSchool_T8-Swift.h"
@interface RSArtistVC ()
@property (strong, nonatomic) NSArray<UIColor *> *colors;
@property (strong, nonatomic) RSHeadView *head;
@property BOOL stopRedraw;
@property BOOL firstLoad;
@end

@implementation RSArtistVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.firstLoad = YES;
    [self addObserver:self forKeyPath:@"self.state" options:NSKeyValueObservingOptionNew context:nil];
    self.head = [[RSHeadView alloc] initWithFrame:self.canvas.bounds];
    self.state = ASIdle;
    [self createPalletVC];
    [self makeTitleItem];
    [self makeRightBarButtonIntem];
    [self makeCanvas];
    [self addActionsOnButtons];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (self.stopRedraw)
        self.head.noDraw = YES;
}

#pragma mark UI

- (void)makeRightBarButtonIntem {
    UIButton *item = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 79, 22)];
    item.titleLabel.textColor = [UIColor colorWithRed:0.13 green:0.692 blue:0.557 alpha:1];
    item.titleLabel.font = [UIFont fontWithName:@"Montserrat-Regular" size:17];
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.lineHeightMultiple = 1.06;
    item.titleLabel.textAlignment = NSTextAlignmentRight;
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"Drawings" attributes: @{
        NSParagraphStyleAttributeName: paragraphStyle,
                  NSKernAttributeName: @-0.41}];
    [item setAttributedTitle:string forState:UIControlStateNormal];
    [item addTarget:self action:@selector(tapOnRightBarItem) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:item];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)makeTitleItem {
    UILabel *middleItem = [UILabel new];
    middleItem.frame = CGRectMake(0, 0, 44, 22);
    middleItem.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    middleItem.font = [UIFont fontWithName:@"Montserrat-Regular" size:17];
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.lineHeightMultiple = 1.06;
    middleItem.textAlignment = NSTextAlignmentCenter;
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"Artist" attributes: @{
        NSParagraphStyleAttributeName: paragraphStyle,
                  NSKernAttributeName: @-0.41}];
    middleItem.attributedText = string;
    self.navigationItem.titleView = middleItem;
}

- (void)makeCanvas {
    self.canvas.backgroundColor = [UIColor whiteColor];
    self.canvas.clipsToBounds = NO;
    UIBezierPath *shadowPath0 = [UIBezierPath bezierPathWithRoundedRect:self.canvas.bounds cornerRadius:8];
    self.canvas.layer.shadowPath = shadowPath0.CGPath;
    self.canvas.layer.shadowColor = [UIColor colorWithRed:0 green:0.7 blue:1 alpha:0.25].CGColor;
    self.canvas.layer.shadowOpacity = 1;
    self.canvas.layer.shadowRadius = 4;
    self.canvas.layer.shadowOffset = CGSizeMake(0, 0);
    self.canvas.layer.bounds = self.canvas.bounds;
    self.canvas.layer.position = self.canvas.center;
    self.canvas.layer.cornerRadius = 8;
}

#pragma mark Action

- (void)tapOnRightBarItem {
    RSDrawingsVC *drawVC = [[RSDrawingsVC alloc] initWithNibName:@"RSDrawingsVC" bundle:nil];
    [self.navigationController pushViewController:drawVC animated:NO];
}

- (void)addActionsOnButtons {
    [self.draw addTarget:self action:@selector(tapOnDraw) forControlEvents:UIControlEventTouchUpInside];
    [self.openPalette addTarget:self action:@selector(tapOnPallete) forControlEvents:UIControlEventTouchUpInside];
    [self.reset addTarget:self action:@selector(tapOnReset) forControlEvents:UIControlEventTouchUpInside];
}

- (void)tapOnReset {
    self.state = ASIdle;
    [self.time invalidate];
    self.time = nil;
    self.time = [NSTimer scheduledTimerWithTimeInterval:0.01
                                                     target: self
                                                   selector:@selector(deleteLayer)
                                                   userInfo: nil repeats:YES];
}

- (void)deleteLayer {
    if (self.canvas.subviews.lastObject.layer.sublayers.count > 0)
        [self.canvas.subviews.lastObject.layer.sublayers.lastObject removeFromSuperlayer];
    else
    {
        [self.time invalidate];
        self.time = nil;
        NSLog(@"removed!");
        [self.canvas.subviews.lastObject removeFromSuperview];
    }
    NSLog(@"removing...");
}

- (void)tapOnDraw {
    self.head.noDraw = NO;
    self.state = ASDraw;
    self.head.delegate = self;
    self.head.colors = self.colors;
    [self.canvas addSubview:self.head];
}

- (void)createPalletVC {
    RSPalletVC *palletVC = [[RSPalletVC alloc] initWithNibName:@"RSPalletVC" bundle:nil];
    [self addChildViewController:palletVC];
    palletVC.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.size.height / 2, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:palletVC.view];
    [palletVC didMoveToParentViewController:self];
    palletVC.delegate = self;
    palletVC.view.hidden = YES;
}

- (void)tapOnPallete {
    self.childViewControllers.lastObject.view.hidden = NO;
}

- (void)checkState {
    if (self.state == ASIdle)
    {
        self.openPalette.userInteractionEnabled = YES;
        self.openPalette.alpha = 1;
        self.openTimer.userInteractionEnabled = YES;
        self.openTimer.alpha = 1;
        self.reset.userInteractionEnabled = NO;
        self.reset.hidden = YES;
        self.draw.hidden = NO;
        self.draw.userInteractionEnabled = YES;
        self.draw.alpha = 1;
        self.share.userInteractionEnabled = NO;
        self.share.alpha = 0.5;
    }
    if (self.state == ASDraw)
    {
        for (UIButton *button in self.view.subviews)
        {
            if ([button isKindOfClass:[RSUIButton class]])
            {
                [button setUserInteractionEnabled:NO];
                [button setAlpha:0.5];
            }
        }
    }
    if (self.state == ASDone)
    {
        self.share.alpha = 1;
        self.share.userInteractionEnabled = YES;
        self.draw.userInteractionEnabled = NO;
        self.draw.hidden = YES;
        self.reset.hidden = NO;
        self.reset.userInteractionEnabled = YES;
        self.reset.alpha = 1;
        self.openPalette.userInteractionEnabled = NO;
        self.openPalette.alpha = 0.5;
        self.openTimer.userInteractionEnabled = NO;
        self.openTimer.alpha = 0.5;
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    [self checkState];
}

#pragma mark Delegations

- (void)passChoosenColors:(NSArray<UIColor *> *)theValue {
    NSMutableArray *tmp = theValue.mutableCopy;
    if (theValue.count < 3)
    {
        NSInteger blacks = 3 - theValue.count;
        for (int i = 0; i < blacks; i++)
            [tmp addObject:[UIColor blackColor]];
    }
    self.colors = tmp;
}

- (void)isReady:(BOOL)theValue {
    if (theValue)
    {
        self.state = ASDone;
        self.stopRedraw = YES;
    }
}

@end

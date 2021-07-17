//
//  RSArtistVC.m
//  RSSchool_T8
//
//  Created by Anna Ershova on 15.07.2021.
//

#import "RSArtistVC.h"
#import "RSUIButton.h"
#import "RSPalletVC.h"
#import "RSSchool_T8-Swift.h"
@interface RSArtistVC ()

@end

@implementation RSArtistVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createPalletVC];
    [self makeTitleItem];
    [self makeRightBarButtonIntem];
    [self makeCanvas];
    [self addActionsOnButtons];
    [self checkState];
}

- (void)viewWillAppear:(BOOL)animated {
    self.state = ASIdle;
    [self addObserver:self forKeyPath:@"self.state" options:NSKeyValueObservingOptionNew context:nil];
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
}

- (void)tapOnDraw {
    self.state = ASDraw;
}

- (void)createPalletVC {
    RSPalletVC *palletVC = [[RSPalletVC alloc] initWithNibName:@"RSPalletVC" bundle:nil];
    [self addChildViewController:palletVC];
    palletVC.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.size.height / 2, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:palletVC.view];
    [palletVC didMoveToParentViewController:self];
    palletVC.view.hidden = YES;
}

- (void)tapOnPallete {
    self.childViewControllers.lastObject.view.hidden = NO;
}

- (void)checkState {
    if (self.state == ASIdle)
    {
        for (UIButton *button in self.view.subviews)
        {
            if (self.state == ASIdle)
            {
                if ([button isKindOfClass:[RSUIButton class]])
                {
                    if ([button.titleLabel.text isEqualToString:@"Share"])
                    {
                        [button setUserInteractionEnabled:NO];
                        [button setAlpha:0.5];
                    }
                    else
                    {
                        [button setUserInteractionEnabled:YES];
                        [button setAlpha:1];
                    }
                }
            }
        }
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
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    [self checkState];
}

@end

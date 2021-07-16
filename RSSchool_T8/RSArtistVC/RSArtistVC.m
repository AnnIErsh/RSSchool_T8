//
//  RSArtistVC.m
//  RSSchool_T8
//
//  Created by Anna Ershova on 15.07.2021.
//

#import "RSArtistVC.h"
#import "RSUIButton.h"
#import "RSSchool_T8-Swift.h"
@interface RSArtistVC ()

@end

@implementation RSArtistVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.state = ASIdle;
    [self makeTitleItem];
    [self makeRightBarButtonIntem];
    [self makeButtonTitles];
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

- (void)makeButtonTitles {
    [self.openPalette setTitle:@"Open Palette" forState:UIControlStateNormal];
    [self.openTimer setTitle:@"Open Timer" forState:UIControlStateNormal];
    [self.draw setTitle:@"Draw" forState:UIControlStateNormal];
    [self.share setTitle:@"Share" forState:UIControlStateNormal];
}

#pragma mark Action

- (void)tapOnRightBarItem {
    RSDrawingsVC *drawVC = [[RSDrawingsVC alloc] initWithNibName:@"RSDrawingsVC" bundle:nil];
    [self.navigationController pushViewController:drawVC animated:NO];
}

@end

//
//  RSPalletVC.m
//  RSSchool_T8
//
//  Created by Anna Ershova on 16.07.2021.
//

#import "RSPalletVC.h"
#import "RSPalleteUnit.h"

@interface RSPalletVC ()

@end

@implementation RSPalletVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self makeViewUI];
    self.topRowView.backgroundColor = [UIColor clearColor];
    self.downRowView.backgroundColor = [UIColor clearColor];
    [self makePaletteUnitsInRow:self.topRowView];
    [self makePaletteUnitsInRow:self.downRowView];
}

- (void)makePaletteUnitsInRow:(UIView*)view {
    NSInteger step = 0;
    for (int i = 0; i < 7; i++)
    {
        RSPalleteUnit *button = [[RSPalleteUnit alloc] initWithFrame:CGRectMake(step, 0, 40, 40)];
        [view addSubview:button];
        step = button.frame.origin.x + button.frame.size.width + 20;
        [self makeStyleForUnit:button];
        
    }
}

- (void)makeStyleForUnit:(RSPalleteUnit*)unit {
    unit.backgroundColor = [UIColor whiteColor];
    UIBezierPath *shadowPath0 = [UIBezierPath bezierPathWithRoundedRect:unit.bounds cornerRadius:10];
    unit.layer.shadowPath = shadowPath0.CGPath;
    unit.layer.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.25].CGColor;
    unit.layer.shadowOffset = CGSizeMake(0, 0);
    unit.layer.shadowOpacity = 1;
    unit.layer.shadowRadius = 2;
    unit.layer.cornerRadius = 10;
    unit.layer.masksToBounds = NO;
}

- (void)makeViewUI {
    UIBezierPath *shadowPath0 = [UIBezierPath bezierPathWithRoundedRect:self.view.layer.bounds cornerRadius:45];
    self.view.layer.shadowPath = shadowPath0.CGPath;
    self.view.layer.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.25].CGColor;
    self.view.layer.shadowOffset = CGSizeMake(0, 0);
    self.view.layer.shadowOpacity = 1;
    self.view.layer.shadowRadius = 4;
    self.view.layer.cornerRadius = 45;
    self.view.layer.masksToBounds = NO;
}

@end

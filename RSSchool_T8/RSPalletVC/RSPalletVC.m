//
//  RSPalletVC.m
//  RSSchool_T8
//
//  Created by Anna Ershova on 16.07.2021.
//

#import "RSPalletVC.h"

@interface RSPalletVC ()

@end

@implementation RSPalletVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self makePaletteUnitsInRow:self.topRowView];
    [self makePaletteUnitsInRow:self.downRowView];
}

- (void)makePaletteUnitsInRow:(UIView*)view {
    NSInteger step = 0;
    for (int i = 0; i < 7; i++)
    {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(step, 0, 40, 40)];
        [view addSubview:button];
        step = button.frame.origin.x + button.frame.size.width + 20;
        button.backgroundColor = [UIColor blueColor];
    }
}

@end

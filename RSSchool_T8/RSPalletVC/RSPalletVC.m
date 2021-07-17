//
//  RSPalletVC.m
//  RSSchool_T8
//
//  Created by Anna Ershova on 16.07.2021.
//

#import "RSPalletVC.h"
#import "RSPalleteUnit.h"
#import "UIColor+RSColor.h"

@interface RSPalletVC ()

@end

@implementation RSPalletVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self makeViewUI];
    self.topRowView.backgroundColor = [UIColor clearColor];
    self.downRowView.backgroundColor = [UIColor clearColor];
    [self makePaletteUnitsInRow:self.topRowView withTag:@0];
    [self makePaletteUnitsInRow:self.downRowView withTag:@6];
    self.arr = @[].mutableCopy;
}

- (void)makePaletteUnitsInRow:(UIView*)view withTag:(NSNumber*)t {
    NSInteger step = 0;
    int tmp = t.intValue;
    for (int i = 0; i < 6; i++)
    {
        RSPalleteUnit *button = [[RSPalleteUnit alloc] initWithFrame:CGRectMake(step, 0, 40, 40)];
        [view addSubview:button];
        step = button.frame.origin.x + button.frame.size.width + 20;
        button.tag = tmp;
        [self makeStyleForUnit:button];
        tmp++;
    }
    [self manageTapsOnUnitsInRow:view];
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
    CALayer *sublayer = [CALayer layer];
    UIColor *color = [UIColor putUnitColorOfUnitTag:@(unit.tag)];
    sublayer.backgroundColor = color.CGColor;
    sublayer.frame = CGRectMake(8, 8, 24, 24);
    sublayer.cornerRadius = 6;
    [unit.layer addSublayer:sublayer];
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

- (void)manageTapsOnUnitsInRow:(UIView*)row {
    for (UIButton *unit in row.subviews)
    {
        if ([unit isKindOfClass:[RSPalleteUnit class]])
        {
            [unit addTarget:self action:@selector(tapOnUnit:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
}

- (BOOL)checkSameElements:(RSPalleteUnit*)sender {
    if ([self.arr containsObject:@(sender.tag)])
    {
        [self resetSublayer:sender];
        [self.arr removeObject:@(sender.tag)];
        return YES;
    }
    return NO;
}

- (void)tapOnUnit:(RSPalleteUnit*)sender {
    BOOL check = [self checkSameElements:sender];
    if (!check)
    {
        if (self.arr == @[].mutableCopy || self.arr.count < 3)
        {
            [self.arr addObject:@(sender.tag)];
        }
        else
        {
            for (UIButton *unit in self.downRowView.subviews)
            {
                if ([unit isKindOfClass:[RSPalleteUnit class]])
                {
                    if (unit.tag == self.arr[0].integerValue)
                    {
                        [self resetSublayer:unit];
                    }
                }
            }
            for (UIButton *unit in self.topRowView.subviews)
            {
                if ([unit isKindOfClass:[RSPalleteUnit class]])
                {
                    if (unit.tag == self.arr[0].integerValue)
                    {
                        [self resetSublayer:unit];
                    }
                }
            }
            [self.arr removeObjectAtIndex:0];
            [self.arr addObject:@(sender.tag)];
        }
    }
    NSLog(@"arr: %@", self.arr);
}

- (void)resetSublayer:(UIButton*)view {
    CALayer *sublayer = [CALayer layer];
    sublayer.backgroundColor = view.layer.sublayers.lastObject.backgroundColor;
    sublayer.frame = CGRectMake(8, 8, 24, 24);
    sublayer.cornerRadius = 8;
    [view.layer.sublayers.lastObject removeFromSuperlayer];
    [view.layer addSublayer:sublayer];
}

@end

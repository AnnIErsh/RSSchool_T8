//
//  RSUIButton.m
//  RSSchool_T8
//
//  Created by Anna Ershova on 16.07.2021.
//

#import "RSUIButton.h"

@implementation RSUIButton

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    [self makeButtonUI];
    return self;
}

- (void)makeButtonUI {
    self.titleLabel.font = [UIFont fontWithName:@"Montserrat-Medium" size:18];
    self.titleLabel.tintColor = [UIColor colorWithRed:0.13 green:0.692 blue:0.557 alpha:1];
    self.backgroundColor = [UIColor whiteColor];
    UIBezierPath *shadowPath0 = [UIBezierPath bezierPathWithRoundedRect:self.layer.bounds cornerRadius:10];
    self.layer.shadowPath = shadowPath0.CGPath;
    self.layer.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.25].CGColor;
    self.layer.shadowOffset = CGSizeMake(0, 0);
    self.layer.shadowOpacity = 1;
    self.layer.shadowRadius = 1;
    self.layer.cornerRadius = 10;
    self.layer.masksToBounds = NO;
}

@end

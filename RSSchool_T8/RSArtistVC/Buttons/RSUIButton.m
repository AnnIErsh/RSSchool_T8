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
    if (self.enabled && !self.selected)
    {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.25].CGColor;
        self.layer.shadowOffset = CGSizeMake(0, 0);
        self.layer.shadowOpacity = 1;
        self.layer.shadowRadius = 2;
        self.clipsToBounds = NO;
        self.layer.cornerRadius = 10;
    }
}

@end

//
//  RSPalleteUnit.m
//  RSSchool_T8
//
//  Created by Anna Ershova on 17.07.2021.
//

#import "RSPalleteUnit.h"

@implementation RSPalleteUnit

- (instancetype)initWithFrame:(CGRect)frame {
    return [super initWithFrame:frame];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.state == UIControlStateHighlighted)
        [self setHighlighted:NO];
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
}

@end

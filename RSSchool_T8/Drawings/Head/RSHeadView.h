//
//  RSHeadView.h
//  RSSchool_T8
//
//  Created by Anna Ershova on 17.07.2021.
//

#import <UIKit/UIKit.h>
#import "RSDrawStateDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface RSHeadView : UIView
@property (strong, nonatomic) NSMutableArray<CAShapeLayer *> *headLayers;
@property (weak, nonatomic) NSTimer *time;
@property (strong, nonatomic) NSArray<UIColor *> *colors;
@property (nonatomic) BOOL stop;
@property (nonatomic, weak) id <RSDrawStateDelegate> delegate;
@end

NS_ASSUME_NONNULL_END

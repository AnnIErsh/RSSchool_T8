//
//  RSPalletVC.h
//  RSSchool_T8
//
//  Created by Anna Ershova on 16.07.2021.
//

#import <UIKit/UIKit.h>
#import "RSpaletteVCDelegate.h"
NS_ASSUME_NONNULL_BEGIN
@class RSUIButton;
@interface RSPalletVC : UIViewController
@property (weak, nonatomic) IBOutlet UIView *topRowView;
@property (weak, nonatomic) IBOutlet UIView *downRowView;
@property (weak, nonatomic) IBOutlet RSUIButton *save;
@property (nonatomic) NSMutableArray<NSNumber *> *arr;
@property (nonatomic, weak) id <RSpaletteVCDelegate> delegate;
@end

NS_ASSUME_NONNULL_END

//
//  RSpaletteVCDelegate.h
//  RSSchool_T8
//
//  Created by Anna Ershova on 17.07.2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol RSpaletteVCDelegate <NSObject>
- (void)passChoosenColors:(NSArray<UIColor*>*)theValue;
@end

NS_ASSUME_NONNULL_END

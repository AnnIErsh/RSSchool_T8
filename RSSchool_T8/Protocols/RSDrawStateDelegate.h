//
//  RSDrawStateDelegate.h
//  RSSchool_T8
//
//  Created by Anna Ershova on 18.07.2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol RSDrawStateDelegate <NSObject>
- (void)isReady:(BOOL)theValue;
@end

NS_ASSUME_NONNULL_END

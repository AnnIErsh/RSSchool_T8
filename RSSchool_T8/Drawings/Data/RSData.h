//
//  RSData.h
//  RSSchool_T8
//
//  Created by Anna Ershova on 18.07.2021.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface RSData : NSObject
@property (strong, nonatomic) NSArray<NSArray<CAShapeLayer *> *> *face;
@property (strong, nonatomic) NSArray<NSArray<CAShapeLayer *> *> *planet;
@property (strong, nonatomic) NSArray<NSArray<CAShapeLayer *> *> *tree;
@property (strong, nonatomic) NSArray<NSArray<CAShapeLayer *> *> *landscape;
@property (strong, nonatomic) NSArray<NSArray<NSNumber *> *> *faceBeginPoints;
@property (strong, nonatomic) NSArray<NSArray<NSNumber *> *> *planetBeginPoints;
@property (strong, nonatomic) NSArray<NSArray<NSNumber *> *> *treeBeginPoints;
@property (strong, nonatomic) NSArray<NSArray<NSNumber *> *> *landscapeBeginPoints;
@end

NS_ASSUME_NONNULL_END

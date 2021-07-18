//
//  RSData.m
//  RSSchool_T8
//
//  Created by Anna Ershova on 18.07.2021.
//

#import "RSData.h"

@implementation RSData

- (NSArray<NSArray<CAShapeLayer *> *> *)face {
    float width = 300;
    float height = 300;
    NSArray<CAShapeLayer *> *points0 = [NSArray arrayWithObjects:
                       [NSValue valueWithCGPoint:CGPointMake(0.28529*width, 0.32059*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.32059*width, 0.38824*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.37206*width, 0.44559*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.45147*width, 0.51176*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.52059*width, 0.52794*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.62647*width, 0.47647*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.70588*width, 0.38824*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.73088*width, 0.35294*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.73088*width, 0.28676*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.73676*width, 0.20735*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.70147*width, 0.17794*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.65294*width, 0.18676*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.62059*width, 0.23676*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.61471*width, 0.30441*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.62647*width, 0.34118*height)], nil];
    NSArray<CAShapeLayer *> *points1 = [NSArray arrayWithObjects:
                       [NSValue valueWithCGPoint:CGPointMake(0.575*width, 0.34853*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.54706*width, 0.35441*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.52353*width, 0.35735*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.49559*width, 0.35441*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.47059*width, 0.35*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.45147*width, 0.34853*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.42941*width, 0.35294*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.41618*width, 0.35882*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.43382*width, 0.36618*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.44706*width, 0.37647*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.46029*width, 0.39118*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.47794*width, 0.39853*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.5*width, 0.40147*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.52059*width, 0.39853*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.54265*width, 0.40147*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.56029*width, 0.39853*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.57941*width, 0.38676*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.6*width, 0.36324*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.61324*width, 0.34559*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.58971*width, 0.34265*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.56324*width, 0.33971*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.53676*width, 0.33382*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.51176*width, 0.33235*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.48235*width, 0.33676*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.45588*width, 0.34265*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.42647*width, 0.34559*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.40588*width, 0.34412*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.43382*width, 0.32647*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.46029*width, 0.30735*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.47794*width, 0.29706*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.49265*width, 0.30147*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.50882*width, 0.30735*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.52794*width, 0.30441*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.54706*width, 0.30147*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.56324*width, 0.30147*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.57206*width, 0.30735*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.58676*width, 0.32206*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.60882*width, 0.33529*height)], nil];
    NSArray<CAShapeLayer *> *points2 = [NSArray arrayWithObjects:
                       [NSValue valueWithCGPoint:CGPointMake(0.62941*width, 0.37794*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.63676*width, 0.39706*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.62647*width, 0.42353*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.60588*width, 0.44853*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.57941*width, 0.46912*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.55147*width, 0.44853*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.52059*width, 0.43676*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.49265*width, 0.43676*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.45735*width, 0.44853*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.43382*width, 0.47647*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.41471*width, 0.51324*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.38088*width, 0.49265*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.35735*width, 0.46324*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.33235*width, 0.43676*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.33235*width, 0.47647*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.33235*width, 0.56029*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.33235*width, 0.61029*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.31176*width, 0.64412*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.27794*width, 0.66912*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.24559*width, 0.68971*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.29706*width, 0.70882*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.33676*width, 0.73382*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.36765*width, 0.775*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.40882*width, 0.82647*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.46471*width, 0.87941*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.52059*width, 0.89853*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.56176*width, 0.89853*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.60588*width, 0.875*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.64559*width, 0.82647*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.675*width, 0.76324*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.70294*width, 0.71618*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.74559*width, 0.69706*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.75588*width, 0.69706*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.73676*width, 0.65147*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.70882*width, 0.56765*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.70294*width, 0.5*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.70294*width, 0.43088*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.68235*width, 0.46324*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.65882*width, 0.48676*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.63676*width, 0.51324*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.58824*width, 0.56029*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.55882*width, 0.60294*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.53382*width, 0.66618*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.525*width, 0.74265*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.525*width, 0.82647*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.525*width, 0.87941*height)], nil];
    return @[points0, points1, points2];
}

- (NSArray<NSArray<CAShapeLayer *> *> *)tree {
    return NULL;
}

- (NSArray<NSArray<CAShapeLayer *> *> *)planet {
    return NULL;
}

- (NSArray<NSArray<CAShapeLayer *> *> *)landscape {
    return NULL;
}

- (NSArray<NSArray<NSNumber *> *> *)faceBeginPoints {
    float width = 300;
    float height = 300;
    return @[
        @[@(0.23971*width), @(0.14412*height)],
        @[@(0.6*width), @(0.35294*height)],
        @[@(0.61618*width),@(0.36029*height)]
    ];
}

- (NSArray<NSArray<NSNumber *> *> *)treeBeginPoints {
    return NULL;
}

- (NSArray<NSArray<NSNumber *> *> *)planetBeginPoints {
    return NULL;
}

- (NSArray<NSValue *> *)landscapeBeginPoints {
    return NULL;
}

@end

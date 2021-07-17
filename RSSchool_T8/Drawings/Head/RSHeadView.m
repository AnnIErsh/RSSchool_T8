//
//  RSHeadView.m
//  RSSchool_T8
//
//  Created by Anna Ershova on 17.07.2021.
//

#import "RSHeadView.h"

@implementation RSHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    _headLayers = @[].mutableCopy;
    return [super initWithFrame:frame];
}

- (void)drawRect:(CGRect)rect {
    [self drawFirstStrokeWithPath];
    [self drawSecondStrokeWithPath];
    [self drawThirdStrokeWithPath];
}

- (void)createPath:(UIBezierPath*)path forPoints:(NSArray*)points withInterval:(float)i {
    for (id point in points)
    {
        [path addLineToPoint:[point CGPointValue]];
        [self.headLayers addObject:[self createLayerWithPath:path color:[UIColor blackColor] andWidth:1]];
    }
    [NSTimer scheduledTimerWithTimeInterval:i
                          target: self
                          selector:@selector(addSublayerToCanvas)
                          userInfo: nil repeats:YES];
}

- (void)addSublayerToCanvas {
    if (self.headLayers.count > 0)
    {
        [self.layer addSublayer:self.headLayers[0]];
        [self.headLayers removeObjectAtIndex:0];
    }
}

- (CAShapeLayer*)createLayerWithPath:(UIBezierPath*)path color:(UIColor*)color andWidth:(NSInteger)w {
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.strokeColor = color.CGColor;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.lineWidth = w;
    layer.lineJoin = kCALineJoinRound;
    layer.lineCap = kCALineCapRound;
    layer.path = path.CGPath;
    return layer;
}

- (void)drawFirstStrokeWithPath {
    UIBezierPath *path0 = [UIBezierPath bezierPath];
    float width = 300;
    float height = 300;
    [path0 moveToPoint:CGPointMake(0.23971*width, 0.14412*height)];
    NSArray *points = [NSArray arrayWithObjects:
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
    [self createPath:path0 forPoints:points withInterval:0.1];
}


- (void)drawSecondStrokeWithPath {
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    float width = 300;
    float height = 300;
    [path1 moveToPoint:CGPointMake(0.6*width, 0.35294*height)];
    NSArray *points = [NSArray arrayWithObjects:
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
    [self createPath:path1 forPoints:points withInterval:0.1];
}

- (void)drawThirdStrokeWithPath {
    UIBezierPath *path2 = [UIBezierPath bezierPath];
    float width = 300;
    float height = 300;
    [path2 moveToPoint:CGPointMake(0.61618*width, 0.36029*height)];
    NSArray *points = [NSArray arrayWithObjects:
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
    [self createPath:path2 forPoints:points withInterval:0.1];
}

@end

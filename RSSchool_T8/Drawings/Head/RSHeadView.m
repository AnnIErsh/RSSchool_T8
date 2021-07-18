//
//  RSHeadView.m
//  RSSchool_T8
//
//  Created by Anna Ershova on 17.07.2021.
//

#import "RSHeadView.h"

@implementation RSHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    _data = [RSData new];
    _stop = NO;
    _stop1 = NO;
    _stop2 = NO;
    _headLayers0 = @[].mutableCopy;
    _headLayers1 = @[].mutableCopy;
    _headLayers2 = @[].mutableCopy;
    return [super initWithFrame:frame];
}

- (void)drawRect:(CGRect)rect {
    if (!self.interval)
        self.interval = 1;
    if (self.colors.count == 0)
    {
        UIColor *black = [UIColor blackColor];
        self.colors = @[black, black, black];
    }
    NSMutableArray<UIColor *> *randoms = self.colors.mutableCopy;
    NSUInteger count = [self.colors count];
    for (NSUInteger i = 0; i < count; i++)
    {
        NSInteger elements = count - i;
        NSInteger n = (arc4random() % elements) + i;
        [randoms exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
    self.colors = randoms.copy;
    if (!self.noDraw)
    {
        UIBezierPath *path0 = [self drawFirstStrokeWithPath];
        UIBezierPath *path1 = [self drawSecondStrokeWithPath];
        UIBezierPath *path2 = [self drawThirdStrokeWithPath];
        float deltaS = self.points0.count;
        self.points1.count > self.points0.count ? deltaS = self.points1.count : deltaS;
        self.points2.count > deltaS ? deltaS = self.points2.count : deltaS;
        self.interval /= deltaS;
        [self drawPath0:path0 path1:path1 andPath2:path2];
    }
    if (self.time && self.time1 && self.time2)
        [self.delegate isReady:YES];
}

- (void)createPath:(UIBezierPath *)path forPoints:(NSArray *)points withInterval:(float)i andColor:(UIColor *)color {
    for (id point in points)
    {
        [path addLineToPoint:[point CGPointValue]];
        [self.headLayers0 addObject:[self createLayerWithPath:path color:color andWidth:1]];
    }
    [self.time invalidate];
    self.time = nil;
    self.time = [NSTimer scheduledTimerWithTimeInterval:i
                                                     target: self
                                                   selector:@selector(addSublayerToCanvas)
                                                   userInfo: nil repeats:YES];
}

- (void)createPath1:(UIBezierPath *)path forPoints:(NSArray *)points withInterval:(float)i andColor:(UIColor *)color {
    for (id point in points)
    {
        [path addLineToPoint:[point CGPointValue]];
        [self.headLayers1 addObject:[self createLayerWithPath:path color:color andWidth:1]];
    }
    [self.time1 invalidate];
    self.time1 = nil;
    self.time1 = [NSTimer scheduledTimerWithTimeInterval:i
                                                     target: self
                                                   selector:@selector(addSublayerToCanvas1)
                                                   userInfo: nil repeats:YES];
}

- (void)createPath2:(UIBezierPath *)path forPoints:(NSArray *)points withInterval:(float)i andColor:(UIColor *)color {
    for (id point in points)
    {
        [path addLineToPoint:[point CGPointValue]];
        [self.headLayers2 addObject:[self createLayerWithPath:path color:color andWidth:1]];
    }
    [self.time2 invalidate];
    self.time2 = nil;
    self.time2 = [NSTimer scheduledTimerWithTimeInterval:i
                                                     target: self
                                                   selector:@selector(addSublayerToCanvas2)
                                                   userInfo: nil repeats:YES];
}

- (void)addSublayerToCanvas {
    if (self.headLayers0.count > 0)
    {
        [self.layer addSublayer:self.headLayers0[0]];
        [self.headLayers0 removeObjectAtIndex:0];
        NSLog(@"timer0...");
    }
    else
    {
        [self.time invalidate];
        self.time = nil;
        NSLog(@"STOP0");
        self.stop = YES;
    }
}

- (void)addSublayerToCanvas1 {
    if (self.headLayers1.count > 0)
    {
        [self.layer addSublayer:self.headLayers1[0]];
        [self.headLayers1 removeObjectAtIndex:0];
        NSLog(@"timer1...");
    }
    else
    {
        [self.time1 invalidate];
        self.time1 = nil;
        self.stop1 = YES;
        NSLog(@"STOP1");
    }
}

- (void)addSublayerToCanvas2 {
    if (self.headLayers2.count > 0)
    {
        [self.layer addSublayer:self.headLayers2[0]];
        [self.headLayers2 removeObjectAtIndex:0];
        NSLog(@"timer2...");
    }
    else
    {
        [self.time2 invalidate];
        self.time2 = nil;
        self.stop2 = YES;
        NSLog(@"STOP2");
    }
}

- (CAShapeLayer*)createLayerWithPath:(UIBezierPath *)path color:(UIColor *)color andWidth:(NSInteger)w {
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.strokeColor = color.CGColor;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.lineWidth = w;
    layer.lineJoin = kCALineJoinRound;
    layer.lineCap = kCALineCapRound;
    layer.path = path.CGPath;
    layer.opacity = 1;
    return layer;
}

- (UIBezierPath *)drawFirstStrokeWithPath {
    UIBezierPath *path0 = [UIBezierPath bezierPath];
    [path0 moveToPoint:CGPointMake(self.data.faceBeginPoints[0][0].floatValue,
                                   self.data.faceBeginPoints[0][1].floatValue)];
    self.points0 = self.data.face[0];
    return path0;
}

- (UIBezierPath *)drawSecondStrokeWithPath {
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    [path1 moveToPoint:CGPointMake(self.data.faceBeginPoints[1][0].floatValue,
                                   self.data.faceBeginPoints[1][1].floatValue)];
    self.points1 = self.data.face[1];
    return path1;
}

- (UIBezierPath *)drawThirdStrokeWithPath {
    UIBezierPath *path2 = [UIBezierPath bezierPath];
    [path2 moveToPoint:CGPointMake(self.data.faceBeginPoints[2][0].floatValue,
                                   self.data.faceBeginPoints[2][1].floatValue)];
    self.points2 = self.data.face[2];
    return path2;
}


- (void)drawPath0:(UIBezierPath *)path0 path1:(UIBezierPath *)path1 andPath2:(UIBezierPath *)path2 {
    [self createPath:path0 forPoints:self.points0 withInterval:self.interval andColor:self.colors[0]];
    [self createPath1:path1 forPoints:self.points1 withInterval:self.interval andColor:self.colors[1]];
    [self createPath2:path2 forPoints:self.points2 withInterval:self.interval andColor:self.colors[2]];
}

@end


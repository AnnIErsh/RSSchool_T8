//
//  RSTreeView.m
//  RSSchool_T8
//
//  Created by Anna Ershova on 19.07.2021.
//

#import "RSTreeView.h"

@implementation RSTreeView

- (instancetype)initWithFrame:(CGRect)frame {
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
       [self drawPath0:path0 path1:path1 andPath2:path2];
   }
   if (self.time && self.time1 && self.time2)
       [self.delegate isReady:YES];
}

- (void)createPath:(UIBezierPath *)path withInterval:(float)i andColor:(UIColor *)color {
    [self.time invalidate];
    self.time = nil;
    self.time = [NSTimer scheduledTimerWithTimeInterval:i
                                                 target:self
                                               selector:@selector(addSublayerToCanvas)
                                               userInfo:nil repeats:YES];
}

- (void)createPath1:(UIBezierPath *)path withInterval:(float)i andColor:(UIColor *)color {
   [self.time1 invalidate];
   self.time1 = nil;
   self.time1 = [NSTimer scheduledTimerWithTimeInterval:i
                                                    target:self
                                                  selector:@selector(addSublayerToCanvas1)
                                                  userInfo:nil repeats:YES];
}

- (void)createPath2:(UIBezierPath *)path withInterval:(float)i andColor:(UIColor *)color {
   [self.time2 invalidate];
   self.time2 = nil;
   self.time2 = [NSTimer scheduledTimerWithTimeInterval:i
                                                    target:self
                                                  selector:@selector(addSublayerToCanvas2)
                                                  userInfo:nil repeats:YES];
}

- (void)addSublayerToCanvas {
   if (self.headLayers0.count > 0)
   {
       [self.layer addSublayer:self.headLayers0[0]];
       [self.headLayers0 removeObjectAtIndex:0];
       NSLog(@"timer...0");
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
       NSLog(@"timer...1");
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
       NSLog(@"timer...2");
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
    float width = 300;
    float height = 300;
    [path0 moveToPoint:CGPointMake(0.688*width, 0.25427*height)];
    [path0 addCurveToPoint:CGPointMake(0.7*width, 0.225*height) controlPoint1:CGPointMake(0.69545*width, 0.24639*height) controlPoint2:CGPointMake(0.7*width, 0.23619*height)];
    [path0 addLineToPoint:CGPointMake(0.69412*width, 0.225*height)];
    [path0 addCurveToPoint:CGPointMake(0.68373*width, 0.25023*height) controlPoint1:CGPointMake(0.69412*width, 0.23454*height) controlPoint2:CGPointMake(0.69025*width, 0.24333*height)];
    [path0 addLineToPoint:CGPointMake(0.688*width, 0.25427*height)];
    [path0 closePath];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.7*width,  0.225*height)];
    [path0 addCurveToPoint:CGPointMake(0.64853*width, 0.17941*height) controlPoint1:CGPointMake(0.7*width, 0.19948*height) controlPoint2:CGPointMake(0.67659*width, 0.17941*height)];
    [path0 addLineToPoint:CGPointMake(0.64853*width, 0.18529*height)];
    [path0 addCurveToPoint:CGPointMake(0.69412*width, 0.225*height) controlPoint1:CGPointMake(0.67408*width, 0.18529*height) controlPoint2:CGPointMake(0.69412*width, 0.20342*height)];
    [path0 addLineToPoint:CGPointMake(0.7*width, 0.225*height)];
    [path0 closePath];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.64853*width,  0.17941*height)];
    [path0 addCurveToPoint:CGPointMake(0.63448*width, 0.18113*height) controlPoint1:CGPointMake(0.64366*width, 0.17941*height) controlPoint2:CGPointMake(0.63895*width, 0.18001*height)];
    [path0 addLineToPoint:CGPointMake(0.63591*width, 0.18684*height)];
    [path0 addCurveToPoint:CGPointMake(0.64853*width, 0.18529*height) controlPoint1:CGPointMake(0.63991*width, 0.18583*height) controlPoint2:CGPointMake(0.64414*width, 0.18529*height)];
    [path0 addLineToPoint:CGPointMake(0.64853*width, 0.17941*height)];
    [path0 closePath];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.63813*width,  0.18377*height)];
    [path0 addCurveToPoint:CGPointMake(0.58676*width, 0.14118*height) controlPoint1:CGPointMake(0.63636*width, 0.15968*height) controlPoint2:CGPointMake(0.61373*width, 0.14118*height)];
    [path0 addLineToPoint:CGPointMake(0.58676*width,0.14706*height)];
    [path0 addCurveToPoint:CGPointMake(0.63226*width, 0.1842*height) controlPoint1:CGPointMake(0.61128*width, 0.14706*height) controlPoint2:CGPointMake(0.63076*width, 0.16378*height)];
    [path0 addLineToPoint:CGPointMake(0.63813*width,0.18377*height)];
    [path0 closePath];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.58676*width,  0.14118*height)];
    [path0 addCurveToPoint:CGPointMake(0.56224*width, 0.14667*height) controlPoint1:CGPointMake(0.5779*width, 0.14118*height) controlPoint2:CGPointMake(0.56955*width, 0.14316*height)];
    [path0 addLineToPoint:CGPointMake(0.56479*width, 0.15197*height)];
    [path0 addCurveToPoint:CGPointMake(0.58676*width, 0.14706*height) controlPoint1:CGPointMake(0.5713*width, 0.14885*height) controlPoint2:CGPointMake(0.57878*width, 0.14706*height)];
    [path0 addLineToPoint:CGPointMake(0.58676*width, 0.14118*height)];
    [path0 closePath];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.56536*width, 0.14702*height)];
    [path0 addCurveToPoint:CGPointMake(0.53088*width, 0.13529*height) controlPoint1:CGPointMake(0.5562*width, 0.13971*height) controlPoint2:CGPointMake(0.5441*width, 0.13529*height)];
    [path0 addLineToPoint:CGPointMake(0.53088*width, 0.14118*height)];
    [path0 addCurveToPoint:CGPointMake(0.56168*width, 0.15162*height) controlPoint1:CGPointMake(0.5428*width, 0.14118*height) controlPoint2:CGPointMake(0.5536*width, 0.14516*height)];
    [path0 addLineToPoint:CGPointMake(0.56536*width, 0.14702*height)];
    [path0 closePath];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.53088*width, 0.13529*height)];
    [path0 addCurveToPoint:CGPointMake(0.51683*width, 0.13701*height) controlPoint1:CGPointMake(0.52601*width, 0.13529*height) controlPoint2:CGPointMake(0.5213*width, 0.13589*height)];
    [path0 addLineToPoint:CGPointMake(0.51826*width, 0.14272*height)];
    [path0 addCurveToPoint:CGPointMake(0.53088*width, 0.14118*height) controlPoint1:CGPointMake(0.52226*width, 0.14172*height) controlPoint2:CGPointMake(0.5265*width, 0.14118*height)];
    [path0 addLineToPoint:CGPointMake(0.53088*width, 0.13529*height)];
    [path0 closePath];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.52048*width, 0.13965*height)];
    [path0 addCurveToPoint:CGPointMake(0.46912*width, 0.09706*height) controlPoint1:CGPointMake(0.51871*width, 0.11556*height) controlPoint2:CGPointMake(0.49608*width, 0.09706*height)];
    [path0 addLineToPoint:CGPointMake(0.46912*width, 0.10294*height)];
    [path0 addCurveToPoint:CGPointMake(0.51461*width, 0.14008*height) controlPoint1:CGPointMake(0.49364*width, 0.10294*height) controlPoint2:CGPointMake(0.51312*width, 0.11966*height)];
    [path0 addLineToPoint:CGPointMake(0.52048*width, 0.13965*height)];
    [path0 closePath];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.46912*width, 0.09706*height)];
    [path0 addCurveToPoint:CGPointMake(0.42582*width, 0.11798*height) controlPoint1:CGPointMake(0.45104*width, 0.09706*height) controlPoint2:CGPointMake(0.43503*width, 0.10532*height)];
    [path0 addLineToPoint:CGPointMake(0.43057*width, 0.12144*height)];
    [path0 addCurveToPoint:CGPointMake(0.46912*width, 0.10294*height) controlPoint1:CGPointMake(0.43861*width, 0.1104*height) controlPoint2:CGPointMake(0.4528*width, 0.10294*height)];
    [path0 addLineToPoint:CGPointMake(0.46912*width, 0.09706*height)];
    [path0 closePath];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.429*width, 0.11688*height)];
    [path0 addCurveToPoint:CGPointMake(0.41324*width, 0.11471*height) controlPoint1:CGPointMake(0.42403*width, 0.11547*height) controlPoint2:CGPointMake(0.41873*width, 0.11471*height)];
    [path0 addLineToPoint:CGPointMake(0.41324*width, 0.12059*height)];
    [path0 addCurveToPoint:CGPointMake(0.42739*width, 0.12254*height) controlPoint1:CGPointMake(0.41818*width, 0.12059*height) controlPoint2:CGPointMake(0.42294*width, 0.12127*height)];
    [path0 addLineToPoint:CGPointMake(0.429*width, 0.11688*height)];
    [path0 closePath];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.41324*width, 0.11471*height)];
    [path0 addCurveToPoint:CGPointMake(0.38314*width, 0.1233*height) controlPoint1:CGPointMake(0.40202*width, 0.11471*height) controlPoint2:CGPointMake(0.39162*width, 0.11788*height)];
    [path0 addLineToPoint:CGPointMake(0.38631*width,  0.12826*height)];
    [path0 addCurveToPoint:CGPointMake(0.41324*width, 0.12059*height) controlPoint1:CGPointMake(0.39383*width, 0.12345*height) controlPoint2:CGPointMake(0.40314*width, 0.12059*height)];
    [path0 addLineToPoint:CGPointMake(0.41324*width, 0.11471*height)];
    [path0 closePath];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.38556*width, 0.12296*height)];
    [path0 addCurveToPoint:CGPointMake(0.36912*width, 0.12059*height) controlPoint1:CGPointMake(0.38039*width, 0.12142*height) controlPoint2:CGPointMake(0.37486*width, 0.12059*height)];
    [path0 addLineToPoint:CGPointMake(0.36912*width, 0.12647*height)];
    [path0 addCurveToPoint:CGPointMake(0.38388*width, 0.1286*height) controlPoint1:CGPointMake(0.37429*width, 0.12647*height) controlPoint2:CGPointMake(0.37926*width, 0.12722*height)];
    [path0 addLineToPoint:CGPointMake(0.38556*width, 0.12296*height)];
    [path0 closePath];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.36912*width, 0.12059*height)];
    [path0 addCurveToPoint:CGPointMake(0.32582*width, 0.14151*height) controlPoint1:CGPointMake(0.35104*width, 0.12059*height) controlPoint2:CGPointMake(0.33503*width, 0.12885*height)];
    [path0 addLineToPoint:CGPointMake(0.33057*width, 0.14497*height)];
    [path0 addCurveToPoint:CGPointMake(0.36912*width, 0.12647*height) controlPoint1:CGPointMake(0.33861*width, 0.13393*height) controlPoint2:CGPointMake(0.3528*width, 0.12647*height)];
    [path0 addLineToPoint:CGPointMake(0.36912*width, 0.12059*height)];
    [path0 closePath];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.329*width, 0.14041*height)];
    [path0 addCurveToPoint:CGPointMake(0.31324*width, 0.13824*height) controlPoint1:CGPointMake(0.32403*width, 0.139*height) controlPoint2:CGPointMake(0.31873*width, 0.13824*height)];
    [path0 addLineToPoint:CGPointMake(0.31324*width, 0.14412*height)];
    [path0 addCurveToPoint:CGPointMake(0.32739*width, 0.14607*height) controlPoint1:CGPointMake(0.31818*width, 0.14412*height) controlPoint2:CGPointMake(0.32294*width, 0.1448*height)];
    [path0 addLineToPoint:CGPointMake(0.329*width, 0.14041*height)];
    [path0 closePath];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.31324*width, 0.13824*height)];
    [path0 addCurveToPoint:CGPointMake(0.26176*width, 0.18382*height) controlPoint1:CGPointMake(0.28518*width, 0.13824*height) controlPoint2:CGPointMake(0.26176*width, 0.1583*height)];
    [path0 addLineToPoint:CGPointMake(0.26765*width, 0.18382*height)];
    [path0 addCurveToPoint:CGPointMake(0.31324*width, 0.14412*height) controlPoint1:CGPointMake(0.26765*width, 0.16224*height) controlPoint2:CGPointMake(0.28769*width, 0.14412*height)];
    [path0 addLineToPoint:CGPointMake(0.31324*width, 0.13824*height)];
    [path0 closePath];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.26176*width, 0.18382*height)];
    [path0 addCurveToPoint:CGPointMake(0.2618*width, 0.18548*height) controlPoint1:CGPointMake(0.26176*width, 0.18438*height) controlPoint2:CGPointMake(0.26178*width, 0.18493*height)];
    [path0 addLineToPoint:CGPointMake(0.26768*width, 0.18525*height)];
    [path0 addCurveToPoint:CGPointMake(0.26765*width, 0.18382*height) controlPoint1:CGPointMake(0.26766*width, 0.18477*height) controlPoint2:CGPointMake(0.26765*width, 0.1843*height)];
    [path0 addLineToPoint:CGPointMake(0.26176*width, 0.18382*height)];
    [path0 closePath];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.26264*width, 0.1833*height)];
    [path0 addCurveToPoint:CGPointMake(0.25817*width, 0.18857*height) controlPoint1:CGPointMake(0.26101*width, 0.18496*height) controlPoint2:CGPointMake(0.25952*width, 0.18672*height)];
    [path0 addLineToPoint:CGPointMake(0.26293*width, 0.19203*height)];
    [path0 addCurveToPoint:CGPointMake(0.26683*width, 0.18743*height) controlPoint1:CGPointMake(0.2641*width, 0.19042*height) controlPoint2:CGPointMake(0.26541*width, 0.18888*height)];
    [path0 addLineToPoint:CGPointMake(0.26264*width, 0.1833*height)];
    [path0 closePath];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.26135*width, 0.18747*height)];
    [path0 addCurveToPoint:CGPointMake(0.24559*width, 0.18529*height) controlPoint1:CGPointMake(0.25638*width, 0.18606*height) controlPoint2:CGPointMake(0.25108*width, 0.18529*height)];
    [path0 addLineToPoint:CGPointMake(0.24559*width, 0.19118*height)];
    [path0 addCurveToPoint:CGPointMake(0.25974*width, 0.19313*height) controlPoint1:CGPointMake(0.25054*width, 0.19118*height) controlPoint2:CGPointMake(0.25529*width, 0.19186*height)];
    [path0 addLineToPoint:CGPointMake(0.26135*width, 0.18747*height)];
    [path0 closePath];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.24559*width, 0.18529*height)];
    [path0 addCurveToPoint:CGPointMake(0.19412*width, 0.23088*height) controlPoint1:CGPointMake(0.21753*width, 0.18529*height) controlPoint2:CGPointMake(0.19412*width, 0.20536*height)];
    [path0 addLineToPoint:CGPointMake(0.2*width, 0.23088*height)];
    [path0 addCurveToPoint:CGPointMake(0.24559*width, 0.19118*height) controlPoint1:CGPointMake(0.2*width, 0.2093*height) controlPoint2:CGPointMake(0.22004*width, 0.19118*height)];
    [path0 addLineToPoint:CGPointMake(0.24559*width, 0.18529*height)];
    [path0 closePath];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.19412*width, 0.23088*height)];
    [path0 addCurveToPoint:CGPointMake(0.19913*width, 0.25053*height) controlPoint1:CGPointMake(0.19412*width, 0.23793*height) controlPoint2:CGPointMake(0.19592*width, 0.24459*height)];
    [path0 addLineToPoint:CGPointMake(0.2043*width, 0.24774*height)];
    [path0 addCurveToPoint:CGPointMake(0.2*width, 0.23088*height) controlPoint1:CGPointMake(0.20154*width, 0.24261*height) controlPoint2:CGPointMake(0.2*width, 0.2369*height)];
    [path0 addLineToPoint:CGPointMake(0.19412*width, 0.23088*height)];
    [path0 closePath];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.19934*width, 0.24741*height)];
    [path0 addCurveToPoint:CGPointMake(0.19118*width, 0.27206*height) controlPoint1:CGPointMake(0.19419*width, 0.25449*height) controlPoint2:CGPointMake(0.19118*width, 0.26295*height)];
    [path0 addLineToPoint:CGPointMake(0.19706*width, 0.27206*height)];
    [path0 addCurveToPoint:CGPointMake(0.2041*width, 0.25087*height) controlPoint1:CGPointMake(0.19706*width, 0.26429*height) controlPoint2:CGPointMake(0.19962*width, 0.25702*height)];
    [path0 addLineToPoint:CGPointMake(0.19934*width, 0.24741*height)];
    [path0 closePath];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.19118*width, 0.27206*height)];
    [path0 addCurveToPoint:CGPointMake(0.19495*width, 0.28924*height) controlPoint1:CGPointMake(0.19118*width, 0.27814*height) controlPoint2:CGPointMake(0.19252*width, 0.28394*height)];
    [path0 addLineToPoint:CGPointMake(0.2003*width, 0.28679*height)];
    [path0 addCurveToPoint:CGPointMake(0.19706*width, 0.27206*height) controlPoint1:CGPointMake(0.19821*width, 0.28223*height) controlPoint2:CGPointMake(0.19706*width, 0.27726*height)];
    [path0 addLineToPoint:CGPointMake(0.19118*width, 0.27206*height)];
    [path0 closePath];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.19537*width, 0.28613*height)];
    [path0 addCurveToPoint:CGPointMake(0.18529*width, 0.31324*height) controlPoint1:CGPointMake(0.18906*width, 0.29367*height) controlPoint2:CGPointMake(0.18529*width, 0.30305*height)];
    [path0 addLineToPoint:CGPointMake(0.19118*width, 0.31324*height)];
    [path0 addCurveToPoint:CGPointMake(0.19988*width, 0.2899*height) controlPoint1:CGPointMake(0.19118*width, 0.30455*height) controlPoint2:CGPointMake(0.19438*width, 0.29648*height)];
    [path0 addLineToPoint:CGPointMake(0.19537*width, 0.28613*height)];
    [path0 closePath];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.18529*width, 0.31324*height)];
    [path0 addCurveToPoint:CGPointMake(0.1903*width, 0.33289*height) controlPoint1:CGPointMake(0.18529*width, 0.32028*height) controlPoint2:CGPointMake(0.1871*width, 0.32694*height)];
    [path0 addLineToPoint:CGPointMake(0.19548*width, 0.33009*height)];
    [path0 addCurveToPoint:CGPointMake(0.19118*width, 0.31324*height) controlPoint1:CGPointMake(0.19271*width, 0.32497*height) controlPoint2:CGPointMake(0.19118*width, 0.31926*height)];
    [path0 addLineToPoint:CGPointMake(0.18529*width, 0.31324*height)];
    [path0 closePath];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.19051*width, 0.32976*height)];
    [path0 addCurveToPoint:CGPointMake(0.18235*width, 0.35441*height) controlPoint1:CGPointMake(0.18537*width, 0.33684*height) controlPoint2:CGPointMake(0.18235*width, 0.34531*height)];
    [path0 addLineToPoint:CGPointMake(0.18824*width, 0.35441*height)];
    [path0 addCurveToPoint:CGPointMake(0.19527*width, 0.33322*height) controlPoint1:CGPointMake(0.18824*width, 0.34664*height) controlPoint2:CGPointMake(0.1908*width, 0.33937*height)];
    [path0 addLineToPoint:CGPointMake(0.19051*width, 0.32976*height)];
    [path0 closePath];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.18235*width, 0.35441*height)];
    [path0 addCurveToPoint:CGPointMake(0.23382*width, 0.4*height) controlPoint1:CGPointMake(0.18235*width, 0.37994*height) controlPoint2:CGPointMake(0.20577*width, 0.4*height)];
    [path0 addLineToPoint:CGPointMake(0.23382*width, 0.39412*height)];
    [path0 addCurveToPoint:CGPointMake(0.18824*width, 0.35441*height) controlPoint1:CGPointMake(0.20828*width, 0.39412*height) controlPoint2:CGPointMake(0.18824*width, 0.37599*height)];
    [path0 addLineToPoint:CGPointMake(0.18235*width, 0.35441*height)];
    [path0 closePath];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.23382*width, 0.4*height)];
    [path0 addCurveToPoint:CGPointMake(0.24056*width, 0.39961*height) controlPoint1:CGPointMake(0.23611*width, 0.4*height) controlPoint2:CGPointMake(0.23836*width, 0.39987*height)];
    [path0 addLineToPoint:CGPointMake(0.23989*width, 0.39377*height)];
    [path0 addCurveToPoint:CGPointMake(0.23382*width, 0.39412*height) controlPoint1:CGPointMake(0.2379*width, 0.394*height) controlPoint2:CGPointMake(0.23588*width, 0.39412*height)];
    [path0 addLineToPoint:CGPointMake(0.23382*width, 0.4*height)];
    [path0 closePath];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.23766*width, 0.39812*height)];
    [path0 addCurveToPoint:CGPointMake(0.28382*width, 0.42353*height) controlPoint1:CGPointMake(0.24612*width, 0.41329*height) controlPoint2:CGPointMake(0.26371*width, 0.42353*height)];
    [path0 addLineToPoint:CGPointMake(0.28382*width, 0.41765*height)];
    [path0 addCurveToPoint:CGPointMake(0.24279*width, 0.39526*height) controlPoint1:CGPointMake(0.26565*width, 0.41765*height) controlPoint2:CGPointMake(0.25012*width, 0.4084*height)];
    [path0 addLineToPoint:CGPointMake(0.23766*width, 0.39812*height)];
    [path0 closePath];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.28382*width, 0.42353*height)];
    [path0 addCurveToPoint:CGPointMake(0.30818*width, 0.41811*height) controlPoint1:CGPointMake(0.29262*width, 0.42353*height) controlPoint2:CGPointMake(0.30092*width, 0.42157*height)];
    [path0 addLineToPoint:CGPointMake(0.30565*width, 0.41281*height)];
    [path0 addCurveToPoint:CGPointMake(0.28382*width, 0.41765*height) controlPoint1:CGPointMake(0.29918*width, 0.41589*height) controlPoint2:CGPointMake(0.29175*width, 0.41765*height)];
    [path0 addLineToPoint:CGPointMake(0.28382*width, 0.42353*height)];
    [path0 closePath];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.30428*width, 0.41676*height)];
    [path0 addCurveToPoint:CGPointMake(0.35147*width, 0.44412*height) controlPoint1:CGPointMake(0.31228*width, 0.43299*height) controlPoint2:CGPointMake(0.33051*width, 0.44412*height)];
    [path0 addLineToPoint:CGPointMake(0.35147*width, 0.43824*height)];
    [path0 addCurveToPoint:CGPointMake(0.30955*width, 0.41416*height) controlPoint1:CGPointMake(0.33252*width, 0.43824*height) controlPoint2:CGPointMake(0.31646*width, 0.42819*height)];
    [path0 addLineToPoint:CGPointMake(0.30428*width, 0.41676*height)];
    [path0 closePath];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.35147*width,0.44412*height)];
    [path0 addCurveToPoint:CGPointMake(0.35821*width, 0.44373*height) controlPoint1:CGPointMake(0.35375*width, 0.44412*height) controlPoint2:CGPointMake(0.356*width, 0.44399*height)];
    [path0 addLineToPoint:CGPointMake(0.35753*width, 0.43789*height)];
    [path0 addCurveToPoint:CGPointMake(0.35147*width, 0.43824*height) controlPoint1:CGPointMake(0.35555*width, 0.43812*height) controlPoint2:CGPointMake(0.35353*width, 0.43824*height)];
    [path0 addLineToPoint:CGPointMake(0.35147*width, 0.44412*height)];
    [path0 closePath];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.3553*width, 0.44224*height)];
    [path0 addCurveToPoint:CGPointMake(0.40147*width, 0.46765*height) controlPoint1:CGPointMake(0.36376*width, 0.45741*height) controlPoint2:CGPointMake(0.38136*width, 0.46765*height)];
    [path0 addLineToPoint:CGPointMake(0.40147*width,  0.46176*height)];
    [path0 addCurveToPoint:CGPointMake(0.36044*width, 0.43938*height) controlPoint1:CGPointMake(0.38329*width, 0.46176*height) controlPoint2:CGPointMake(0.36777*width, 0.45251*height)];
    [path0 addLineToPoint:CGPointMake(0.3553*width, 0.44224*height)];
    [path0 closePath];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.40147*width, 0.46765*height)];
    [path0 addCurveToPoint:CGPointMake(0.42785*width, 0.46122*height) controlPoint1:CGPointMake(0.41109*width, 0.46765*height) controlPoint2:CGPointMake(0.42012*width, 0.46531*height)];
    [path0 addLineToPoint:CGPointMake(0.42509*width, 0.45602*height)];
    [path0 addCurveToPoint:CGPointMake(0.40147*width, 0.46176*height) controlPoint1:CGPointMake(0.41822*width, 0.45966*height) controlPoint2:CGPointMake(0.41014*width, 0.46176*height)];
    [path0 addLineToPoint:CGPointMake(0.40147*width, 0.46765*height)];
    [path0 closePath];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.42509*width, 0.46122*height)];
    [path0 addCurveToPoint:CGPointMake(0.43956*width, 0.46642*height) controlPoint1:CGPointMake(0.42954*width, 0.46357*height) controlPoint2:CGPointMake(0.4344*width, 0.46534*height)];
    [path0 addLineToPoint:CGPointMake(0.44077*width, 0.46066*height)];
    [path0 addCurveToPoint:CGPointMake(0.42785*width, 0.45602*height) controlPoint1:CGPointMake(0.43614*width, 0.45969*height) controlPoint2:CGPointMake(0.4318*width, 0.45811*height)];
    [path0 addLineToPoint:CGPointMake(0.42509*width, 0.46122*height)];
    [path0 closePath];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.438*width,  0.46553*height)];
    [path0 addCurveToPoint:CGPointMake(0.47794*width, 0.48235*height) controlPoint1:CGPointMake(0.44748*width, 0.47584*height) controlPoint2:CGPointMake(0.46189*width, 0.48235*height)];
    [path0 addLineToPoint:CGPointMake(0.47794*width, 0.47647*height)];
    [path0 addCurveToPoint:CGPointMake(0.44234*width, 0.46155*height) controlPoint1:CGPointMake(0.46347*width, 0.47647*height) controlPoint2:CGPointMake(0.45065*width, 0.4706*height)];
    [path0 addLineToPoint:CGPointMake(0.438*width, 0.46553*height)];
    [path0 closePath];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.47794*width, 0.48235*height)];
    [path0 addCurveToPoint:CGPointMake(0.5023*width, 0.47694*height) controlPoint1:CGPointMake(0.48674*width, 0.48235*height) controlPoint2:CGPointMake(0.49504*width, 0.4804*height)];
    [path0 addLineToPoint:CGPointMake(0.49977*width, 0.47163*height)];
    [path0 addCurveToPoint:CGPointMake(0.47794*width, 0.47647*height) controlPoint1:CGPointMake(0.4933*width, 0.47471*height) controlPoint2:CGPointMake(0.48586*width, 0.47647*height)];
    [path0 addLineToPoint:CGPointMake(0.47794*width, 0.48235*height)];
    [path0 closePath];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.49839*width, 0.47558*height)];
    [path0 addCurveToPoint:CGPointMake(0.54559*width, 0.50294*height) controlPoint1:CGPointMake(0.50639*width, 0.49182*height) controlPoint2:CGPointMake(0.52463*width, 0.50294*height)];
    [path0 addLineToPoint:CGPointMake(0.54559*width, 0.49706*height)];
    [path0 addCurveToPoint:CGPointMake(0.50367*width, 0.47298*height) controlPoint1:CGPointMake(0.52664*width, 0.49706*height) controlPoint2:CGPointMake(0.51058*width, 0.48701*height)];
    [path0 addLineToPoint:CGPointMake(0.49839*width, 0.47558*height)];
    [path0 closePath];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.54559*width, 0.50294*height)];
    [path0 addCurveToPoint:CGPointMake(.55233*width, 0.50255*height) controlPoint1:CGPointMake(0.54787*width, 0.50294*height) controlPoint2:CGPointMake(0.55012*width, 0.50281*height)];
    [path0 addLineToPoint:CGPointMake(0.55165*width, 0.49671*height)];
    [path0 addCurveToPoint:CGPointMake(0.54559*width, 0.49706*height) controlPoint1:CGPointMake(0.54967*width, 0.49694*height) controlPoint2:CGPointMake(0.54764*width, 0.49706*height)];
    [path0 addLineToPoint:CGPointMake(0.54559*width, 0.50294*height)];
    [path0 closePath];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.54942*width, 0.50106*height)];
    [path0 addCurveToPoint:CGPointMake(0.59559*width, 0.52647*height) controlPoint1:CGPointMake(0.55788*width, 0.51623*height) controlPoint2:CGPointMake(0.57547*width, 0.52647*height)];
    [path0 addLineToPoint:CGPointMake(0.59559*width, 0.52059*height)];
    [path0 addCurveToPoint:CGPointMake(0.55456*width, 0.4982*height) controlPoint1:CGPointMake(0.57741*width, 0.52059*height) controlPoint2:CGPointMake(0.56189*width, 0.51134*height)];
    [path0 addLineToPoint:CGPointMake(0.54942*width, 0.50106*height)];
    [path0 closePath];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.59559*width, 0.52647*height)];
    [path0 addCurveToPoint:CGPointMake(0.62196*width, 0.52004*height) controlPoint1:CGPointMake(0.60521*width, 0.52647*height) controlPoint2:CGPointMake(0.61424*width, 0.52413*height)];
    [path0 addLineToPoint:CGPointMake(0.61921*width, 0.51484*height)];
    [path0 addCurveToPoint:CGPointMake(0.59559*width, 0.52059*height) controlPoint1:CGPointMake(0.61234*width, 0.51848*height) controlPoint2:CGPointMake(0.60426*width, 0.52059*height)];
    [path0 addLineToPoint:CGPointMake(0.59559*width, 0.52647*height)];
    [path0 closePath];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.61921*width, 0.52004*height)];
    [path0 addCurveToPoint:CGPointMake(0.64559*width, 0.52647*height) controlPoint1:CGPointMake(0.62694*width, 0.52413*height) controlPoint2:CGPointMake(0.63597*width, 0.52647*height)];
    [path0 addLineToPoint:CGPointMake(0.64559*width, 0.52059*height)];
    [path0 addCurveToPoint:CGPointMake(0.62196*width, 0.51484*height) controlPoint1:CGPointMake(0.63692*width, 0.52059*height) controlPoint2:CGPointMake(0.62884*width, 0.51848*height)];
    [path0 addLineToPoint:CGPointMake(0.61921*width, 0.52004*height)];
    [path0 closePath];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.64559*width, 0.52647*height)];
    [path0 addCurveToPoint:CGPointMake(0.69706*width, 0.48088*height) controlPoint1:CGPointMake(0.67365*width, 0.52647*height) controlPoint2:CGPointMake(0.69706*width, 0.50641*height)];
    [path0 addLineToPoint:CGPointMake(0.69118*width, 0.48088*height)];
    [path0 addCurveToPoint:CGPointMake(0.64559*width, 0.52059*height) controlPoint1:CGPointMake(0.69118*width, 0.50246*height) controlPoint2:CGPointMake(0.67114*width, 0.52059*height)];
    [path0 addLineToPoint:CGPointMake(0.64559*width, 0.52647*height)];
    [path0 closePath];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.69706*width, 0.48088*height)];
    [path0 addCurveToPoint:CGPointMake(0.69703*width, 0.47928*height) controlPoint1:CGPointMake(0.69706*width, 0.48034*height) controlPoint2:CGPointMake(0.69705*width, 0.47981*height)];
    [path0 addLineToPoint:CGPointMake(0.69115*width, 0.47951*height)];
    [path0 addCurveToPoint:CGPointMake(0.69118*width, 0.48088*height) controlPoint1:CGPointMake(0.69117*width, 0.47996*height) controlPoint2:CGPointMake(0.69118*width, 0.48042*height)];
    [path0 addLineToPoint:CGPointMake(0.69706*width, 0.48088*height)];
    [path0 closePath];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.69401*width, 0.48233*height)];
    [path0 addCurveToPoint:CGPointMake(0.69559*width, 0.48235*height) controlPoint1:CGPointMake(0.69454*width, 0.48235*height) controlPoint2:CGPointMake(0.69506*width, 0.48235*height)];
    [path0 addLineToPoint:CGPointMake(0.69559*width, 0.47647*height)];
    [path0 addCurveToPoint:CGPointMake(0.69417*width, 0.47645*height) controlPoint1:CGPointMake(0.69511*width, 0.47647*height) controlPoint2:CGPointMake(0.69464*width, 0.47646*height)];
    [path0 addLineToPoint:CGPointMake(0.69401*width, 0.48233*height)];
    [path0 closePath];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.69559*width, 0.48235*height)];
    [path0 addCurveToPoint:CGPointMake(0.72196*width, 0.47592*height) controlPoint1:CGPointMake(0.70521*width, 0.48235*height) controlPoint2:CGPointMake(0.71424*width, 0.48001*height)];
    [path0 addLineToPoint:CGPointMake(0.71921*width, 0.47073*height)];
    [path0 addCurveToPoint:CGPointMake(0.69559*width, 0.47647*height) controlPoint1:CGPointMake(0.71234*width, 0.47436*height) controlPoint2:CGPointMake(0.70426*width, 0.47647*height)];
    [path0 addLineToPoint:CGPointMake(0.69559*width, 0.48235*height)];
    [path0 closePath];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.71921*width, 0.47592*height)];
    [path0 addCurveToPoint:CGPointMake(0.74559*width, 0.48235*height) controlPoint1:CGPointMake(0.72694*width, 0.48001*height) controlPoint2:CGPointMake(0.73597*width, 0.48235*height)];
    [path0 addLineToPoint:CGPointMake(0.74559*width, 0.47647*height)];
    [path0 addCurveToPoint:CGPointMake(0.72196*width, 0.47073*height) controlPoint1:CGPointMake(0.73692*width, 0.47647*height) controlPoint2:CGPointMake(0.72884*width, 0.47436*height)];
    [path0 addLineToPoint:CGPointMake(0.71921*width, 0.47592*height)];
    [path0 closePath];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.74559*width, 0.48235*height)];
    [path0 addCurveToPoint:CGPointMake(0.79706*width, 0.43676*height) controlPoint1:CGPointMake(0.77365*width, 0.48235*height) controlPoint2:CGPointMake(0.79706*width, 0.46229*height)];
    [path0 addLineToPoint:CGPointMake(0.79118*width, 0.43676*height)];
    [path0 addCurveToPoint:CGPointMake(0.74559*width, 0.47647*height) controlPoint1:CGPointMake(0.79118*width, 0.45835*height) controlPoint2:CGPointMake(0.77114*width, 0.47647*height)];
    [path0 addLineToPoint:CGPointMake(0.74559*width, 0.48235*height)];
    [path0 closePath];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.79706*width, 0.43676*height)];
    [path0 addCurveToPoint:CGPointMake(0.79599*width, 0.42745*height) controlPoint1:CGPointMake(0.79706*width, 0.43358*height) controlPoint2:CGPointMake(0.79669*width, 0.43046*height)];
    [path0 addLineToPoint:CGPointMake(0.79026*width, 0.42879*height)];
    [path0 addCurveToPoint:CGPointMake(0.79118*width, 0.43676*height) controlPoint1:CGPointMake(0.79086*width, 0.43137*height) controlPoint2:CGPointMake(0.79118*width, 0.43403*height)];
    [path0 addLineToPoint:CGPointMake(0.79706*width, 0.43676*height)];
    [path0 closePath];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.79461*width, 0.43066*height)];
    [path0 addCurveToPoint:CGPointMake(0.81765*width, 0.39265*height) controlPoint1:CGPointMake(0.80838*width, 0.42257*height) controlPoint2:CGPointMake(0.81765*width, 0.40864*height)];
    [path0 addLineToPoint:CGPointMake(0.81176*width, 0.39265*height)];
    [path0 addCurveToPoint:CGPointMake(0.79163*width, 0.42559*height) controlPoint1:CGPointMake(0.81176*width, 0.40624*height) controlPoint2:CGPointMake(0.80389*width, 0.41838*height)];
    [path0 addLineToPoint:CGPointMake(0.79461*width, 0.43066*height)];
    [path0 closePath];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.81765*width, 0.39265*height)];
    [path0 addCurveToPoint:CGPointMake(0.80565*width, 0.36338*height) controlPoint1:CGPointMake(0.81765*width, 0.38146*height) controlPoint2:CGPointMake(0.8131*width, 0.37126*height)];
    [path0 addLineToPoint:CGPointMake(0.80137*width, 0.36742*height)];
    [path0 addCurveToPoint:CGPointMake(0.81176*width, 0.39265*height) controlPoint1:CGPointMake(0.8079*width, 0.37432*height) controlPoint2:CGPointMake(0.81176*width, 0.38311*height)];
    [path0 addLineToPoint:CGPointMake(0.81765*width, 0.39265*height)];
    [path0 closePath];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.80509*width, 0.36788*height)];
    [path0 addCurveToPoint:CGPointMake(0.82647*width, 0.33088*height) controlPoint1:CGPointMake(0.81794*width, 0.35967*height) controlPoint2:CGPointMake(0.82647*width, 0.34622*height)];
    [path0 addLineToPoint:CGPointMake(0.82059*width, 0.33088*height)];
    [path0 addCurveToPoint:CGPointMake(0.80193*width, 0.36292*height) controlPoint1:CGPointMake(0.82059*width, 0.34392*height) controlPoint2:CGPointMake(0.81334*width, 0.35562*height)];
    [path0 addLineToPoint:CGPointMake(0.80509*width, 0.36788*height)];
    [path0 closePath];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.82647*width, 0.33088*height)];
    [path0 addCurveToPoint:CGPointMake(0.775*width, 0.28529*height) controlPoint1:CGPointMake(0.82647*width, 0.30536*height) controlPoint2:CGPointMake(0.80306*width, 0.28529*height)];
    [path0 addLineToPoint:CGPointMake(0.775*width, 0.29118*height)];
    [path0 addCurveToPoint:CGPointMake(0.82059*width, 0.33088*height) controlPoint1:CGPointMake(0.80055*width, 0.29118*height) controlPoint2:CGPointMake(0.82059*width, 0.3093*height)];
    [path0 addLineToPoint:CGPointMake(0.82647*width, 0.33088*height)];
    [path0 closePath];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.775*width, 0.28529*height)];
    [path0 addCurveToPoint:CGPointMake(0.76095*width, 0.28701*height) controlPoint1:CGPointMake(0.77013*width, 0.28529*height) controlPoint2:CGPointMake(0.76542*width, 0.28589*height)];
    [path0 addLineToPoint:CGPointMake(0.76238*width, 0.29272*height)];
    [path0 addCurveToPoint:CGPointMake(0.775*width, 0.29118*height) controlPoint1:CGPointMake(0.76638*width, 0.29172*height) controlPoint2:CGPointMake(0.77061*width, 0.29118*height)];
    [path0 addLineToPoint:CGPointMake(0.775*width, 0.28529*height)];
    [path0 closePath];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.7646*width, 0.28965*height)];
    [path0 addCurveToPoint:CGPointMake(0.71324*width, 0.24706*height) controlPoint1:CGPointMake(0.76283*width, 0.26556*height) controlPoint2:CGPointMake(0.7402*width, 0.24706*height)];
    [path0 addLineToPoint:CGPointMake(0.71324*width, 0.25294*height)];
    [path0 addCurveToPoint:CGPointMake(0.75873*width, 0.29008*height) controlPoint1:CGPointMake(0.73775*width, 0.25294*height) controlPoint2:CGPointMake(0.75724*width, 0.26966*height)];
    [path0 addLineToPoint:CGPointMake(0.7646*width, 0.28965*height)];
    [path0 closePath];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.71324*width, 0.24706*height)];
    [path0 addCurveToPoint:CGPointMake(0.68871*width, 0.25255*height) controlPoint1:CGPointMake(0.70437*width, 0.24706*height) controlPoint2:CGPointMake(0.69602*width, 0.24904*height)];
    [path0 addLineToPoint:CGPointMake(0.69126*width, 0.25785*height)];
    [path0 addCurveToPoint:CGPointMake(0.71324*width, 0.25294*height) controlPoint1:CGPointMake(0.69777*width, 0.25473*height) controlPoint2:CGPointMake(0.70525*width, 0.25294*height)];
    [path0 addLineToPoint:CGPointMake(0.71324*width, 0.24706*height)];
    [path0 closePath];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.69183*width, 0.2529*height)];
    [path0 addCurveToPoint:CGPointMake(0.68745*width, 0.24977*height) controlPoint1:CGPointMake(0.69043*width, 0.25179*height) controlPoint2:CGPointMake(0.68897*width, 0.25074*height)];
    [path0 addLineToPoint:CGPointMake(0.68428*width, 0.25473*height)];
    [path0 addCurveToPoint:CGPointMake(0.68815*width, 0.2575*height) controlPoint1:CGPointMake(0.68563*width, 0.25559*height) controlPoint2:CGPointMake(0.68692*width, 0.25652*height)];
    [path0 addLineToPoint:CGPointMake(0.69183*width, 0.2529*height)];
    [path0 closePath];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    return path0;
}

- (UIBezierPath *)drawSecondStrokeWithPath {
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    float width = 300;
    float height = 300;
    [path1 moveToPoint:CGPointMake(0.3*width, 0.79559*height)];
    [path1 addCurveToPoint:CGPointMake(0.48088*width, 0.61029*height) controlPoint1:CGPointMake(0.35833*width, 0.77843*height) controlPoint2:CGPointMake(0.47618*width, 0.71735*height)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addCurveToPoint:CGPointMake(0.45147*width, 0.47206*height) controlPoint1:CGPointMake(0.48559*width, 0.50324*height) controlPoint2:CGPointMake(0.46324*width, 0.47353*height)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 moveToPoint:CGPointMake(0.72206*width, 0.81176*height)];
    [path1 addCurveToPoint:CGPointMake(0.56471*width, 0.72647*height) controlPoint1:CGPointMake(0.66814*width, 0.80882*height) controlPoint2:CGPointMake(0.56118*width, 0.78765*height)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addCurveToPoint:CGPointMake(0.59706*width, 0.55441*height) controlPoint1:CGPointMake(0.56824*width, 0.66529*height) controlPoint2:CGPointMake(.58774*width, 0.58627*height)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addCurveToPoint:CGPointMake(0.625*width, 0.51912*height) controlPoint1:CGPointMake(0.60343*width, 0.54167*height) controlPoint2:CGPointMake(0.61794*width, 0.51676*height)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 moveToPoint:CGPointMake(0.525*width, 0.54412*height)];
    [path1 addCurveToPoint:CGPointMake(0.50294*width, 0.68824*height) controlPoint1:CGPointMake(0.52059*width, 0.58873*height) controlPoint2:CGPointMake(0.51*width, 0.68*height)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 moveToPoint:CGPointMake(0.53971*width, 0.76324*height)];
    [path1 addCurveToPoint:CGPointMake(0.55441*width, 0.55441*height) controlPoint1:CGPointMake(0.53971*width, 0.73971*height) controlPoint2:CGPointMake(0.53676*width, 0.59706*height)];
    [path1 moveToPoint:CGPointMake(0.48529*width, 0.66912*height)];
    [path1 addCurveToPoint:CGPointMake(0.425*width, 0.75441*height) controlPoint1:CGPointMake(0.44706*width, 0.725*height) controlPoint2:CGPointMake(0.44265*width, 0.73824*height)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    return path1;
}

- (UIBezierPath *)drawThirdStrokeWithPath {
    UIBezierPath *path2 = [UIBezierPath bezierPath];
    float width = 300;
    float height = 300;
    [path2 moveToPoint:CGPointMake(0.35147*width, 0.775*height)];
    [path2 addCurveToPoint:CGPointMake(0.25294*width, 0.79062*height) controlPoint1:CGPointMake(0.32794*width, 0.75*height) controlPoint2:CGPointMake(0.28353*width, 0.7518*height)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 moveToPoint:CGPointMake(0.175*width, 0.80882*height)];
    [path2 addCurveToPoint:CGPointMake(0.24559*width, 0.78824*height) controlPoint1:CGPointMake(0.1848*width, 0.79755*height) controlPoint2:CGPointMake(0.21265*width, 0.77765*height)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addCurveToPoint:CGPointMake(0.27647*width, 0.8*height) controlPoint1:CGPointMake(0.27853*width, 0.79882*height) controlPoint2:CGPointMake(0.2799*width, 0.80049*height)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 moveToPoint:CGPointMake(0.175*width, 0.80882*height)];
    [path2 addCurveToPoint:CGPointMake(0.24559*width, 0.78824*height) controlPoint1:CGPointMake(0.1848*width, 0.79755*height) controlPoint2:CGPointMake(0.21265*width, 0.77765*height)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addCurveToPoint:CGPointMake(0.27647*width, 0.8*height) controlPoint1:CGPointMake(0.27853*width, 0.79882*height) controlPoint2:CGPointMake(0.2799*width, 0.80049*height)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 moveToPoint:CGPointMake(0.525*width, 0.54412*height)];
    [path2 addCurveToPoint:CGPointMake(0.50294*width, 0.68824*height) controlPoint1:CGPointMake(0.52059*width, 0.58873*height) controlPoint2:CGPointMake(0.51*width, 0.68*height)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 moveToPoint:CGPointMake(0.53971*width, 0.76324*height)];
    [path2 addCurveToPoint:CGPointMake(0.55441*width, 0.55441*height) controlPoint1:CGPointMake(0.53971*width, 0.73971*height) controlPoint2:CGPointMake(0.53676*width, 0.59706*height)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 moveToPoint:CGPointMake(0.48529*width, 0.66912*height)];
    [path2 addCurveToPoint:CGPointMake(0.425*width, 0.75441*height) controlPoint1:CGPointMake(0.44706*width, 0.725*height) controlPoint2:CGPointMake(0.44265*width, 0.73824*height)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 moveToPoint:CGPointMake(0.35147*width, 0.775*height)];
    [path2 addCurveToPoint:CGPointMake(0.25294*width, 0.79062*height) controlPoint1:CGPointMake(0.32794*width, 0.75*height) controlPoint2:CGPointMake(0.28353*width, 0.7518*height)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 moveToPoint:CGPointMake(0.175*width, 0.80882*height)];
    [path2 addCurveToPoint:CGPointMake(0.24559*width, 0.78824*height) controlPoint1:CGPointMake(0.1848*width, 0.79755*height) controlPoint2:CGPointMake(0.21265*width, 0.77765*height)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addCurveToPoint:CGPointMake(0.27647*width, 0.8*height) controlPoint1:CGPointMake(0.27853*width, 0.79882*height) controlPoint2:CGPointMake(0.2799*width, 0.80049*height)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 moveToPoint:CGPointMake(0.58235*width, 0.76618*height)];
    [path2 addCurveToPoint:CGPointMake(0.65147*width, 0.76618*height) controlPoint1:CGPointMake(0.59706*width, 0.75803*height) controlPoint2:CGPointMake(0.63147*width, 0.74662*height)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addCurveToPoint:CGPointMake(0.66689*width, 0.78382*height) controlPoint1:CGPointMake(0.65816*width, 0.77272*height) controlPoint2:CGPointMake(0.66318*width, 0.77866*height)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 moveToPoint:CGPointMake(0.67647*width, 0.80441*height)];
    [path2 addCurveToPoint:CGPointMake(0.66689*width, 0.78382*height) controlPoint1:CGPointMake(0.67647*width, 0.80135*height) controlPoint2:CGPointMake(0.67426*width, 0.7941*height)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 moveToPoint:CGPointMake(0.66689*width, 0.78382*height)];
    [path2 addCurveToPoint:CGPointMake(0.76912*width, 0.78824*height) controlPoint1:CGPointMake(0.70096*width, 0.77451*height) controlPoint2:CGPointMake(0.76912*width, 0.76235*height)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addCurveToPoint:CGPointMake(0.71912*width, 0.81176*height) controlPoint1:CGPointMake(0.76912*width, 0.81412*height) controlPoint2:CGPointMake(0.72304*width, 0.80931*height)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    return path2;
}


- (void)drawPath0:(UIBezierPath *)path0 path1:(UIBezierPath *)path1 andPath2:(UIBezierPath *)path2 {
   [self createPath:path0 withInterval:self.interval / 56 andColor:self.colors[0]];
   [self createPath1:path1 withInterval:self.interval / 7 andColor:self.colors[1]];
   [self createPath2:path2 withInterval:self.interval / 16 andColor:self.colors[2]];
}

@end

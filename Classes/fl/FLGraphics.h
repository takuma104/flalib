#import "flalib_common.h"

@interface FLGraphics : NSObject {
	NSMutableArray *commands;
}

- (void)beginFill:(uint)color :(FLNumber)alpha;
- (void)endFill;
- (void)clear;
- (void)drawCircle:(FLNumber)x :(FLNumber)y :(FLNumber)radius;
- (void)drawEllipse:(FLNumber)x :(FLNumber)y :(FLNumber)width :(FLNumber)height;
- (void)lineTo:(FLNumber)x :(FLNumber)y;
- (void)moveTo:(FLNumber)x :(FLNumber)y;
- (void)lineStyle:(FLNumber)thickness 
				 :(uint)color
				 :(FLNumber)alpha;

/*
 - (void)drawRoundRect:(FLNumber)x 
 :(FLNumber)y 
 :(FLNumber)width 
 :(FLNumber)height
 :(FLNumber)ellipseWidth
 :(FLNumber)ellipseHeight;

 - (void)beginBitmapFill:(FLBitmapData*)bitmapData :(FLMatrix*)matrix :(FLBoolean)repeat :(FLBoolean)smooth;
- (void)curveTo:(FLNumber)controlX :(FLNumber)controlY :(FLNumber)anchorX :(FLNumber)anchorY;
//- (void)lineGradientStyle
- (void)beginGradientFill:(NSString*)type 
						 :(NSArray*)colors 
						 :(NSArray*)alphas 
						 :(NSArray*)ratios 
						 :(FLMatrix*)matrix
						 :(NSString*)spreadMethod
						 :(NSString*)interpolationMethod
						 :(FLNumber)focalPointRatio;

 - (void)lineStyle:(FLNumber)thickness 
 :(uint)color
 :(FLNumber)alpha
 :(FLBoolean)pixelHinting
 :(NSString*)scaleMode
 :(NSString*)caps
 :(NSString*)joints
 :(FLNumber)miterLimit;
*/

// for internal use only

- (void)_drawWithContext:(CGContextRef)context;


@end

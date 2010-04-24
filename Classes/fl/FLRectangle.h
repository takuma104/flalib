#import "flalib_common.h"

@interface FLRectangle : NSObject {
	FLNumber _x;
	FLNumber _y;
	FLNumber _width;
	FLNumber _height;
}

@property (readwrite, nonatomic) FLNumber x;
@property (readwrite, nonatomic) FLNumber y;
@property (readwrite, nonatomic) FLNumber width;
@property (readwrite, nonatomic) FLNumber height;

+ (FLRectangle*)rectangle:(FLNumber)x :(FLNumber)y :(FLNumber)width :(FLNumber)height;

@end

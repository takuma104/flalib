#import "flalib_common.h"
#import "FLRectangle.h"

@interface FLBitmapData : NSObject {
	int _width;
	int _height;
	FLBoolean _transparent;
}

+ (FLBitmapData*)bitmapData:(int)width :(int)height;
+ (FLBitmapData*)bitmapData:(int)width :(int)height :(FLBoolean)transparent;
+ (FLBitmapData*)bitmapData:(int)width :(int)height :(FLBoolean)transparent :(uint)fillColor;

@property (readonly, nonatomic) int width;
@property (readonly, nonatomic) int height;
@property (readonly, nonatomic) FLBoolean transparent;

- (FLRectangle*)rect;


@end

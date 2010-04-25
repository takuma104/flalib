#import "flalib_common.h"
#import "FLDisplayObject.h"
#import "FLBitmapData.h"

@interface FLBitmap : FLDisplayObject {
	GLuint _name;
	FLBitmapData *_bitmapData;
	NSString *_pixelSnapping;
	FLBoolean _smoothing;
}

+ (FLBitmap*)bitmap;
+ (FLBitmap*)bitmap:(FLBitmapData*)bitmapData;
+ (FLBitmap*)bitmap:(FLBitmapData*)bitmapData :(NSString*)pixelSnapping;
+ (FLBitmap*)bitmap:(FLBitmapData*)bitmapData :(NSString*)pixelSnapping :(FLBoolean)smoothing;

@property (readwrite, retain, nonatomic) FLBitmapData *bitmapData;
@property (readwrite, retain, nonatomic) NSString *pixelSnapping;
@property (readwrite, nonatomic) FLBoolean smoothing;

@end

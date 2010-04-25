#import "flalib_common.h"
#import "FLRectangle.h"

@interface FLBitmapData : NSObject {
	int _width;
	int _height;
	int _textureWidth;
	int _textureHeight;
	FLBoolean _transparent;

	CGContextRef _bitmapContext;
	int _bpp;
	uint8_t *_pixels;
	BOOL _dirty;
}

+ (FLBitmapData*)bitmapData:(int)width :(int)height;
+ (FLBitmapData*)bitmapData:(int)width :(int)height :(FLBoolean)transparent;
+ (FLBitmapData*)bitmapData:(int)width :(int)height :(FLBoolean)transparent :(uint)fillColor;

// iPhone extension
+ (FLBitmapData*)bitmapDataWithUIImage:(UIImage*)image;

@property (readonly, nonatomic) int width;
@property (readonly, nonatomic) int height;
@property (readonly, nonatomic) FLBoolean transparent;

- (FLRectangle*)rect;

/// for internal use only
- (int)_textureWidth;
- (int)_textureHeight;
- (uint8_t*)_pixels;
- (BOOL)_dirty;

@end

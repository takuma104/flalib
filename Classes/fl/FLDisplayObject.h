#import "flalib_common.h"

@interface FLDisplayObject : NSObject {
	FLNumber _alpha;
	FLNumber _x;
	FLNumber _y;
	FLNumber _width;
	FLNumber _height;
	FLBoolean _visible;
	FLNumber _scaleX;
	FLNumber _scaleY;
	FLNumber _rotation;
	
}

@property (readwrite, nonatomic) FLNumber alpha;
@property (readwrite, nonatomic) FLNumber x;
@property (readwrite, nonatomic) FLNumber y;
@property (readwrite, nonatomic) FLNumber width;
@property (readwrite, nonatomic) FLNumber height;
@property (readwrite, nonatomic) FLBoolean visible;
@property (readwrite, nonatomic) FLNumber scaleX;
@property (readwrite, nonatomic) FLNumber scaleY;
@property (readwrite, nonatomic) FLNumber rotation;

/// for internal use only
- (void)_prepareTexture;
- (void)_render;


@end

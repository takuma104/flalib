#import "FLDisplayObject.h"

@implementation FLDisplayObject

@synthesize alpha = _alpha;
@synthesize x = _x;
@synthesize y = _y;
@synthesize width = _width;
@synthesize height = _height;
@synthesize visible = _visible;
@synthesize scaleX = _scaleX;
@synthesize scaleY = _scaleY;
@synthesize rotation = _rotation;

- (void)render {
	// override by subclasses
}

@end

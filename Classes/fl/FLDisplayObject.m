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

- (id)init {
	if ((self = [super init])) {
		self.alpha = 1.f;
		self.visible = YES;
		self.scaleX = 1.f;
		self.scaleY = 1.f;
		self.rotation = 0.f;
	}
	return self;
}

#pragma mark ForInternalUseOnly
#pragma mark -

- (void)_prepareTexture {
	// override by subclasses
}

- (void)_render {
	// override by subclasses
}

@end

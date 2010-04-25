#import "FLShape.h"

@implementation FLShape
@synthesize graphics = _graphics;

+ (FLShape*)shape {
	return [[[[self class] alloc] init] autorelease];
}

- (id)init {
	if ((self = [super init])) {
		_graphics = [[FLGraphics alloc] init];
	}
	return self;
}

- (void)dealloc {
	[_graphics release];
	[super dealloc];
}

@end

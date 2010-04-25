#import "FLDisplayObjectContainer.h"

@implementation FLDisplayObjectContainer

- (id)init {
	if ((self = [super init])) {
		_children = [[NSMutableArray array] retain];
	}
	return self;
}

- (void)dealloc {
	[_children release];
	[super dealloc];
}

- (FLDisplayObject*)addChild:(FLDisplayObject*)child {
	[_children addObject:child];
	return child;
}

- (void)removeChild:(FLDisplayObject*)child {
	[_children removeObject:child];
}


#pragma mark ForInternalUseOnly
#pragma mark -

- (void)_prepareTexture {
	for (FLDisplayObject *c in _children) {
		[c _prepareTexture];
	}
}

- (void)_render {
	for (FLDisplayObject *c in _children) {
		[c _render];
	}
}

@end

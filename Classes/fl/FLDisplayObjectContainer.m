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

- (void)render {
	for (FLDisplayObject *c in _children) {
		[c render];
	}
}

@end

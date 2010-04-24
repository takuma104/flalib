#import "flalib_common.h"
#import "FLDisplayObject.h"

@interface FLDisplayObjectContainer : FLDisplayObject {
	NSMutableArray *_children;
}

- (FLDisplayObject*)addChild:(FLDisplayObject*)child;
- (void)removeChild:(FLDisplayObject*)child;

@end

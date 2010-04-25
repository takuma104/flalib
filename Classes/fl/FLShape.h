#import "flalib_common.h"
#import "FLDisplayObject.h"
#import "FLGraphics.h"

@interface FLShape : FLDisplayObject {
	FLGraphics *_graphics;
}

@property (readonly, nonatomic) FLGraphics *graphics;

+ (FLShape*)shape;

@end

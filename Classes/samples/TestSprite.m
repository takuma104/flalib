#import "TestSprite.h"

@implementation TestSprite

- (id)init {
	if ((self = [super init])) {
		FLBitmapData *bitmapData = [FLBitmapData bitmapDataWithUIImage:[UIImage imageNamed:@"test256x256.png"]];
		FLBitmap *bitmap = [FLBitmap bitmap:bitmapData];
		bitmap.x = 10;
		bitmap.y = 10;
		[self addChild:bitmap];
	}
	return self;
}

@end

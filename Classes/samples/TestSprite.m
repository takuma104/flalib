#import "TestSprite.h"

@implementation TestSprite

- (id)init {
	if ((self = [super init])) {
		UIImage *image = [UIImage imageNamed:@"test256x256.png"];
		FLBitmapData *bitmapData = [FLBitmapData bitmapDataWithUIImage:image];
		FLBitmap *bitmap = [FLBitmap bitmap:bitmapData];
		bitmap.x = 10;
		bitmap.y = 10;
		[self addChild:bitmap];
		
		FLShape *shape = [FLShape shape];
		[shape.graphics beginFill :0xff0000 :0.5f];
		[shape.graphics drawCircle :0 :0 :20.f];
		[shape.graphics endFill];
		[shape.graphics beginFill :0x00ff00 :0.5f];
		[shape.graphics drawCircle :40 :40 :30.f];
		[shape.graphics endFill];
		[shape.graphics beginFill :0x0000ff :0.5f];
		[shape.graphics drawCircle :100 :100 :70.f];
		[shape.graphics endFill];
		[bitmapData draw:shape];
		
	}
	return self;
}

@end

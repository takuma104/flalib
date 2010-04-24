#import "FLBitmapData.h"

@implementation FLBitmapData

@synthesize width = _width;
@synthesize height = _height;
@synthesize transparent = _transparent;

- (id)initWithWidth:(int)width
			 height:(int)height
		transparent:(FLBoolean)transparent
		  fillColor:(uint)fillColor {
	if ((self = [super init])) {
		_width = width;
		_height = height;
		_transparent = transparent;

	}
	return self;
}

- (void)dealloc {
	[super dealloc];
}

- (FLRectangle*)rect {
	return [FLRectangle rectangle:0 :0 :_width :_height];
}

+ (FLBitmapData*)bitmapData:(int)width :(int)height {
	return [[self class] bitmapData:width :height :TRUE :0xFFFFFFFF];
}

+ (FLBitmapData*)bitmapData:(int)width :(int)height :(FLBoolean)transparent {
	return [[self class] bitmapData:width :height :transparent :0xFFFFFFFF];
}

+ (FLBitmapData*)bitmapData:(int)width :(int)height :(FLBoolean)transparent :(uint)fillColor {
	return [[[FLBitmapData alloc] initWithWidth:width
										 height:height
									transparent:transparent
									  fillColor:fillColor] autorelease];
}





@end

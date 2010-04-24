#import "FLBitmap.h"

@implementation FLBitmap

@synthesize bitmapData = _bitmapData;
@synthesize pixelSnapping = _pixelSnapping;
@synthesize smoothing = _smoothing;

- (id)initWithBitmapData:(FLBitmapData*)bitmapData 
		   pixelSnapping:(NSString*)pixelSnapping
			   smoothing:(FLBoolean)smoothing {
	if ((self = [super init])) {
		_bitmapData = [bitmapData retain];
		_pixelSnapping = [pixelSnapping retain];
		_smoothing = smoothing;
	}
	return self;
}

- (void)dealloc {
	[_bitmapData release];
	[_pixelSnapping release];
	[super dealloc];
}


+ (FLBitmap*)bitmap {
	return [[self class] bitmap:nil :@"auto" :FALSE];
}

+ (FLBitmap*)bitmap:(FLBitmapData*)bitmapData {
	return [[self class] bitmap:bitmapData :@"auto" :FALSE];
}

+ (FLBitmap*)bitmap:(FLBitmapData*)bitmapData :(NSString*)pixelSnapping {
	return [[self class] bitmap:bitmapData :@"auto" :FALSE];
}

+ (FLBitmap*)bitmap:(FLBitmapData*)bitmapData :(NSString*)pixelSnapping :(FLBoolean)smoothing {
	return [[[FLBitmap alloc] initWithBitmapData:bitmapData 
								   pixelSnapping:pixelSnapping
									   smoothing:smoothing] autorelease];
}

@end

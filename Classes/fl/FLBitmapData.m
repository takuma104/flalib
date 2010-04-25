#import "FLBitmapData.h"

static unsigned int nextPOT(unsigned int x)
{
    x = x - 1;
    x = x | (x >> 1);
    x = x | (x >> 2);
    x = x | (x >> 4);
    x = x | (x >> 8);
    x = x | (x >>16);
    return x + 1;
}

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

		_textureWidth = nextPOT(_width);
		_textureHeight = nextPOT(_height);
		_bpp = 4; // 32bit color
		_pixels = malloc(_textureWidth*_textureHeight*_bpp);
		
		CGBitmapInfo bi;
		CGColorSpaceRef cs;
		if (_bpp == 4) {
			cs = CGColorSpaceCreateDeviceRGB();
			bi = kCGImageAlphaNoneSkipLast|kCGBitmapByteOrder32Big;
		} else {
			cs = CGColorSpaceCreateDeviceGray();
			bi = kCGImageAlphaNone;
		}
		
		_bitmapContext = CGBitmapContextCreate(_pixels, 
											   _textureWidth, 
											   _textureHeight, 
											   8, 
											   _textureWidth*_bpp, 
											   cs, 
											   bi);
		CGColorSpaceRelease(cs);
		_dirty = YES;
	}
	return self;
}

- (id)initWithUIImage:(UIImage*)image {
	CGSize s = [image size];
	if (self = [self initWithWidth:s.width
							height:s.height
					   transparent:YES 
						 fillColor:0]) {
		CGRect r = CGRectMake(0, 0, s.width, s.height);
		UIGraphicsPushContext(_bitmapContext);
		CGContextSetInterpolationQuality(_bitmapContext, kCGInterpolationNone);
		CGContextTranslateCTM(_bitmapContext, 0.0f, s.height);
		CGContextScaleCTM(_bitmapContext, 1.0f, -1.0f);
		[image drawInRect:r];
		UIGraphicsPopContext();
		_dirty = YES;
	}
	return self;
}

- (void)dealloc {
	CGContextRelease(_bitmapContext);
	free(_pixels);
	[super dealloc];
}

- (FLRectangle*)rect {
	return [FLRectangle rectangle :0 :0 :_width :_height];
}

+ (FLBitmapData*)bitmapData:(int)width :(int)height {
	return [[self class] bitmapData:width :height :TRUE :0xFFFFFFFF];
}

+ (FLBitmapData*)bitmapData:(int)width :(int)height :(FLBoolean)transparent {
	return [[self class] bitmapData:width :height :transparent :0xFFFFFFFF];
}

+ (FLBitmapData*)bitmapData:(int)width :(int)height :(FLBoolean)transparent :(uint)fillColor {
	return [[[[self class] alloc] initWithWidth:width
										 height:height
									transparent:transparent
									  fillColor:fillColor] autorelease];
}

+ (FLBitmapData*)bitmapDataWithUIImage:(UIImage*)image {
	return [[[[self class] alloc] initWithUIImage:image] autorelease];
}

- (int)_textureWidth {
	return _textureWidth;
}

- (int)_textureHeight {
	return _textureHeight;
}

- (uint8_t*)_pixels {
	return _pixels;
}

- (BOOL)_dirty {
	if (_dirty) {
		_dirty = NO;
		return YES;
	}
	return NO;
}


@end

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
		self.width = _bitmapData.width;
		self.height = _bitmapData.height;
	}
	return self;
}

- (void)dealloc {
	if(_name) {
		glDeleteTextures(1, &_name);
	}
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
	return [[[[self class] alloc] initWithBitmapData:bitmapData 
									   pixelSnapping:pixelSnapping
										   smoothing:smoothing] autorelease];
}

#pragma mark ForInternalUseOnly
#pragma mark -

- (void)_prepareTexture {
	if ([_bitmapData _dirty]) {
		if(_name) {
			glDeleteTextures(1, &_name);
		}
		glGenTextures(1, &_name);
		glBindTexture(GL_TEXTURE_2D, _name);
		glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, 
					 [_bitmapData _textureWidth], [_bitmapData _textureHeight], 0, 
					 GL_RGBA, GL_UNSIGNED_BYTE, [_bitmapData _pixels]);
		
		glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
		glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
		glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
		glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);	
	}
}

- (void)_render {
	if (_visible) {
		GLfloat s = self.width / (GLfloat)[_bitmapData _textureWidth];
		GLfloat t = self.height / (GLfloat)[_bitmapData _textureHeight];
		
		GLfloat	coordinates[] = { 
			0.0f,	0.0f,
			s,		0.0f,
			0.0f,	t,
			s,		t,
		};
		
		GLfloat	vertices[] = {	
			self.x,				 self.y,				0.0f,
			self.width + self.x, self.y,				0.0f,
			self.x,				 self.height  + self.y,	0.0f,
			self.width + self.x, self.height  + self.y,	0.0f,
		};
		
		GLubyte a = self.alpha * 255.f;
		GLubyte squareColors[] = {
			255, 255, 255, a,
			255, 255, 255, a,
			255, 255, 255, a,
			255, 255, 255, a,
		};
		
		glBindTexture(GL_TEXTURE_2D, _name);
		glVertexPointer(3, GL_FLOAT, 0, vertices);
		glTexCoordPointer(2, GL_FLOAT, 0, coordinates);
		glColorPointer(4, GL_UNSIGNED_BYTE, 0, squareColors);
		glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);
	}
}

@end

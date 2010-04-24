#import <QuartzCore/QuartzCore.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import "flalib_common.h"

@interface FLXTexture : NSObject {
	GLuint _name;
	int _textureWidth;
	int _textureHeight;
	int _contentsWidth;
	int _contentsHeight;
}

- (id)initWithCGImage:(CGImageRef)image;
- (void)draw:(FLNumber)x :(FLNumber)y;

@end

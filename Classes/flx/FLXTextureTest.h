#import <QuartzCore/QuartzCore.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import "flalib_common.h"

@interface FLXTextureTest : NSObject {
	GLubyte *buf;
}

- (void)testFill;
- (void)draw:(FLNumber)x :(FLNumber)y;

@end

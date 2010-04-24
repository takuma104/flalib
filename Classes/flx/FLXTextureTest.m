#import "FLXTextureTest.h"

#define SIZE		512

@implementation FLXTextureTest

- (id)init {
	if ((self = [super init])) {
		buf = malloc(SIZE*SIZE*4);
		
	}
	return self;
}

- (void)dealloc {
	free(buf);
	[super dealloc];
}

- (void)testFill {
	static int frameIndex = 0;
	int w = SIZE;
	int h = SIZE;
	uint32_t *p = (uint32_t *)buf;
	
	for (int y = 0; y < h; y++) {
		for (int x = 0; x < w; x++) {
			int r = (x + y + frameIndex * 1) & 0xff;
			int g = (x + y + frameIndex * 7) & 0xff;
			int b = (x + y + frameIndex * 23) & 0xff;
			*p = 0xff000000 | (b << 16) | (g << 8) | (r);
			p++;
		}
	}
	frameIndex++;
}


- (void)draw:(FLNumber)x :(FLNumber)y {
	
	GLuint name;
	glGenTextures(1, &name);
	glBindTexture(GL_TEXTURE_2D, name);
	glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, SIZE, SIZE, 0, 
				 GL_RGBA, GL_UNSIGNED_BYTE, buf);
	
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);	
	
	
	GLfloat s = 1.f;//(GLfloat)_contentsWidth / (GLfloat)_textureWidth;
	GLfloat t = 1.f;//(GLfloat)_contentsHeight / (GLfloat)_textureHeight;
	
	GLfloat	coordinates[] = { 
		0.0f,	0.0f,
		s,		0.0f,
		0.0f,	t,
		s,		t,
	};
	
	GLfloat	width = (GLfloat)SIZE;
	GLfloat height = (GLfloat)SIZE;
	
	GLfloat	vertices[] = {	
		x,			y,				0.0f,
		width + x,	y,				0.0f,
		x,			height  + y,	0.0f,
		width + x,	height  + y,	0.0f,
	};
	
	static const GLubyte squareColors[] = {
        255, 255, 255, 255,
        255, 255, 255, 255,
        255, 255, 255, 255,
        255, 255, 255, 255,
    };
	
//	glBindTexture(GL_TEXTURE_2D, _name);
	glVertexPointer(3, GL_FLOAT, 0, vertices);
	glTexCoordPointer(2, GL_FLOAT, 0, coordinates);
    glColorPointer(4, GL_UNSIGNED_BYTE, 0, squareColors);
	glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);
	
	glDeleteTextures(1, &name);
}


@end

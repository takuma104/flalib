#import "FLRectangle.h"

@implementation FLRectangle
@synthesize x = _x, y = _y, width = _width, height = _height;

+ (FLRectangle*)rectangle:(FLNumber)x :(FLNumber)y :(FLNumber)width :(FLNumber)height {
	FLRectangle *p = [[[FLRectangle alloc] init] autorelease];
	p->_x = x;
	p->_y = y;
	p->_width = width;
	p->_height= height;
	return p;
}

@end

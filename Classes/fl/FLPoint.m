#import "FLPoint.h"

@implementation FLPoint
@synthesize x = _x, y = _y;

+ (FLPoint*)point:(FLNumber)x :(FLNumber)y {
	FLPoint *p = [[[FLPoint alloc] init] autorelease];
	p->_x = x;
	p->_y = y;
	return p;
}

@end

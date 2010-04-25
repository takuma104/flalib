#import "FLGraphics.h"

@interface FLGraphicsBeginFill : NSObject {
	uint _color;
	FLNumber _alpha;
}
- (id)initWithColor:(uint)color alpha:(FLNumber)alpha;
@property (readonly, nonatomic) uint color;
@property (readonly, nonatomic) FLNumber alpha;
@end

@implementation FLGraphicsBeginFill
@synthesize color = _color;
@synthesize alpha = _alpha;
- (id)initWithColor:(uint)color alpha:(FLNumber)alpha {
	if ((self = [super init])) {
		_color = color;
		_alpha = alpha;
	}
	return self;
}
@end


@interface FLGraphicsEndFill : NSObject {
}
@end

@implementation FLGraphicsEndFill
- (id)init {
	if ((self = [super init])) {
	}
	return self;
}
@end


@interface FLGraphicsDrawCircle : NSObject {
	FLNumber _x;
	FLNumber _y;
	FLNumber _radius;
}
- (id)initWithX:(FLNumber)x y:(FLNumber)y radius:(FLNumber)radius;
@property (readonly, nonatomic) FLNumber x;
@property (readonly, nonatomic) FLNumber y;
@property (readonly, nonatomic) FLNumber radius;
@end

@implementation FLGraphicsDrawCircle
@synthesize x = _x;
@synthesize y = _y;
@synthesize radius = _radius;
- (id)initWithX:(FLNumber)x y:(FLNumber)y radius:(FLNumber)radius {
	if ((self = [super init])) {
		_x = x;
		_y = y;
		_radius = radius;
	}
	return self;
}
@end


@interface FLGraphicsDrawEllipse : NSObject {
	FLNumber _x;
	FLNumber _y;
	FLNumber _width;
	FLNumber _height;
}
- (id)initWithX:(FLNumber)x y:(FLNumber)y width:(FLNumber)width height:(FLNumber)height;
@property (readonly, nonatomic) FLNumber x;
@property (readonly, nonatomic) FLNumber y;
@property (readonly, nonatomic) FLNumber width;
@property (readonly, nonatomic) FLNumber height;
@end

@implementation FLGraphicsDrawEllipse
@synthesize x = _x;
@synthesize y = _y;
@synthesize width = _width;
@synthesize height = _height;
- (id)initWithX:(FLNumber)x y:(FLNumber)y width:(FLNumber)width height:(FLNumber)height {
	if ((self = [super init])) {
		_x = x;
		_y = y;
		_width = width;
		_height = height;
	}
	return self;
}
@end


@interface FLGraphicsLineTo : NSObject {
	FLNumber _x;
	FLNumber _y;
}
- (id)initWithX:(FLNumber)x y:(FLNumber)y;
@property (readonly, nonatomic) FLNumber x;
@property (readonly, nonatomic) FLNumber y;
@end

@implementation FLGraphicsLineTo
@synthesize x = _x;
@synthesize y = _y;
- (id)initWithX:(FLNumber)x y:(FLNumber)y {
	if ((self = [super init])) {
		_x = x;
		_y = y;
	}
	return self;
}
@end


@interface FLGraphicsMoveTo : NSObject {
	FLNumber _x;
	FLNumber _y;
}
- (id)initWithX:(FLNumber)x y:(FLNumber)y;
@property (readonly, nonatomic) FLNumber x;
@property (readonly, nonatomic) FLNumber y;
@end

@implementation FLGraphicsMoveTo
@synthesize x = _x;
@synthesize y = _y;
- (id)initWithX:(FLNumber)x y:(FLNumber)y {
	if ((self = [super init])) {
		_x = x;
		_y = y;
	}
	return self;
}
@end


@interface FLGraphicsLineStyle : NSObject {
	FLNumber _thickness;
	uint _color;
	FLNumber _alpha;
}
- (id)initWithThickness:(FLNumber)thickness color:(uint)color alpha:(FLNumber)alpha;
@property (readonly, nonatomic) FLNumber thickness;
@property (readonly, nonatomic) uint color;
@property (readonly, nonatomic) FLNumber alpha;
@end

@implementation FLGraphicsLineStyle
@synthesize thickness = _thickness;
@synthesize color = _color;
@synthesize alpha = _alpha;
- (id)initWithThickness:(FLNumber)thickness color:(uint)color alpha:(FLNumber)alpha {
	if ((self = [super init])) {
		_thickness = thickness;
		_color = color;
		_alpha = alpha;
	}
	return self;
}
@end




@implementation FLGraphics

- (id)init {
	if ((self = [super init])) {
		commands = [[NSMutableArray array] retain];
	}
	return self;
}

- (void)dealloc {
	[commands release];
	[super dealloc];
}

- (void)beginFill :(uint)color :(FLNumber)alpha {
	id cmd = [[[FLGraphicsBeginFill alloc] initWithColor:color alpha:alpha] autorelease];
	[commands addObject:cmd];
}

- (void)endFill {
	id cmd = [[[FLGraphicsEndFill alloc] init] autorelease];
	[commands addObject:cmd];
}

- (void)clear {
	[commands removeAllObjects];
}

- (void)drawCircle :(FLNumber)x :(FLNumber)y :(FLNumber)radius {
	id cmd = [[[FLGraphicsDrawCircle alloc] initWithX:x y:y radius:radius] autorelease];
	[commands addObject:cmd];
}

- (void)drawEllipse :(FLNumber)x :(FLNumber)y :(FLNumber)width :(FLNumber)height {
	id cmd = [[[FLGraphicsDrawEllipse alloc] initWithX:x y:y width:width height:height] autorelease];
	[commands addObject:cmd];
}

- (void)lineTo :(FLNumber)x :(FLNumber)y {
	id cmd = [[[FLGraphicsLineTo alloc] initWithX:x y:y] autorelease];
	[commands addObject:cmd];
}

- (void)moveTo :(FLNumber)x :(FLNumber)y {
	id cmd = [[[FLGraphicsMoveTo alloc] initWithX:x y:y] autorelease];
	[commands addObject:cmd];
}

- (void)lineStyle :(FLNumber)thickness :(uint)color :(FLNumber)alpha {
	id cmd = [[[FLGraphicsLineStyle alloc] initWithThickness:thickness color:color alpha:alpha] autorelease];
	[commands addObject:cmd];
}

#pragma mark ForInternalUseOnly
#pragma mark -

static void setFillColor(CGContextRef context, uint color, FLNumber alpha) {
	float c[] = {
		((color>>16)&0xff)/255.f, //r
		((color>>8)&0xff)/255.f, //g
		((color>>0)&0xff)/255.f, //b
		alpha,
	};
	CGContextSetFillColor(context, c);
}

static void setStrokeColor(CGContextRef context, uint color, FLNumber alpha) {
	float c[] = {
		((color>>16)&0xff)/255.f, //r
		((color>>8)&0xff)/255.f, //g
		((color>>0)&0xff)/255.f, //b
		alpha,
	};
	CGContextSetStrokeColor(context, c);
}

- (void)_drawWithContext:(CGContextRef)context {
	BOOL fillMode = NO;
	for (id cmd in commands) {
		if ([cmd isKindOfClass:[FLGraphicsBeginFill class]]) {
			FLGraphicsBeginFill *c = (FLGraphicsBeginFill*)cmd;
			setFillColor(context, c.color, c.alpha);
			fillMode = YES;
		} else if ([cmd isKindOfClass:[FLGraphicsEndFill class]]) {
			CGContextFillPath(context);
			fillMode = NO;
		} else if ([cmd isKindOfClass:[FLGraphicsLineStyle class]]) {
			FLGraphicsLineStyle *c = (FLGraphicsLineStyle*)cmd;
			setStrokeColor(context, c.color, c.alpha);
			CGContextSetLineWidth(context, c.thickness);
		} else if ([cmd isKindOfClass:[FLGraphicsDrawCircle class]]) {
			FLGraphicsDrawCircle *c = (FLGraphicsDrawCircle*)cmd;
			CGRect r = CGRectMake(c.x, c.y, c.radius*2.f, c.radius*2.f);
			if (fillMode) {
				CGContextFillEllipseInRect(context, r);
			} else {
				CGContextStrokeEllipseInRect(context, r);
			}
		} else if ([cmd isKindOfClass:[FLGraphicsDrawEllipse class]]) {
			FLGraphicsDrawEllipse *c = (FLGraphicsDrawEllipse*)cmd;
			CGRect r = CGRectMake(c.x, c.y, c.width, c.height);
			if (fillMode) {
				CGContextFillEllipseInRect(context, r);
			} else {
				CGContextStrokeEllipseInRect(context, r);
			}
//		} else if ([cmd isKindOfClass:[FLGraphicsMoveTo class]]) {
//			CGPathRef
		}

	}
}

@end


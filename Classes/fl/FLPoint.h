#import "flalib_common.h"

@interface FLPoint : NSObject {
	FLNumber _x;
	FLNumber _y;
}

@property (readwrite, nonatomic) FLNumber x;
@property (readwrite, nonatomic) FLNumber y;

+ (FLPoint*)point:(FLNumber)x :(FLNumber)y;

/*
- (FLNumber)length;
- (FLPoint*)add:(FLPoint*)v;
- (FLPoint*)clone;
- (FLNumber)distance
*/

@end

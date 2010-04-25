#import "FLStage.h"

static FLStage* _mainStage = nil;

@implementation FLStage

+ (FLStage*)mainStage {
	if (_mainStage == nil) {
		_mainStage = [[FLStage alloc] init];
	}
	return _mainStage;
}

@end

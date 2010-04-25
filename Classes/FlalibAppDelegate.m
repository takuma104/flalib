#import "FlalibAppDelegate.h"
#import "TestSprite.h"
#import "FLStage.h"

@implementation FlalibAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	window.backgroundColor = [UIColor blackColor];

	glView = [[FLXGLView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	[window addSubview:glView];
	
	[window makeKeyAndVisible];
    [glView startAnimation];
    
	
	[[FLStage mainStage] addChild:[TestSprite sprite]];
	
	return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    [glView stopAnimation];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [glView startAnimation];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [glView stopAnimation];
}

- (void)dealloc {
    [window release];
    [glView release];
	
    [super dealloc];
}


@end

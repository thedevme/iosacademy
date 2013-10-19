//
//  AppDelegate.m
//  ToDoMovies
//

#import "AppDelegate.h"


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self launchInitializations];
    DDLogInfo(@"Test");
    
    
    NSArray *fontFamilies = [UIFont familyNames];
    
    for (int i = 0; i < [fontFamilies count]; i++)
    {
        NSString *fontFamily = [fontFamilies objectAtIndex:i];
        NSArray *fontNames = [UIFont fontNamesForFamilyName:[fontFamilies objectAtIndex:i]];
        NSLog (@"%@: %@", fontFamily, fontNames);
    }
    
    
    return YES;
}


							
- (void)applicationWillResignActive:(UIApplication *)application
{

}

- (void)applicationDidEnterBackground:(UIApplication *)application
{

}

- (void)applicationWillEnterForeground:(UIApplication *)application
{

}

- (void)applicationDidBecomeActive:(UIApplication *)application
{

}

- (void)applicationWillTerminate:(UIApplication *)application
{

}

-(void)launchInitializations
{
    [self setLumberjackDefaults];
}

- (void) setLumberjackDefaults
{
    [DDLog addLogger:[DDASLLogger sharedInstance]];
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    
    // DDTTYLogger formatter for cleaner logs
    [DDTTYLogger sharedInstance].logFormatter = [[DMLogFormatter alloc] init];
    
    // If you have the colors plugin then this will make your debugging console pretty
    // https://github.com/robbiehanson/XcodeColors
    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
    
    //Crayon Colors here: http://en.wikipedia.org/wiki/List_of_Crayola_crayon_colors
    UIColor *infoColor = [UIColor colorWithCrayola:@"Caribbean Green"];
    UIColor *warnColor = [UIColor colorWithCrayola:@"Magenta"];
    UIColor *errorColor = [UIColor colorWithCrayola:@"Orange Red"];
    
    [[DDTTYLogger sharedInstance] setForegroundColor:infoColor backgroundColor:nil forFlag:LOG_LEVEL_INFO];
    [[DDTTYLogger sharedInstance] setForegroundColor:warnColor backgroundColor:nil forFlag:LOG_LEVEL_WARN];
    [[DDTTYLogger sharedInstance] setForegroundColor:errorColor backgroundColor:nil forFlag:LOG_LEVEL_ERROR];
}

@end
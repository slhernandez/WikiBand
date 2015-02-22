//
//  AppDelegate.m
//  WikiBand
//
//  Created by Steve Hernandez on 8/16/14.
//  Copyright (c) 2014 Steve Hernandez. All rights reserved.
//

#import "AppDelegate.h"
#import "GridViewController.h"
#import "ArtistDetailsViewController.h"

@interface AppDelegate ()
@property (strong, nonatomic) NSDictionary *titleAttributes;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    GridViewController *gridViewController = [[GridViewController alloc] init];
   
    
    // Get a pointer to an object that represents the app bundle
    //NSBundle *appBundle = [NSBundle mainBundle];
    // Look in the appBundle for the file ArtistDetailsViewController.xib
    //ArtistDetailsViewController *advc = [[ArtistDetailsViewController alloc] initWithNibName:@"ArtistDetailsViewController" bundle:appBundle];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:gridViewController];
    
    UINavigationBar *navigationBar = navigationController.navigationBar;
    //navigationBar.barTintColor = [UIColor colorWithRed:(0.0 / 255.0) green:(0.0 /255.0) blue:(0.0 /255.0) alpha:0.2];
    //navigationBar.barTintColor = [UIColor whiteColor];
    //navigationBar.barTintColor = [UIColor colorWithRed:0.945 green:0.949 blue:0.953 alpha:0.8];
    navigationBar.barStyle = UIBarStyleBlackOpaque;
    //navigationBar.barStyle = UIBarStyleDefault;
    
    [navigationBar setTitleTextAttributes:self.titleAttributes];
    
    self.window.rootViewController = navigationController;
    
    // Override point for customization after application launch.
    //self.window.backgroundColor = [UIColor colorWithRed:(255.0/255.0) green:(255.0/255.0) blue:(255.0/255.0) alpha:1.0];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (NSDictionary *)titleAttributes {
    
    if (_titleAttributes == nil) {
        UIFont *font = [UIFont fontWithName:@"BebasNeueBold" size:28.0f];
        NSShadow *shadow = [[NSShadow alloc] init];
        shadow.shadowBlurRadius = 2.0f;
        shadow.shadowColor = [UIColor grayColor];
        shadow.shadowOffset = CGSizeMake(1,1);
        _titleAttributes = @{
                             NSStrokeWidthAttributeName: @2.0f,
                             NSFontAttributeName: font,
                             NSStrokeColorAttributeName: [UIColor whiteColor]
                             };
        
    }
    
    return _titleAttributes;
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

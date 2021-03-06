//
//  GP_AppDelegate.m
//  TheRealBishop
//
//  Created by zhou Yangbo on 12-8-7.
//  Copyright (c) 2012年 GODPAPER. All rights reserved.
//

#import "GP_AppDelegate.h"
#import "Game.h"
#import "RootViewController.h"

@implementation GP_AppDelegate

@synthesize window = _window;
@synthesize sparrowView;
@synthesize rootViewController = _rootViewController;
- (void)dealloc
{
    [sparrowView release];
    [window release];
    [_rootViewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    // Override point for customization after application launch.
    _rootViewController = [[RootViewController alloc] init];
    self.window.rootViewController = _rootViewController;
//    [self.window makeKeyAndVisible];
//    return YES;
    
    //Sparrow related
    SP_CREATE_POOL(pool);
    
    [SPStage setSupportHighResolutions:YES];
    [SPAudioEngine start];
    
    Game *game = [[Game alloc] init];
    self.sparrowView = [[[SPView alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    self.window.rootViewController.view = self.sparrowView;
    sparrowView.stage = game;
    [game release];
    //
    [_window makeKeyAndVisible];
    [sparrowView start];
//    
    SP_RELEASE_POOL(pool);
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    
    [sparrowView stop];
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
    
    [sparrowView start];
}

//Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView  
{
}

@end

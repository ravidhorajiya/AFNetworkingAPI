//
//  AppDelegate.m
//  AFNetworkingAPI
//
//  Created by Ravi Dhorajiya on 04/06/17.
//  Copyright © 2017 Ravi Dhorajiya. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

#pragma mark - shared delegates
+ (instancetype)sharedAppDelegate
{
    static AppDelegate * objAppDelegate;
    if (objAppDelegate == nil)
    {
        objAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    }
    return objAppDelegate;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (BOOL)connected
{
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [reachability currentReachabilityStatus];
    return networkStatus != NotReachable;
}

- (BOOL)checkInternetConnection
{
    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
    BOOL isRechablity = false;
    
    Reachability *reachabilityHost = [Reachability reachabilityWithHostName:@"google.com"];
    NetworkStatus status = [reachabilityHost currentReachabilityStatus];
    
    if (networkStatus == NotReachable)
    {
        isRechablity = NO;
        return isRechablity;
        
    }
    else if (status == NotReachable)
    {
        return isRechablity;
    }
    else if (![self connected])
    {
        return isRechablity;
    }
    else
    {
        isRechablity = YES;
        return isRechablity;
    }
    
    return isRechablity;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end

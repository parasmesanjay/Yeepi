//
//  AppDelegate.m
//  Yeepi
//
//  Created by Apple on 06/03/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()



@end

@implementation AppDelegate

+(AppDelegate *)AppDelegate
{
    return [UIApplication sharedApplication].delegate;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    // Override point for customization after application launch.
    
    [SVProgressHUD  setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    [SVProgressHUD  setDefaultAnimationType:SVProgressHUDAnimationTypeNative];
    [SVProgressHUD setBackgroundColor:[UIColor blackColor]];
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"AppFlag"] == NULL)
    {
        return YES;
    }
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"userID"] != NULL)
    {
        UIStoryboard *storybord = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        
        TabBarController *obj = [storybord instantiateViewControllerWithIdentifier:@"TabBarController"];
        [obj setSelectedIndex:2];
        [AppDelegate AppDelegate].navigationController=[[UINavigationController alloc] initWithRootViewController:obj];
        self.window.rootViewController = [AppDelegate AppDelegate].navigationController;
        [self.window makeKeyAndVisible];
        return YES;
    }
    else
    {
        UIStoryboard *storybord = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        
        Login *obj = [storybord instantiateViewControllerWithIdentifier:@"Login"];
        
        [AppDelegate AppDelegate].navigationController=[[UINavigationController alloc] initWithRootViewController:obj];
        self.window.rootViewController = [AppDelegate AppDelegate].navigationController;
        [self.window makeKeyAndVisible];
        return YES;
    }
    
    return YES;
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

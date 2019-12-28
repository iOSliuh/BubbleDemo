//
//  AppDelegate.m
//  BubbleDEMO
//
//  Created by liuhao on 24/12/2019.
//  Copyright © 2019 liuhao. All rights reserved.
//

#import "AppDelegate.h"
#import "BubbleBackground.h"
#import "ViewController.h"
@interface AppDelegate ()
@end

@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window.rootViewController = [[ViewController alloc] init];
    [self.window makeKeyAndVisible];


    BubbleBackground *bubbleView = [[BubbleBackground alloc] initWithFrame:self.window.bounds];
    bubbleView.maxNumberOfBubbles = 9;
    bubbleView.backgroundColor = [UIColor blueColor];
    [self.window addSubview:bubbleView];
    [UIView animateWithDuration:15.0 animations:^{
        
        CATransform3D transform = CATransform3DMakeScale(1.0, 1.0, 1.1);
        bubbleView.layer.transform = transform;
        // bubbleView.alpha = 0.0;
    } completion:^(BOOL finished) {
        [bubbleView  removeFromSuperview];
    }];

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

//
//  AppDelegate.m
//  nn
//
//  Created by Zaur Giyasov on 22/06/2018.
//  Copyright © 2018 Zaur Giyasov. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // create NC
    [self createRootNavigationController];
    
    return YES;
}

-(void)createRootNavigationController {
    
    UIWindow *window = [[UIWindow alloc] init];
    self.window = window;
    
    UIStoryboard *mainViewStroriboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    // [mainViewStroriboard instantiateInitialViewController];
    // or
    
    ViewController *mainViewController = [mainViewStroriboard instantiateViewControllerWithIdentifier:@"MainVC"];
    UINavigationController *mainNavigationVC = [[UINavigationController alloc] initWithRootViewController:mainViewController];
    self.window.rootViewController = mainNavigationVC;
    
    [self.window makeKeyAndVisible];
}

@end

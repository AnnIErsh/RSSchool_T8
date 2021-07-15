//
//  AppDelegate.m
//  RSSchool_T8
//
//  Created by Anna Ershova on 15.07.2021.
//

#import "AppDelegate.h"
#import "RSNavigationVC.h"
#import "RSArtistVC.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window = window;
    RSArtistVC *artistVC = [RSArtistVC new];
    RSNavigationVC *rootVC = [[RSNavigationVC alloc] initWithRootViewController:artistVC];
    [self.window setRootViewController:rootVC];
    if (@available(iOS 13.0, *))
    {
        [self.window setOverrideUserInterfaceStyle:UIUserInterfaceStyleLight];
    }
    else
    {
        [self.window setBackgroundColor:[UIColor whiteColor]];
    }
    [self.window makeKeyAndVisible];
    return YES;
}

@end

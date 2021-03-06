//
//  AppDelegate.m
//  PetFinder v1.0
//
//  Created by Raymond Gonzalez, Reyneiro Hernandez, Gregory Jean Baptiste
//  https://github.com/raygon3/iOS-Pet-Finder
//
//  This work is licensed under the Creative Commons Attribution 3.0 Unported License. To view a copy of this license, visit
//  http://creativecommons.org/licenses/by/3.0/

#import "AppDelegate.h"

#import "DogsViewController.h"
#import "CatsViewController.h"
#import "FavoritesViewController.h"
#import "InfoViewController.h"
#import "AnimalStore.h"
#import "FavoriteAnimalStore.h"
#import "Utilities.h"

@implementation AppDelegate
AnimalStore* animalData;

@synthesize window = _window;
@synthesize tabBarController = _tabBarController;
@synthesize navigationController = _navigationController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    // (RG) - Load Filter data
    
    //Get plist path in documents directory
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *pListPath = [documentsDirectory stringByAppendingPathComponent:@"Filter.plist"];
    
    //Check if plist does not exist in documents directory
    NSError *error;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL success = [fileManager fileExistsAtPath:pListPath];
    
    //Copy plist to documents directory if it does not exist
    if(!success){
        NSString *defaultPlistPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Filter.plist"];
        success = [fileManager copyItemAtPath:defaultPlistPath  toPath:pListPath error:&error];
    }
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    // (RG) - Load main views with tab bar controller
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //Initialize 4 view controllers for tabs
    UIViewController *viewController1 = [[DogsViewController alloc] initWithNibName:@"BaseViewController" bundle:nil];
    UIViewController *viewController2 = [[CatsViewController alloc] initWithNibName:@"BaseViewController" bundle:nil];
    UIViewController *viewController3 = [[FavoritesViewController alloc] initWithNibName:@"BaseViewController" bundle:nil];
     UIViewController *viewController4 = [[InfoViewController alloc] initWithNibName:@"InfoViewController" bundle:nil];
    
    //Initialize 4 navigation controllers for tabs
    UINavigationController *navigationController1 = [[UINavigationController alloc] initWithRootViewController:viewController1];
    UINavigationController *navigationController2 = [[UINavigationController alloc] initWithRootViewController:viewController2];
    UINavigationController *navigationController3 = [[UINavigationController alloc] initWithRootViewController:viewController3];
    UINavigationController *navigationController4 = [[UINavigationController alloc] initWithRootViewController:viewController4];
    
    UIColor *navigationBarColor = [UIColor colorWithRed:0.172549 green:0.643137 blue:0.905882 alpha:1];
    [navigationController1.navigationBar setTintColor: navigationBarColor];
    [navigationController2.navigationBar setTintColor: navigationBarColor];
    [navigationController3.navigationBar setTintColor: navigationBarColor];
    [navigationController4.navigationBar setTintColor: navigationBarColor];
    
    //Create tab bar controller with 4 tabs and make it the rootViewController
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.tabBar.tintColor = [UIColor colorWithRed:0.682353 green:0.062745 blue:0.121569 alpha:1];
    self.tabBarController.tabBar.selectedImageTintColor = [UIColor colorWithRed:0.992157 green:0.772549 blue:0.188235 alpha:1];
    NSArray* controllers = [NSArray arrayWithObjects: navigationController1, navigationController2, navigationController3, navigationController4, nil];
    [self.tabBarController setViewControllers: controllers];
    
    [self.window setRootViewController:self.tabBarController];
    [self.window makeKeyAndVisible];
    
    return YES;
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
    
    BOOL success = [[FavoriteAnimalStore singletonFavorites] saveChanges];
    
    if(success)
    {
        NSLog(@"Favorite Animal Store Saved");
    }
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

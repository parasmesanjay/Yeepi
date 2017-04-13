
//  TabBarController.m
//  Yeepi
//
//  Created by Apple on 15/03/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "TabBarController.h"

@interface TabBarController ()

@end

@implementation TabBarController

//- (void)viewDidLoad {
//    [super viewDidLoad];
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    HIDE_NAV_BAR
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName : WHITE_COLOR }
                                             forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName :APP_COLOR_GREEN} forState:UIControlStateSelected];
    
    [UITabBar appearance].barTintColor =  [UIColor colorWithRed:60/255.0 green:60/255.0 blue:60/255.0 alpha:1];
    // self.tabBarController.tabBar.tintColor =  [UIColor colorWithRed:34/255.0 green:34/255.0 blue:34/255.0 alpha:1];
    [[UITabBar appearance] setTintColor:APP_COLOR_GREEN];

    
    UITabBar *bar = self.tabBar;
    
    UITabBarItem *item0 = [bar.items objectAtIndex:0];
    item0.image = [[self imageWithImage:[UIImage imageNamed:@"my_tasks"] scaledToSize:CGSizeMake(25,26)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item0.selectedImage = [self imageWithImage:[UIImage imageNamed:@"my_tasks"] scaledToSize:CGSizeMake(25,26)];
    
    UITabBarItem *item1 = [bar.items objectAtIndex:1];
    item1.image = [[self imageWithImage:[UIImage imageNamed:@"browse"] scaledToSize:CGSizeMake(25,25)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item1.selectedImage = [self imageWithImage:[UIImage imageNamed:@"browse"] scaledToSize:CGSizeMake(25,25)];
    
    UITabBarItem *item2 = [bar.items objectAtIndex:2];
    item2.image = [[self imageWithImage:[UIImage imageNamed:@"post_task"] scaledToSize:CGSizeMake(27,28)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item2.selectedImage = [self imageWithImage:[UIImage imageNamed:@"post_task"] scaledToSize:CGSizeMake(27,28)];
    
    UITabBarItem *item3 = [bar.items objectAtIndex:3];
    item3.image = [[self imageWithImage:[UIImage imageNamed:@"messages"] scaledToSize:CGSizeMake(27,26)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item3.selectedImage = [self imageWithImage:[UIImage imageNamed:@"messages"] scaledToSize:CGSizeMake(27,26)];
    
    UITabBarItem *item4 = [bar.items objectAtIndex:4];
    item4.image = [[self imageWithImage:[UIImage imageNamed:@"more"] scaledToSize:CGSizeMake(30, 30)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item4.selectedImage = [self imageWithImage:[UIImage imageNamed:@"more"] scaledToSize:CGSizeMake(30, 30)];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end

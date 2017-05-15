//
//  AppDelegate.h
//  Yeepi
//
//  Created by Apple on 06/03/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@import Stripe;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UINavigationController *navigationController;

+(AppDelegate *)AppDelegate;

@property(nonatomic, readwrite) BOOL isFull;

@property(nonatomic, readwrite) BOOL isMadeBid;

@end


//
//  Register.m
//  Yeepi
//
//  Created by Apple on 08/03/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "Register.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
@interface Register ()<FBSDKLoginButtonDelegate>
{
    FBSDKLoginButton *fbButton;
}
@end

@implementation Register

- (void)viewDidLoad {
    [super viewDidLoad];

    GET_HEADER_VIEW
    header.lblTitle.text = @"Signup to Yeepi";
    STATUS_BAR
    self.view.backgroundColor = APP_COLOR_BLUE;
    
    //  FB Button

    fbButton = [[FBSDKLoginButton alloc] init];
    [self.view addSubview:fbButton];
    fbButton.delegate = self;
    [fbButton setTitle:@"Facebook" forState:UIControlStateNormal];
    fbButton.readPermissions = @[@"public_profile", @"email",@"user_friends"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)btnAlreadyMemberClk:(id)sender
{
    POP_BACK
}

#pragma mark Facebook Delegate

- (IBAction)tapLoginWithFace:(id)sender {
    
    [fbButton sendActionsForControlEvents:UIControlEventTouchUpInside];
}

- (void)loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error
{
//  NSLog(@"%@",result);
//  NSLog(@"%@",result);
    
    NSMutableDictionary* parameters = [NSMutableDictionary dictionary];
    [parameters setValue:@"id,name,email" forKey:@"fields"];
    
    [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:parameters]
     startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
         
         if(!error)
         {
             NSLog(@"fetched user:%@", result);
         }
         
         FBSDKLoginManager *loginManager = [[FBSDKLoginManager alloc] init];
         [loginManager logOut];
         
     }];

}

- (void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton;
{
    
}

HIDE_KEY_ON_TOUCH

@end

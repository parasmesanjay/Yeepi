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
    fbButton.hidden = YES;
    
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
         
         [self fireJson:result];

         FBSDKLoginManager *loginManager = [[FBSDKLoginManager alloc] init];
         [loginManager logOut];
         
     }];

}

- (void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton;
{
    
}

-(void)fireJson:(id)result
{
    NSDictionary *param = @{@"facebook_id":[NSString stringWithFormat:@"%@",result[@"id"]],
                            @"username":result[@"name"],
                            @"email":result[@"email"],
                            @"first_name":@"",
                            @"last_name":@"",
                            @"device_token":@"!",
                            @"device_type":@"IOS",
                            };
    SVHUD_START
    
    [WebServiceCalls POST:@"users/facebook-signup.json" parameter:param completionBlock:^(id JSON, WebServiceResult result)
     {
         SVHUD_STOP
         NSLog(@"%@", JSON);
         NSDictionary *dict = JSON[@"response"];
         @try
         {
             if ([dict[@"status"] integerValue] == 1)
             {
                 NSString *userID = [NSString stringWithFormat:@"%@", dict[@"data"][@"id"]];
                 [[NSUserDefaults standardUserDefaults]setObject:userID forKey:@"userID"];
                 
                 NSString *fname = [NSString stringWithFormat:@"%@", dict[@"data"][@"first_name"]];
                 [[NSUserDefaults standardUserDefaults]setObject:fname forKey:@"fname"];
                 
                 NSString *lname = [NSString stringWithFormat:@"%@", dict[@"data"][@"last_name"]];
                 [[NSUserDefaults standardUserDefaults]setObject:lname forKey:@"lname"];
                 
                 NSDictionary *dic = [[NSDictionary alloc] initWithDictionary:dict[@"data"]];
                 NSData *myData = [NSKeyedArchiver archivedDataWithRootObject:dic];
                 
                 [[NSUserDefaults standardUserDefaults] setObject:myData forKey:@"userDetails"];
                 
                 UIStoryboard *storybord = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                 TabBarController *obj = [storybord instantiateViewControllerWithIdentifier:@"TabBarController"];
                 [self.navigationController pushViewController:obj animated:YES];

             }
             else
             {
                 [WebServiceCalls alert:[NSString stringWithFormat:@"%@", dict[@"msg"]]];
             }
         }
         @catch (NSException *exception)
         {
             [WebServiceCalls alert:@"Some problem in SignIn.\nPlease try again."];
         }
         @finally
         {
         }
     }];
}

HIDE_KEY_ON_TOUCH

@end

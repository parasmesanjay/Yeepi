//
//  Login.m
//  Yeepi
//
//  Created by Apple on 06/03/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "Login.h"

@interface Login ()

@end

@implementation Login

- (void)viewDidLoad
{
    [super viewDidLoad];

    HIDE_NAV_BAR
    GET_HEADER_VIEW_NO_BACK
    header.lblTitle.text = @"Login to Yeepi";
    STATUS_BAR
    
    self.view.backgroundColor = APP_COLOR_BLUE;
    
    btnTerms.titleLabel.numberOfLines = 0;

    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:@"By singing up you are agree to Terms and conditions"];
    if (is_iPhone_5)
    {
        attributeString = [[NSMutableAttributedString alloc] initWithString:@"By singing up you are agree to Terms and conditions"];
    }
    
    [attributeString addAttribute:NSUnderlineStyleAttributeName
                            value:[NSNumber numberWithInt:1]
                            range:(NSRange){attributeString.length-20,20}];
    
    btnTerms.titleLabel.attributedText = attributeString;

//  FB Button
    
    fbButton = [[FBSDKLoginButton alloc] init];
    [self.view addSubview:fbButton];
    fbButton.delegate = self;
    [fbButton setTitle:@"Facebook" forState:UIControlStateNormal];
    fbButton.readPermissions =
    @[@"public_profile", @"email",@"user_friends"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark Facebook Delegate

- (IBAction)tapLoginWithFace:(id)sender {

    [fbButton sendActionsForControlEvents:UIControlEventTouchUpInside];
}

-(void)loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result
              error:(NSError *)error
{
    NSLog(@"%@",result);
    NSLog(@"%@",result);
    
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

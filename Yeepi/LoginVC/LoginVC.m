//
//  LoginVC.m
//  Yeepi
//
//  Created by Apple on 06/03/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "LoginVC.h"

@interface LoginVC ()

@end

@implementation LoginVC

- (void)viewDidLoad
{
    [super viewDidLoad];

    GET_HEADER_VIEW
    header.lblTitle.text = @"Login to Yeepi";
    STATUS_BAR
    self.view.backgroundColor = APP_COLOR_BLUE;
    
    
////// ---- Text Field Properties
    
    viewEmail.layer.cornerRadius = viewPassword.layer.cornerRadius = btnLogin.layer.cornerRadius = 22;
    viewEmail.layer.borderColor = WHITE_COLOR.CGColor;
    viewEmail.layer.borderWidth = 1;
    
    viewPassword.layer.borderColor = WHITE_COLOR.CGColor;
    viewPassword.layer.borderWidth = 1;
    viewPassword.backgroundColor = viewEmail.backgroundColor = CLEAR_COLOR;
    
    [textEmail setValue:[UIColor lightTextColor] forKeyPath:@"_placeholderLabel.textColor"];
    [textPassword setValue:[UIColor lightTextColor] forKeyPath:@"_placeholderLabel.textColor"];
    
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    self.navigationController.interactivePopGestureRecognizer.delegate = self;

}
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    return YES;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

/*
 *   Method : POST
 *   Method : user login
 *   Required Params : email , password , device_token , device_type
 *   Optional Params : null
 *   Response : Status , msg, user
 *   URL : http://appone.biz/yeepi/api/users/login.json
 */

- (IBAction)btnLoginClk:(id)sender
{
    SVHUD_START
    [self performSelector:@selector(LoginChk) withObject:nil afterDelay:0];
}

-(void) LoginChk
{
    @try
    {
        [WebServiceCalls POST:@"users/login.json" parameter:nil completionBlock:^(id JSON, WebServiceResult result)
        {
            SVHUD_STOP
            @try
            {
            }
            @catch (NSException *exception) {
                
            } @finally {
                
            }
        }];
    }
    @catch (NSException *exception) {
        
    } @finally {
        
    }
}

HIDE_KEY_ON_TOUCH

@end

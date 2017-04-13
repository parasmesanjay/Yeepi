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
    
    
//////  Text Field Properties
    
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
HIDE_KEY_ON_TOUCH
@end

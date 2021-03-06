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

    UIView *vw = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 50)];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 50)];
    
    [btn setTitle:@"Show" forState:UIControlStateNormal];
    [btn setTitle:@"Hide" forState:UIControlStateSelected];
    
    [btn setTitleColor:/*[UIColor colorWithRed:135/255.0 green:145/255.0 blue:155/255.0 alpha:1.0]*/ WHITE_COLOR forState:UIControlStateNormal];
    
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    
    //btn.tag = 1;
    
    [btn addTarget:self action:@selector(btnShoe_Hide:) forControlEvents:UIControlEventTouchUpInside];
    
    [vw addSubview:btn];
    
    textPassword.rightView = vw;
    
    textPassword.rightViewMode = UITextFieldViewModeAlways;
    
}

- (IBAction)btnShoe_Hide:(UIButton *)sender
{
    sender.selected = !sender.selected;
    
    if (sender.selected)
    {
        textPassword.secureTextEntry = NO;
    }
    else
    {
        textPassword.secureTextEntry = YES;
    }
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)btnLoginClk:(id)sender
{
    if (textEmail.text.length < 1)
    {
        [WebServiceCalls alert:@"Enter Email First."];
    }
    else if ([WebServiceCalls isValidEmail:textEmail.text] == NO)
    {
        [WebServiceCalls alert:@"Enter valid Email."];
    }
    else if (textPassword.text.length < 1)
    {
        [WebServiceCalls alert:@"Enter Password First."];
    }
    else
    {
        SVHUD_START
        [self performSelector:@selector(LoginChk) withObject:nil afterDelay:0];
    }
}

-(void) LoginChk
{
    @try
    {
        // URL : http://appone.biz/yeepi/api/users/login.json
        // http://52.33.135.246/api/users/login.json
        
        NSDictionary *dic = @{@"email":textEmail.text,
                               @"password":textPassword.text,
                               @"device_token":@"12345",
                               @"device_type":@"ios"};
        
        [WebServiceCalls POST:@"users/login.json" parameter:dic completionBlock:^(id JSON, WebServiceResult result)
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
                    
                    NSString *Pass = textPassword.text;
                    
                    [[NSUserDefaults standardUserDefaults]setObject:Pass forKey:@"Password"];
                    
                    NSString *fname = [NSString stringWithFormat:@"%@", dict[@"data"][@"first_name"]];
                    [[NSUserDefaults standardUserDefaults]setObject:fname forKey:@"fname"];
                    
                    NSString *lname = [NSString stringWithFormat:@"%@", dict[@"data"][@"last_name"]];
                    [[NSUserDefaults standardUserDefaults]setObject:lname forKey:@"lname"];
                    
                    NSDictionary *dic = [[NSDictionary alloc] initWithDictionary:dict[@"data"]];
                    NSData *myData = [NSKeyedArchiver archivedDataWithRootObject:dic];
                    
                    [[NSUserDefaults standardUserDefaults] setObject:myData forKey:@"userDetails"];
                    
                    UIStoryboard *storybord = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                    TabBarController *obj = [storybord instantiateViewControllerWithIdentifier:@"TabBarController"];
                    [obj setSelectedIndex:2];
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
    @catch (NSException *exception) {
        
    } @finally {
        
    }
}

- (IBAction)btnDontHaveAcClk:(id)sender
{
    UIStoryboard *storybord = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    Register *obj = [storybord instantiateViewControllerWithIdentifier:@"Register"];
    [self.navigationController pushViewController:obj animated:YES];
}

HIDE_KEY_ON_TOUCH

@end

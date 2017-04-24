//
//  ResetPassVC.m
//  Yeepi
//
//  Created by Ashish Kumar Sharma on 17/04/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "ResetPassVC.h"

@interface ResetPassVC ()

@end

@implementation ResetPassVC
{
    NSArray *txtArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    GET_HEADER_VIEW
    header.lblTitle.text = @"CHANGE PASSWORD";
    STATUS_BAR
    self.view.backgroundColor = APP_COLOR_BLUE;
    
    viewPass1.layer.borderWidth = viewPass2.layer.borderWidth = 2;
    
    viewPass1.layer.borderColor = viewPass2.layer.borderColor = [WHITE_COLOR CGColor]; //[[UIColor colorWithRed:53/255.0 green:62/255.0 blue:91/255.0 alpha:1.0] CGColor];
    
    viewPass1.layer.cornerRadius = viewPass2.layer.cornerRadius = 25;
    btnDone.layer.cornerRadius = 22;
    
    viewPass1.layer.masksToBounds = viewPass2.layer.masksToBounds = btnDone.layer.masksToBounds = YES;
    
    [txtPass1 setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [txtPass2 setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    
    txtArray = @[txtPass1, txtPass2];
    
    int i =0;
    for (UITextField *txt in txtArray)
    {
        UIView *vw = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 50)];
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 50)];
        
        [btn setTitle:@"Show" forState:UIControlStateNormal];
        [btn setTitle:@"Hide" forState:UIControlStateSelected];
        
        [btn setTitleColor:/*[UIColor colorWithRed:135/255.0 green:145/255.0 blue:155/255.0 alpha:1.0]*/ WHITE_COLOR forState:UIControlStateNormal];
        
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        
        btn.tag = i;
        
        [btn addTarget:self action:@selector(btnShoe_Hide:) forControlEvents:UIControlEventTouchUpInside];
        
        [vw addSubview:btn];
        
        txt.rightView = vw;
        
        txt.rightViewMode = UITextFieldViewModeAlways;
        
        i++;
    }
}

- (IBAction)btnShoe_Hide:(UIButton *)sender
{
    sender.selected = !sender.selected;
    
    UITextField *txt = txtArray[sender.tag];
    
    if (sender.selected)
    {
        txt.secureTextEntry = NO;
    }
    else
    {
        txt.secureTextEntry = YES;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnDoneClk:(id)sender
{
    if (txtPass1.text.length < 6)
    {
        [WebServiceCalls alert:@"Password should be minimum 6 characters."];
    }
    else if(![txtPass1.text isEqualToString: txtPass2.text])
    {
        [WebServiceCalls alert:@"Password should be same in both fields."];
    }
    else
    {
        [self updatePassword];
    }
}

-(void) updatePassword
{
    @try
    {
        // URL :- http://appone.biz/yeepi/api/users/change-password.json
        
        NSDictionary *dic = @{@"user_id":_userId, @"new_password":txtPass1.text, @"confirm_password":txtPass2.text, @"device_token":@"!"};
        
        SVHUD_START
        [WebServiceCalls POST:@"users/change-password.json" parameter:dic completionBlock:^(id JSON, WebServiceResult result)
         {
             SVHUD_STOP
             @try
             {
                 NSLog(@"%@", JSON);
                 NSDictionary *dict = JSON[@"response"];
                 if ([dict[@"status"] integerValue] == 1)
                 {
                     [SVProgressHUD showInfoWithStatus:[NSString stringWithFormat:@"%@", dict[@"msg"]]];
                     
                     NSArray *nav_array = [self.navigationController viewControllers];
                     for (UIViewController *controller in nav_array)
                     {
                         if ([controller isKindOfClass:[Login class]])
                         {
                             [self.navigationController popToViewController:controller animated:YES];
                             return;
                         }
                     }
                 }
                 else
                 {
                     [WebServiceCalls alert:[NSString stringWithFormat:@"%@", dict[@"msg"]]];
                 }
             }
             @catch (NSException *exception)
             {
                 [WebServiceCalls alert:@"Some problem.\nPlease try again."];
             }
             @finally
             {
             }
         }];
    }
    @catch (NSException *exception)
    {
        [WebServiceCalls alert:@"Some problem.\nPlease try again."];
    }
    @finally {
        
    }
}

@end

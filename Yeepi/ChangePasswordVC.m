//
//  ChangePasswordVC.m
//  Yeepi
//
//  Created by Apple on 22/03/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "ChangePasswordVC.h"

@interface ChangePasswordVC ()

@end

@implementation ChangePasswordVC
{
    NSArray *txtArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GET_HEADER_VIEW
    header.lblTitle.text = @"CHANGE PASSWORD";
    STATUS_BAR
    self.view.backgroundColor = APP_COLOR_BLUE;
    
    viewOldPass.layer.borderWidth = viewNewPass1.layer.borderWidth = viewNewPass2.layer.borderWidth = 2;
    
    viewOldPass.layer.borderColor = viewNewPass1.layer.borderColor = viewNewPass2.layer.borderColor = [WHITE_COLOR CGColor]; //[[UIColor colorWithRed:53/255.0 green:62/255.0 blue:91/255.0 alpha:1.0] CGColor];
    
    viewOldPass.layer.cornerRadius = viewNewPass1.layer.cornerRadius = viewNewPass2.layer.cornerRadius = 25;
    btnDone.layer.cornerRadius = 22;
    
    viewOldPass.layer.masksToBounds = viewNewPass1.layer.masksToBounds = viewNewPass2.layer.masksToBounds = btnDone.layer.masksToBounds = YES;
    
    txtOldPass.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter old Password" attributes:@{NSForegroundColorAttributeName: [UIColor colorWithRed:135/255.0 green:145/255.0 blue:155/255.0 alpha:1.0]}];
    
    txtNewPass1.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter new Password" attributes:@{NSForegroundColorAttributeName: [UIColor colorWithRed:135/255.0 green:145/255.0 blue:155/255.0 alpha:1.0]}];
    
    txtNewPass2.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Confirm new Password" attributes:@{NSForegroundColorAttributeName: [UIColor colorWithRed:135/255.0 green:145/255.0 blue:155/255.0 alpha:1.0]}];
    
    txtArray = @[txtOldPass, txtNewPass1, txtNewPass2];
    
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
    if (![txtOldPass.text isEqualToString:User_Password])
    {
        [WebServiceCalls alert:@"Old Password is wrong."];
    }
    else if (txtNewPass1.text.length < 6)
    {
        [WebServiceCalls alert:@"New Password should be minimum 6 characters."];
    }
    else if(![txtNewPass1.text isEqualToString: txtNewPass2.text])
    {
        [WebServiceCalls alert:@"New Password and Confirm Password should be same."];
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
        // URL : http://appone.biz/yeepi/api/users/reset-password.json
        
        NSDictionary *dic = @{@"user_id":User_Id, @"new_password":txtNewPass1.text, @"confirm_password":txtNewPass2.text, @"device_token":@"!"};
        
        SVHUD_START
        [WebServiceCalls POST:@"users/reset-password.json" parameter:dic completionBlock:^(id JSON, WebServiceResult result)
         {
             SVHUD_STOP
             @try
             {
                 NSLog(@"%@", JSON);
                 NSDictionary *dict = JSON[@"response"];
                 if ([dict[@"status"] integerValue] == 1)
                 {
                     [SVProgressHUD showInfoWithStatus:[NSString stringWithFormat:@"%@", dict[@"msg"]]];
                     
                     NSString *Pass = txtNewPass1.text;
                     
                     [[NSUserDefaults standardUserDefaults]setObject:Pass forKey:@"Password"];
                     
                     POP_BACK
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

//
//  ForgotPassVC.m
//  Yeepi
//
//  Created by Ashish Kumar Sharma on 17/04/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "ForgotPassVC.h"

@interface ForgotPassVC ()

@end

@implementation ForgotPassVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    GET_HEADER_VIEW
    header.lblTitle.text = @"FORGOT PASSWORD";
    STATUS_BAR
    
    btnRadioEmail.selected = YES;
    
    UIImage *image = [[UIImage imageNamed:@"radio_unckeck.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    UIImage *image1 = [[UIImage imageNamed:@"radio.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    [btnRadioEmail setImage:image forState:UIControlStateNormal];
    [btnRadioEmail setImage:image1 forState:UIControlStateSelected];
    
    [btnRadioMobileNo setImage:image forState:UIControlStateNormal];
    [btnRadioMobileNo setImage:image1 forState:UIControlStateSelected];
    
    btnRadioEmail.tintColor = btnRadioMobileNo.tintColor = WHITE_COLOR;
    
    txtEmail_Mobile.layer.borderWidth = 1;
    
    txtEmail_Mobile.layer.borderColor = [[UIColor colorWithRed:53/255.0 green:62/255.0 blue:91/255.0 alpha:1.0] CGColor];
    
    txtEmail_Mobile.layer.cornerRadius = 25;
    btnGetCode.layer.cornerRadius = 22;
    
    txtEmail_Mobile.layer.masksToBounds = btnGetCode.layer.masksToBounds = YES;
    
    txtEmail_Mobile.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter email" attributes:@{NSForegroundColorAttributeName: APP_COLOR_GREEN}];
    
    UIView *vw = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 50)];
    
    txtEmail_Mobile.leftView = vw;
    
    txtEmail_Mobile.leftViewMode = UITextFieldViewModeAlways;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnRadioClk:(UIButton *)sender
{
    if (sender == btnRadioEmail)
    {
        sender.selected = YES;
        btnRadioMobileNo.selected = NO;
        
        txtEmail_Mobile.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter email" attributes:@{NSForegroundColorAttributeName: APP_COLOR_GREEN}];
        
        HIDE_KEY
        txtEmail_Mobile.keyboardType = UIKeyboardTypeEmailAddress;
        [txtEmail_Mobile becomeFirstResponder];
    }
    else
    {
        sender.selected = YES;
        btnRadioEmail.selected = NO;
        
        txtEmail_Mobile.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter Mobile Number" attributes:@{NSForegroundColorAttributeName: APP_COLOR_GREEN}];
        
        HIDE_KEY
        txtEmail_Mobile.keyboardType = UIKeyboardTypeNumberPad;
        [txtEmail_Mobile becomeFirstResponder];
    }
}

- (IBAction)btnGetCodeClk:(UIButton *)sender
{
    NSDictionary *dic;
    if (btnRadioEmail.selected)
    {
        if (txtEmail_Mobile.text.length < 1)
        {
            [WebServiceCalls alert:@"Enter Email First."];
            
            [txtEmail_Mobile becomeFirstResponder];
        }
        else if ([WebServiceCalls isValidEmail:txtEmail_Mobile.text] == NO)
        {
            [WebServiceCalls alert:@"Enter valid Email."];
            
            [txtEmail_Mobile becomeFirstResponder];
        }
        else
        {
            dic = @{@"email":txtEmail_Mobile.text};
            [self VarifyData:dic];
        }
    }
    else
    {
        if (txtEmail_Mobile.text.length < 10)
        {
            [WebServiceCalls alert:@"Mobile number should be minimum 10 characters."];
            
            [txtEmail_Mobile becomeFirstResponder];
        }
        else
        {
            dic = @{@"email":[NSString stringWithFormat:@"%@%@", PhoneCode, txtEmail_Mobile.text]};
            [self VarifyData:dic];
        }
    }
}

-(void) VarifyData:(NSDictionary *)dic
{
    @try
    {
        // url_live : http://appone.biz/yeepi/api/users/forgot-password.json
        
        SVHUD_START
        [WebServiceCalls POST:@"users/forgot-password.json" parameter:dic completionBlock:^(id JSON, WebServiceResult result)
         {
             SVHUD_STOP
             @try
             {
                 NSLog(@"%@", JSON);
                 NSDictionary *dict = JSON[@"response"];
                 if ([dict[@"status"] integerValue] == 1)
                 {
                     [SVProgressHUD showInfoWithStatus:[NSString stringWithFormat:@"%@", dict[@"msg"]]];
                     
                     UIStoryboard *storybord = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                     OTPVC *obj = [storybord instantiateViewControllerWithIdentifier:@"OTPVC"];
                     obj.userId = dict[@"user_id"];
                     [self.navigationController pushViewController:obj animated:YES];
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

//
//  OTPVC.m
//  Yeepi
//
//  Created by Ashish Kumar Sharma on 17/04/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "OTPVC.h"

@interface OTPVC ()

@end

@implementation OTPVC

@synthesize userId;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    GET_HEADER_VIEW
    header.lblTitle.text = @"FORGOT PASSWORD";
    STATUS_BAR
    
    txtOTP.layer.borderWidth = 2;
    
    txtOTP.layer.borderColor = [WHITE_COLOR CGColor];
    
    txtOTP.layer.cornerRadius = 25;
    btnSubmit.layer.cornerRadius = 22;
    
    txtOTP.layer.masksToBounds = btnSubmit.layer.masksToBounds = YES;
    
    [txtOTP setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnSubmitClk:(id)sender
{
    if (txtOTP.text.length < 1)
    {
        [WebServiceCalls alert:@"Enter OTP code First."];
    }
    else
    {
        [self OtpMatchHud];
    }
}

-(void) OtpMatchHud
{
    @try
    {
        // url_live : http://appone.biz/yeepi/api/users/forgot-password-code-verify.json
        
        NSDictionary *dic = @{@"user_id":userId, @"verification_code":txtOTP.text};
        
        SVHUD_START
        [WebServiceCalls POST:@"users/forgot-password-code-verify.json" parameter:dic completionBlock:^(id JSON, WebServiceResult result)
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
                     ResetPassVC *obj = [storybord instantiateViewControllerWithIdentifier:@"ResetPassVC"];
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

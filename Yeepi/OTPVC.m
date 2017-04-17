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
}

@end

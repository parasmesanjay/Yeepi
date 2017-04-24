//
//  OTPVC.h
//  Yeepi
//
//  Created by Ashish Kumar Sharma on 17/04/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OTPVC : UIViewController
{
    IBOutlet UITextField *txtOTP;
    
    IBOutlet UIButton *btnSubmit;
}

@property (nonatomic, strong) NSString *userId;

@end

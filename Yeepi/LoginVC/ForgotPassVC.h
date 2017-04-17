//
//  ForgotPassVC.h
//  Yeepi
//
//  Created by Ashish Kumar Sharma on 17/04/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForgotPassVC : UIViewController
{
    
    IBOutlet UIButton *btnRadioEmail;
    IBOutlet UIButton *btnRadioMobileNo;
    
    IBOutlet UITextField *txtEmail_Mobile;
    
    IBOutlet UIButton *btnGetCode;
}
@end

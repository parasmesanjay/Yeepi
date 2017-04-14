//
//  PaypalAccountVC.h
//  Yeepi
//
//  Created by Ashish Kumar Sharma on 10/04/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PaypalAccountVC : UIViewController
{
    IBOutlet TPKeyboardAvoidingScrollView *tpScrlView;

    IBOutlet UITextField *txtEmail;
    IBOutlet UITextField *txtCardNo;
    
    IBOutlet UIButton *btnDone;
}

@end

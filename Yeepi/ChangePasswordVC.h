//
//  ChangePasswordVC.h
//  Yeepi
//
//  Created by Apple on 22/03/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChangePasswordVC : UIViewController
{
    IBOutlet TPKeyboardAvoidingScrollView *viewTp;
    
    IBOutlet UIView *viewOldPass;
    IBOutlet UIView *viewNewPass1;
    IBOutlet UIView *viewNewPass2;
    
    IBOutlet UITextField *txtOldPass;
    IBOutlet UITextField *txtNewPass1;
    IBOutlet UITextField *txtNewPass2;
    
    IBOutlet UIButton *btnDone;
}
@end

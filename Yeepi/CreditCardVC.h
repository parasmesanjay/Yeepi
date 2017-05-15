//
//  CreditCardVC.h
//  Yeepi
//
//  Created by Ashish Kumar Sharma on 10/04/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreditCardVC : UIViewController<UITextFieldDelegate>
{
    IBOutlet TPKeyboardAvoidingScrollView *tpScrlView;
    
    IBOutlet UITextField *txtHolderName;
    IBOutlet UITextField *txtCardNo;
    IBOutlet UITextField *txtExpireMonth;
    IBOutlet UITextField *txtExpireYear;
    IBOutlet UITextField *txtCCV;
    
    IBOutlet BEMCheckBox *chkBox;

    IBOutlet UIButton *btnDone;
}

@end

//
//  BankAccountVC.h
//  Yeepi
//
//  Created by Ashish Kumar Sharma on 10/04/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BankAccountVC : UIViewController
{
    IBOutlet TPKeyboardAvoidingScrollView *tpScrlView;
    
    IBOutlet UITextField *txtAcHolder;
    IBOutlet UITextField *txtInstitution;
    IBOutlet UITextField *txtTransit;
    IBOutlet UITextField *txtAcNo;
    
    IBOutlet UIImageView *imgRadio;

    IBOutlet UIButton *btnDone;
}
@end

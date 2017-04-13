//
//  RegisterVC.h
//  Yeepi
//
//  Created by Apple on 06/03/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterVC : UIViewController
{
    IBOutlet UIView *viewEmail;
    IBOutlet UIView *viewPassword;
    
    IBOutlet UIButton *btnLogin;
    
    IBOutlet UITextField *textEmail;
    IBOutlet UITextField *textPassword;
}

@end

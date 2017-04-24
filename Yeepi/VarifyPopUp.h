//
//  VarifyPopUp.h
//  Yeepi
//
//  Created by Ashish Kumar Sharma on 19/04/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VarifyPopUp : TPKeyboardAvoidingScrollView
{
    
    IBOutlet UIImageView *imgIcon;
    
    IBOutlet UILabel *lblTitle;
    IBOutlet UILabel *lblMsz;
    
}

@property (nonatomic , strong) UIViewController *selfBack;
@property (nonatomic , readwrite) NSInteger flag;

@property (nonatomic , strong) IBOutlet UIButton *btnSubmit;

@property (nonatomic , strong) IBOutlet UITextField *txtOTP;
@end

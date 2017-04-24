//
//  ResetPassVC.h
//  Yeepi
//
//  Created by Ashish Kumar Sharma on 17/04/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResetPassVC : UIViewController
{
    IBOutlet UIView *viewPass1;
    IBOutlet UIView *viewPass2;
    
    IBOutlet UITextField *txtPass1;
    IBOutlet UITextField *txtPass2;
    
    IBOutlet UIButton *btnDone;
}

@property (nonatomic, strong) NSString *userId;

@end

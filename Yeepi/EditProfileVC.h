//
//  EditProfileVC.h
//  Yeepi
//
//  Created by Ashish Kumar Sharma on 13/06/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditProfileVC : UIViewController<APPhotoPickerDelegate, BEMCheckBoxDelegate>
{
    IBOutlet UIScrollView *mainScroll;
    IBOutlet UIScrollView *viewInner;
    
    IBOutlet UIImageView *imgProfileBkgrnd;
    IBOutlet UIButton *btnProfilePic;
    
    IBOutlet UILabel *lblUserName;
    IBOutlet UILabel *lblAddress;
    
    IBOutlet BEMCheckBox *chkBoxDoTask;
    IBOutlet BEMCheckBox *chkBoxPostTask;
    
    IBOutlet UIView *viewFbVerify;
    IBOutlet UIButton *btnFbVerify;
    
    IBOutlet UIView *viewMobileVerify;
    IBOutlet UIButton *btnMobileVerify;
    
    IBOutlet UIView *viewEmailVerify;
    IBOutlet UIButton *btnMailVerify;
    
    IBOutlet UIView *viewSkill;
    IBOutlet UIView *viewAddSkill;
    IBOutlet UIButton *btnSelectSkill;
    IBOutlet UIButton *btnAddSkill;
    
    IBOutlet UIView *viewTransport;
    IBOutlet UIView *viewAddTransport;
    IBOutlet UIButton *btnSelectTransport;
    IBOutlet UIButton *btnAddTransport;
}

@end

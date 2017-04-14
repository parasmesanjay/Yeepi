//
//  TaskAlertVC.h
//  Yeepi
//
//  Created by Ashish Kumar Sharma on 10/04/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TaskAlertVC : UIViewController
{
    IBOutlet UIScrollView *mainScroll;
    
    IBOutlet BEMCheckBox *chkBoxVertualTask;
    IBOutlet BEMCheckBox *chkBoxOnsiteTask;
    
    IBOutlet UIButton *btnCategory;
    
    IBOutlet UIView *viewBottom;
    IBOutlet UITextField *txtLocation;
    IBOutlet UISlider *sliderDistance;
    IBOutlet UILabel *lblDistance;
    
    IBOutlet UIButton *btnNext;
}
@end

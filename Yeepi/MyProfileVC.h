//
//  MyProfileVC.h
//  Yeepi
//
//  Created by Ashish Kumar Sharma on 10/04/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyProfileVC : UIViewController<segementDelegate>
{
    IBOutlet UIScrollView *mainScroll;
    
    IBOutlet MySegment *mySegment;

    IBOutlet UIButton *btnProceedFill;
    IBOutlet UIButton *btnAddSkill;
    IBOutlet UIButton *btnAddTranp;
    
    
}
@end

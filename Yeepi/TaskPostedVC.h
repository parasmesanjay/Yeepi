//
//  TaskPostedVC.h
//  Yeepi
//
//  Created by Ashish Kumar Sharma on 07/04/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TaskPostedVC : UIViewController<UIScrollViewDelegate>
{
    
    IBOutlet UIScrollView *mainScroll;
    
    IBOutlet UIButton *btnActiveTask;
    IBOutlet UIButton *btnPreviousTask;
    IBOutlet UILabel *lblScrl;
}

@end

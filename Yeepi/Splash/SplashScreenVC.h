//
//  SplashScreenVC.h
//  Yeepi
//
//  Created by Apple on 06/03/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SplashScreenVC : UIViewController<UIScrollViewDelegate>
{
    IBOutlet UIImageView *imgRolling;
    IBOutlet UIScrollView *scroll;
    IBOutlet UIView *viewNext;
    
    IBOutlet UIPageControl *pageCon;
    IBOutlet UIButton *btnNext;
    IBOutlet UIButton *btnSkip;
    
    IBOutlet UIView *viewCon;
}
@end

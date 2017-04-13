//
//  PostBidVC.h
//  Yeepi
//
//  Created by Ashish sharma on 05/04/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostBidVC : UIViewController
{
    IBOutlet UIButton *btnGoMyTask;
    IBOutlet UIButton *btnMakeOffer;
    IBOutlet UIButton *btnDeletOffer;
    
    IBOutlet UITextField *textAmt;
    IBOutlet UITextView *textComment;
    IBOutlet UIView *viewComment;
    
}
@end

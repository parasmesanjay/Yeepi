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
    IBOutlet TPKeyboardAvoidingScrollView *viewScroll;
    
    IBOutlet UILabel *lblTaskName;
    IBOutlet UITextView *txtviewAddress;
    IBOutlet UILabel *lblTaskPrice;
    
    
    IBOutlet UIButton *btnGoMyTask;
    IBOutlet UIButton *btnMakeOffer;
    IBOutlet UIButton *btnDeletOffer;
    
    IBOutlet UIView *viewDeleteOffer;
    
    IBOutlet UITextField *textAmt;
    IBOutlet UITextView *textComment;
    IBOutlet UIView *viewComment;
    
    IBOutlet UIView *viewThankYou;
    
    IBOutlet UILabel *lblThanksMsg;
}

@property(nonatomic,strong) NSDictionary *info;
@property(nonatomic, readwrite) BOOL isFromMyOffer;

@end

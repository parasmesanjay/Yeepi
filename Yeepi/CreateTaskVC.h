//
//  CreateTaskVC.h
//  Yeepi
//
//  Created by Apple on 17/03/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateTaskVC : UIViewController<UITextViewDelegate>
{
    IBOutlet TPKeyboardAvoidingScrollView *viewTPScroll;
    
    IBOutlet UILabel *one;
    IBOutlet UILabel *two;
    IBOutlet UILabel *three;
    
    
    IBOutlet UITextField *textTitle;
    IBOutlet UITextView *textDescriptoin;
    
    IBOutlet UIButton *btnNext;
}

@property (nonatomic, strong) NSMutableDictionary *dict;

@property (nonatomic, readwrite) bool isFromClean;

@property (nonatomic, strong) NSString *serviceID;

@end

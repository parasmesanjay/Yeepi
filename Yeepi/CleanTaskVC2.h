//
//  CleanTaskVC2.h
//  Yeepi
//
//  Created by Ashish sharma on 15/05/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CleanTaskVC2 : UIViewController
{
    
    IBOutlet UIButton *btnlaundry;
    IBOutlet UIButton *btnOven;
    IBOutlet UIButton *btnCabinet;
    IBOutlet UIButton *btnWindow;
    IBOutlet UIButton *btnCarpet;
    
    IBOutlet UITextView *txtNotes;
    
    IBOutlet UIButton *btnNext;
}

@property (nonatomic, strong) NSMutableDictionary *dict;
@end

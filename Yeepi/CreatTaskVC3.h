//
//  CreatTaskVC3.h
//  Yeepi
//
//  Created by Ashish sharma on 15/05/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreatTaskVC3 : UIViewController
{
    
    IBOutlet UITextField *txtTaskerCount;
    
    IBOutlet UIImageView *imgTotalBudget;
    IBOutlet UIImageView *imgHourlyBudget;
    
    IBOutlet UITextField *txtPrice;
    
    IBOutlet UIView *viewHourly;
    IBOutlet UITextField *txtHours;
    IBOutlet UITextField *txtPricePreHour;
    
    IBOutlet UIView *viewPostTask;
    
    IBOutlet UILabel *lblEstimateBudget;
    
    IBOutlet UIView *viewSuccess;
}

@property (nonatomic, strong) NSMutableDictionary *dict;

@end

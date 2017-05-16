//
//  CleanTaskVC1.h
//  Yeepi
//
//  Created by Ashish sharma on 15/05/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CleanTaskVC1 : UIViewController
{

    IBOutlet UIImageView *imgRadioHouse;
    IBOutlet UIImageView *imgRadioApartment;
    IBOutlet UITextField *txtBedRoomCount;
    IBOutlet UITextField *txtBathRoomCount;
    IBOutlet UISwitch *switchLeaseClean;
    
    IBOutlet UIButton *btnContinue;
}

@end

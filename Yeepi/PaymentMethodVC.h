//
//  PaymentMethodVC.h
//  Yeepi
//
//  Created by Ashish Kumar Sharma on 08/04/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PaymentMethodVC : UIViewController<segementDelegate>
{
    
    IBOutlet MySegment *mySegment;
    
    IBOutlet UIImageView *img_Bank_Card;
    IBOutlet UILabel *lblTitle;
    IBOutlet UIButton *btn_Bank_Card;

}

@end

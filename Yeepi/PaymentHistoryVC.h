//
//  PaymentHistoryVC.h
//  Yeepi
//
//  Created by Ashish Kumar Sharma on 10/04/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PaymentHistoryVC : UIViewController<UITableViewDelegate, UITableViewDataSource, segementDelegate>
{
    
    IBOutlet MySegment *mySegment;
    
    IBOutlet UITableView *tblViewPaymentHistory;
    
}

@end

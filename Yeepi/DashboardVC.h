//
//  DashboardVC.h
//  Yeepi
//
//  Created by Ashish sharma on 05/04/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DashboardVC : UIViewController<segementDelegate, UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UIScrollView *viewScroll;
    IBOutlet MySegment *mySegment;
    
    IBOutlet UIView *viewTasker;
    
    IBOutlet UILabel *lblTaskerBids;
    IBOutlet UILabel *lblTaskAssignedToYou;
    IBOutlet UILabel *lblTaskerPendingPayments;
    
    IBOutlet UIView *viewHolder;
    
    IBOutlet UILabel *lblPosterBids;
    IBOutlet UILabel *lblTaskAssignedByYou;
    IBOutlet UILabel *lblPosterPendingPayments;
    
    IBOutlet UITableView *tblViewDashboard;
}

@end

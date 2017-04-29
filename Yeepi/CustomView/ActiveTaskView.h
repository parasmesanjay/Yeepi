//
//  ActiveTaskView.h
//  Yeepi
//
//  Created by Ashish Kumar Sharma on 07/04/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActiveTaskView : UIView<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tblViewActiveTask;

@property(nonatomic,strong)UIViewController *selfBack;

@property (strong, nonatomic) NSArray *arrTask;

@end

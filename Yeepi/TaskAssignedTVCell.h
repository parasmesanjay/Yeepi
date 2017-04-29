//
//  TaskAssignedTVCell.h
//  Yeepi
//
//  Created by Ashish Kumar Sharma on 27/04/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TaskAssignedTVCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UITextView *txtViewtaskName;
@property (strong, nonatomic) IBOutlet UILabel *lblTaskBudget;
@property (strong, nonatomic) IBOutlet UITextView *txtViewAddress;

@property (strong, nonatomic) IBOutlet UILabel *lblOfferAmount;
@property (strong, nonatomic) IBOutlet UIImageView *imgUser;
@property (strong, nonatomic) IBOutlet UILabel *lblUserName;
@property (strong, nonatomic) IBOutlet UITextView *txtViewTaskType;

@end

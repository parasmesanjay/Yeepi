//
//  MyOfferTVCell.h
//  Yeepi
//
//  Created by Ashish Kumar Sharma on 27/04/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyOfferTVCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *lbltaskName;
@property (strong, nonatomic) IBOutlet UILabel *lblTaskBudget;
@property (strong, nonatomic) IBOutlet UILabel *lblAddress;

@property (strong, nonatomic) IBOutlet UILabel *lblOfferAmount;
@property (strong, nonatomic) IBOutlet UIImageView *imgUser;
@property (strong, nonatomic) IBOutlet UILabel *lblUserName;
@property (strong, nonatomic) IBOutlet UILabel *lblTaskType;

@property (strong, nonatomic) IBOutlet UIButton *btnModifyOffer;
@end

//
//  BrowseTVCell.h
//  Yeepi
//
//  Created by Ashish sharma on 14/04/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BrowseTVCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIButton *btnMakeOffer;

@property (strong, nonatomic) IBOutlet UITextView *lblTiltle;
@property (strong, nonatomic) IBOutlet UITextView *lblAddress;

@property (strong, nonatomic) IBOutlet UIView *viewNoOffer;

@property (strong, nonatomic) IBOutlet UILabel *lblOfferCount;
@property (strong, nonatomic) IBOutlet UILabel *lblAmount;

@property (strong, nonatomic) IBOutlet UIImageView *imgCat_icon;
@end

//
//  HeaderLogin.h
//  Yeepi
//
//  Created by Apple on 08/03/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeaderLogin : UIView

@property (strong, nonatomic) IBOutlet UILabel *lblTitle;
@property (strong, nonatomic) IBOutlet UIImageView *imgBack;
@property (strong, nonatomic) IBOutlet UIButton *btnBack;

@property (nonatomic , readwrite) BOOL isBack;
@property (nonatomic , strong) UIViewController *selfBack;
@end

//
//  TaskAlertVC.m
//  Yeepi
//
//  Created by Ashish Kumar Sharma on 10/04/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "TaskAlertVC.h"

@interface TaskAlertVC ()

@end

@implementation TaskAlertVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GET_HEADER_VIEW
    header.lblTitle.text = @"TASK ALERT";
    STATUS_BAR
    
    chkBoxVertualTask.boxType = chkBoxOnsiteTask.boxType = BEMBoxTypeSquare;
        
    [mainScroll setContentSize:CGSizeMake(WIDTH, viewBottom.frame.origin.y+280+30)];
    
    txtLocation.layer.borderWidth = btnCategory.layer.borderWidth = 1;
    
    txtLocation.layer.borderColor = btnCategory.layer.borderColor = [[UIColor colorWithRed:53/255.0 green:62/255.0 blue:91/255.0 alpha:1.0] CGColor];
    
    txtLocation.layer.cornerRadius = btnCategory.layer.cornerRadius = 10;
    btnNext.layer.cornerRadius = 22;
    
    txtLocation.layer.masksToBounds = btnCategory.layer.masksToBounds = btnNext.layer.masksToBounds = YES;
    
    txtLocation.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Search" attributes:@{NSForegroundColorAttributeName: [UIColor colorWithRed:135/255.0 green:145/255.0 blue:155/255.0 alpha:1.0]}];
    
    UIView *vw = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50 , 50)];
    
    UIImageView *imgArrow = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 20, 20)];
    imgArrow.image = [UIImage imageNamed:@"browse.png"];
    
    [imgArrow setTintColor:[UIColor colorWithRed:53/255.0 green:62/255.0 blue:91/255.0 alpha:1.0]];
    imgArrow.image =  [imgArrow.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    [vw addSubview:imgArrow];
    
    txtLocation.leftView = vw;
    
    txtLocation.leftViewMode = UITextFieldViewModeAlways;
    
    txtLocation.clearButtonMode = UITextFieldViewModeWhileEditing;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

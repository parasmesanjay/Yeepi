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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

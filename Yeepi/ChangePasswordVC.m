//
//  ChangePasswordVC.m
//  Yeepi
//
//  Created by Apple on 22/03/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "ChangePasswordVC.h"

@interface ChangePasswordVC ()

@end

@implementation ChangePasswordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GET_HEADER_VIEW
    header.lblTitle.text = @"CHANGE PASSWORD";
    STATUS_BAR
    self.view.backgroundColor = APP_COLOR_BLUE;}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

//
//  MyProfileVC.m
//  Yeepi
//
//  Created by Ashish Kumar Sharma on 10/04/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "MyProfileVC.h"

@interface MyProfileVC ()

@end

@implementation MyProfileVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GET_HEADER_VIEW
    header.lblTitle.text = @"MY PROFILE";
    STATUS_BAR
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

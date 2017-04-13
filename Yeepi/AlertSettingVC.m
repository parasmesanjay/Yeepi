//
//  AlertSettingVC.m
//  Yeepi
//
//  Created by Ashish Kumar Sharma on 08/04/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "AlertSettingVC.h"

@interface AlertSettingVC ()

@end

@implementation AlertSettingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GET_HEADER_VIEW
    header.lblTitle.text = @"ALERT SETTING";
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

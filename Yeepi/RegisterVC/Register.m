//
//  Register.m
//  Yeepi
//
//  Created by Apple on 08/03/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "Register.h"

@interface Register ()

@end

@implementation Register

- (void)viewDidLoad {
    [super viewDidLoad];

    GET_HEADER_VIEW
    header.lblTitle.text = @"Signup to Yeepi";
    STATUS_BAR
    self.view.backgroundColor = APP_COLOR_BLUE;
    
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
HIDE_KEY_ON_TOUCH
@end

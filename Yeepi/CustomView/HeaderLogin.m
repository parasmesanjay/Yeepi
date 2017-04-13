//
//  HeaderLogin.m
//  Yeepi
//
//  Created by Apple on 08/03/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "HeaderLogin.h"

@implementation HeaderLogin

- (void)drawRect:(CGRect)rect
{
    self.backgroundColor = APP_COLOR_HEADER;
    if (_isBack)
    {
        _btnBack.hidden = YES;
        _imgBack.hidden = YES;
    }
}
- (IBAction)tapBack:(id)sender {
    
    [self.selfBack.navigationController popViewControllerAnimated:YES];
}

@end

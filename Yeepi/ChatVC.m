//
//  ChatVC.m
//  Yeepi
//
//  Created by Apple on 17/03/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "ChatVC.h"

@interface ChatVC ()

@end

@implementation ChatVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GET_HEADER_VIEW
    header.lblTitle.text = @"Chatbox";
    STATUS_BAR
    self.view.backgroundColor = APP_COLOR_BLUE;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}
@end

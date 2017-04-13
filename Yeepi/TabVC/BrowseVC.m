//
//  BrowseVC.m
//  Yeepi
//
//  Created by Apple on 15/03/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "BrowseVC.h"

@interface BrowseVC ()

@end

@implementation BrowseVC

- (void)viewDidLoad
{
    [super viewDidLoad];

    GET_HEADER_VIEW_NO_BACK
    header.lblTitle.text = @"Browse";
    STATUS_BAR
    self.view.backgroundColor = APP_COLOR_BLUE;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end

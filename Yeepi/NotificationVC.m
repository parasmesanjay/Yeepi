//
//  NotificationVC.m
//  Yeepi
//
//  Created by Apple on 22/03/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "NotificationVC.h"

@interface NotificationVC ()

@end

@implementation NotificationVC

- (void)viewDidLoad {
    [super viewDidLoad];
   
    GET_HEADER_VIEW
    header.lblTitle.text = @"Notifications";
    STATUS_BAR
    self.view.backgroundColor = APP_COLOR_BLUE;

}

#pragma mark Table Delegates

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return 70;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *itemCell = [[[NSBundle mainBundle]loadNibNamed:@"Cell" owner:self options:nil ]objectAtIndex:4];
    
    itemCell.backgroundColor = CLEAR_COLOR;
    return itemCell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end

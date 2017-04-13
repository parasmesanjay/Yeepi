//
//  SelfTasksVC.m
//  Yeepi
//
//  Created by Apple on 17/03/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "SelfTasksVC.h"

@interface SelfTasksVC ()

@end

@implementation SelfTasksVC

@synthesize index;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GET_HEADER_VIEW
    header.lblTitle.text = @"Tasks";
    STATUS_BAR
    self.view.backgroundColor = APP_COLOR_BLUE;
    
    
    
}

#pragma mark Table Delegates

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    if (index == 1)
    {
        return 230;
    }
    else
    {
        return 215;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *itemCell = [[[NSBundle mainBundle]loadNibNamed:@"Cell" owner:self options:nil ]objectAtIndex:index];
    UIView *view = [itemCell viewWithTag:1];
    view.layer.cornerRadius = 10;
    
    itemCell.backgroundColor = CLEAR_COLOR;
    return itemCell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)tapSegment:(id)sender
{
    
}

@end

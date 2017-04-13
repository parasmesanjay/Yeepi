//
//  DashboardVC.m
//  Yeepi
//
//  Created by Ashish sharma on 05/04/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "DashboardVC.h"

@interface DashboardVC ()

@end

@implementation DashboardVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GET_HEADER_VIEW
    header.lblTitle.text = @"DASHBOARD";
    STATUS_BAR
    
    viewHolder.hidden = YES;
    
    [viewScroll setContentSize:CGSizeMake(WIDTH, tblViewDashboard.frame.origin.y+HEIGHT-64)];
    
    mySegment.backgroundColor = CLEAR_COLOR;
    mySegment.segmentFirstName = @"Tasker";
    mySegment.segmentSecondName = @"Task Holder";
    
    mySegment.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

-(void)DidTapButton:(NSInteger)tag
{
    if (tag == 1)
    {
        viewHolder.hidden = YES;
        viewTasker.hidden = NO;
        
        viewTasker.frame = CGRectMake(0, 108, WIDTH, 235);
        tblViewDashboard.frame = CGRectMake(0, 108+235, WIDTH, HEIGHT-64);
    }
    else
    {
        viewHolder.hidden = NO;
        viewTasker.hidden = YES;
        
        viewTasker.frame = CGRectMake(0, 108, WIDTH, 150);
        tblViewDashboard.frame = CGRectMake(0, 108+150, WIDTH, HEIGHT-64);
    }
    
    [viewScroll setContentSize:CGSizeMake(WIDTH, tblViewDashboard.frame.origin.y+HEIGHT-64)];
}

#pragma mark Tableview delegates

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 30)];
    view.backgroundColor = APP_COLOR_BLUE;
    
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 200, 30)];
    lbl.text = @"NOTIFICATIOS";
    lbl.textColor = WHITE_COLOR;
    lbl.backgroundColor = APP_COLOR_BLUE;
    
    [view addSubview:lbl];
    
    return view;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return 70;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *itemCell = [[[NSBundle mainBundle]loadNibNamed:@"Cell" owner:self options:nil ]objectAtIndex:4];
    UIView *view = [itemCell viewWithTag:1];
    view.layer.cornerRadius = 10;
    
    itemCell.backgroundColor = CLEAR_COLOR;
    return itemCell;
}

@end

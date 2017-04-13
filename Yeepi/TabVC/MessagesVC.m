//
//  MessagesVC.m
//  Yeepi
//
//  Created by Apple on 15/03/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "MessagesVC.h"

@interface MessagesVC ()

@end

@implementation MessagesVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GET_HEADER_VIEW_NO_BACK
    header.lblTitle.text = @"Messaegs";
    STATUS_BAR
    self.view.backgroundColor = APP_COLOR_BLUE;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Table Delegates

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *itemCell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    /*
    UILabel *lblTitle = [itemCell viewWithTag:1];
    lblTitle.text = [arrTitle[indexPath.row] uppercaseString];

    UILabel *lblSubtitle = [itemCell viewWithTag:2];
    lblSubtitle.text = arrSubtitles[indexPath.row];
    */
    
    return itemCell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"goChat" sender:nil];
}

@end

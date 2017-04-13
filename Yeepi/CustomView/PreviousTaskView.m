//
//  PreviousTaskView.m
//  Yeepi
//
//  Created by Ashish Kumar Sharma on 07/04/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "PreviousTaskView.h"

@implementation PreviousTaskView

- (void)drawRect:(CGRect)rect
{
    // Drawing code
}

#pragma mark - TableView View datasource and delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

/*- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
 {
    return 315;
 }
*/

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *itemCell = [[[NSBundle mainBundle]loadNibNamed:@"Cell" owner:self options:nil ]objectAtIndex:6];
    UIView *view = [itemCell viewWithTag:1];
    view.layer.cornerRadius = 10;
    
    itemCell.backgroundColor = CLEAR_COLOR;
    return itemCell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end

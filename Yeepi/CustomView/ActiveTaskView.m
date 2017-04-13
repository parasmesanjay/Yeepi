//
//  ActiveTaskView.m
//  Yeepi
//
//  Created by Ashish Kumar Sharma on 07/04/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "ActiveTaskView.h"

@implementation ActiveTaskView


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
}*/

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *itemCell = [[[NSBundle mainBundle]loadNibNamed:@"Cell" owner:self options:nil ]objectAtIndex:5];
    UIView *view = [itemCell viewWithTag:1];
    view.layer.cornerRadius = 10;
    UIButton *btn = [itemCell viewWithTag:2];
    btn.layer.cornerRadius = btn.frame.size.height/2;
    btn.layer.borderWidth = 1;
    btn.layer.borderColor = [APP_COLOR_GREEN CGColor];
    
    itemCell.backgroundColor = CLEAR_COLOR;
    return itemCell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end

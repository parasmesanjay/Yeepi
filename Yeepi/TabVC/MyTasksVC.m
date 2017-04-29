//
//  MyTasksVC.m
//  Yeepi
//
//  Created by Apple on 15/03/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "MyTasksVC.h"

@interface MyTasksVC ()
{
    NSArray *arrTitle,*arrSubtitles;
}
@end

@implementation MyTasksVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    GET_HEADER_VIEW_NO_BACK
    header.lblTitle.text = @"My tasks";
    STATUS_BAR
    self.view.backgroundColor = APP_COLOR_BLUE;
    
    arrTitle = @[@"task posted",@"task assigned",@"my offers",@"cancelled tasks"];
    arrSubtitles = @[@"Task posted by you",@"Task assigned by you",@"Tasks showing your biddings",@"Tasks cancelled"];

}

#pragma mark Table Delegates

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *itemCell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    UILabel *lblTitle = [itemCell viewWithTag:1];
    lblTitle.text = [arrTitle[indexPath.row] uppercaseString];
    
    UILabel *lblSubtitle = [itemCell viewWithTag:2];
    lblSubtitle.text = arrSubtitles[indexPath.row] ;
    
    return itemCell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        [self performSegueWithIdentifier:@"TaskPosted" sender:nil];
    }
    else if (indexPath.row == 3)
    {
        //[self performSegueWithIdentifier:@"toTasks" sender:nil];
    }
    else
    {
        UIStoryboard *storybord = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        SelfTasksVC *obj = [storybord instantiateViewControllerWithIdentifier:@"SelfTasksVC"];
        obj.index = indexPath.row;
        [self.navigationController pushViewController:obj animated:YES];
    }
}


@end

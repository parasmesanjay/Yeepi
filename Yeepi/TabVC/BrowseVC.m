//
//  BrowseVC.m
//  Yeepi
//
//  Created by Apple on 15/03/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "BrowseVC.h"
#import "BrowseTVCell.h"

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




#pragma mark Table Delegates

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
     return 211;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BrowseTVCell *itemCell = [[[NSBundle mainBundle]loadNibNamed:@"Cell" owner:self options:nil ]objectAtIndex:3];
    UIView *view = [itemCell viewWithTag:1];
    view.layer.cornerRadius = 10;
    
    [itemCell.btnMakeOffer addTarget:self action:@selector(tapMakeOffer:) forControlEvents:UIControlEventTouchUpInside];
    itemCell.tag = indexPath.row;
    
    itemCell.btnMakeOffer.layer.cornerRadius = itemCell.btnMakeOffer.frame.size.height/2;
    
    itemCell.backgroundColor = CLEAR_COLOR;
    return itemCell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(void)tapMakeOffer:(UIButton *)sender
{
    [self performSegueWithIdentifier:@"goMakeOffer" sender:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}




@end

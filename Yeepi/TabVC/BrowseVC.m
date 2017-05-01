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
{
    UIRefreshControl *refreshControl;

    NSMutableArray *arrayTasks;
}
@end

@implementation BrowseVC

- (void)viewDidLoad
{
    [super viewDidLoad];

    GET_HEADER_VIEW_NO_BACK
    header.lblTitle.text = @"Browse";
    STATUS_BAR
    self.view.backgroundColor = APP_COLOR_BLUE;
    
    [SVProgressHUD showWithStatus:@"Loading..."];
    [self performSelector:@selector(loadData) withObject:nil afterDelay:0];
    
    refreshControl = [[UIRefreshControl alloc]init];
    [table addSubview:refreshControl];
    [refreshControl addTarget:self action:@selector(callRefresher) forControlEvents:UIControlEventValueChanged];
}

-(void)callRefresher
{
    [self performSelector:@selector(loadData) withObject:nil afterDelay:0];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    
    if ([AppDelegate AppDelegate].isMadeBid)
    {
        [AppDelegate AppDelegate].isMadeBid = false;
        
        [SVProgressHUD showWithStatus:@"Loading..."];
        [self performSelector:@selector(loadData) withObject:nil afterDelay:0];
    }
}

-(void)loadData
{
    @try
    {
        NSString *url = [NSString stringWithFormat:@"tasks/index/{\"user_id\":%@,\"status\":{\"0\":\"AL\"},\"task_type\":{\"0\":\"AL\"},\"sort_by\":\"M\",\"task_location\":\"1\"}.json",User_Id];
        
        [WebServiceCalls GET:url parameter:nil completionBlock:^(id JSON, WebServiceResult result)
         {
             [SVProgressHUD dismiss];
             
             [refreshControl endRefreshing];
             
             NSLog(@"%@",JSON);
             
             @try
             {
                 arrayTasks = [NSMutableArray arrayWithArray:JSON[@"response"][@"data"]];
                 table.delegate = self;
                 table.dataSource = self;
                 
                 [table reloadData];
                 
             } @catch (NSException *exception)
             {
                 
             } @finally {
                 
             }
             
         }];
        
    }
    @catch (NSException *exception)
    {
        
    } @finally {
        
    }
}

#pragma mark Table Delegates

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrayTasks.count;
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
    itemCell.btnMakeOffer.tag = indexPath.row;
    itemCell.btnMakeOffer.layer.cornerRadius = itemCell.btnMakeOffer.frame.size.height/2;
    
    id check = arrayTasks[indexPath.row][@"self_offer"];
    
    if([check isKindOfClass:[NSDictionary class]])
    {
        [itemCell.btnMakeOffer setTitle:@"Modify Offer" forState:UIControlStateNormal];
    }
    
    itemCell.lblTiltle.text = arrayTasks[indexPath.row][@"title"];
    itemCell.lblAddress.text = arrayTasks[indexPath.row][@"location_name"];
    itemCell.lblAmount.text = [NSString stringWithFormat:@"$%@",arrayTasks[indexPath.row][@"estimate_budget"]];
    itemCell.lblTaskStatus.text = arrayTasks[indexPath.row][@"status"];

    if ([arrayTasks[indexPath.row][@"task_offer_count"] integerValue] > 0)
    {
        itemCell.viewNoOffer.hidden = YES;
        itemCell.lblOfferCount.text = [NSString stringWithFormat:@"%@",arrayTasks[indexPath.row][@"task_offer_count"]];
        
        itemCell.lblOfferCount.layer.cornerRadius = 25;
        itemCell.lblOfferCount.clipsToBounds = YES;
    }
    else
    {
        itemCell.viewNoOffer.hidden = NO;
    }
    
    itemCell.backgroundColor = CLEAR_COLOR;
    return itemCell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(void)tapMakeOffer:(UIButton *)sender
{
    UIStoryboard *storybord = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    PostBidVC *obj = [storybord instantiateViewControllerWithIdentifier:@"PostBidVC"];
    obj.info = arrayTasks[sender.tag];
    obj.isFromMyOffer = false;
    [self.navigationController pushViewController:obj animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}




@end

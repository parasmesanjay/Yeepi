//
//  SelfTasksVC.m
//  Yeepi
//
//  Created by Apple on 17/03/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "SelfTasksVC.h"
#import "TaskAssignedTVCell.h"
#import "MyOfferTVCell.h"

@interface SelfTasksVC ()

@end

@implementation SelfTasksVC
{
    NSArray *arrAssigned_MyOffers;
    
    UIRefreshControl *refreshControl;

}

@synthesize index;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GET_HEADER_VIEW
    if (index == 1)
    {
        header.lblTitle.text = @"Tasks Assigned";
    }
    else
    {
        header.lblTitle.text = @"My Offers";
    }
    STATUS_BAR
    self.view.backgroundColor = APP_COLOR_BLUE;
    
    [SVProgressHUD showWithStatus:@"Loading..."];
    [self performSelector:@selector(loadData) withObject:nil afterDelay:0];
    
    refreshControl = [[UIRefreshControl alloc]init];
    [tblviewAssigned_Offer addSubview:refreshControl];
    [refreshControl addTarget:self action:@selector(callRefresher) forControlEvents:UIControlEventValueChanged];
}

-(void)callRefresher
{
    [self performSelector:@selector(loadData) withObject:nil afterDelay:0];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    
    if (index != 1)
    {
        if ([AppDelegate AppDelegate].isMadeBid)
        {
            [AppDelegate AppDelegate].isMadeBid = false;
            
            [SVProgressHUD showWithStatus:@"Loading..."];
            [self performSelector:@selector(loadData) withObject:nil afterDelay:0];
        }
    }
}

-(void)loadData
{
    @try
    {
        // http://appone.biz/yeepi/api/task-offers/my-offer-list/{userId}.json
        // http://appone.biz/yeepi/api/tasks/assigned-task/{userId}.json
        NSString *url;
        
        if (index == 1)
        {
            url = [NSString stringWithFormat:@"tasks/assigned-task/%@.json",User_Id];
        }
        else
        {
            url = [NSString stringWithFormat:@"task-offers/my-offer-list/%@.json",User_Id];
        }
        
        [WebServiceCalls GET:url parameter:nil completionBlock:^(id JSON, WebServiceResult result)
         {
             [SVProgressHUD dismiss];
             
             [refreshControl endRefreshing];
             
             NSLog(@"%@",JSON);
             
             @try
             {
                 if ([JSON[@"response"][@"status"] integerValue] == 1)
                 {
                     arrAssigned_MyOffers = [NSMutableArray arrayWithArray:JSON[@"response"][@"data"]];
                     tblviewAssigned_Offer.delegate = self;
                     tblviewAssigned_Offer.dataSource = self;
                     
                     [tblviewAssigned_Offer reloadData];
                 }
                 else
                 {
                     [SVProgressHUD showInfoWithStatus:[NSString stringWithFormat:@"%@", JSON[@"response"][@"msg"]]];
                 }
                 
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
    return arrAssigned_MyOffers.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    if (index == 1)
    {
        return 230;
    }
    else
    {
        return 200;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (index == 1)
    {
        TaskAssignedTVCell *itemCell = [[[NSBundle mainBundle]loadNibNamed:@"Cell" owner:self options:nil ]objectAtIndex:index];
        UIView *view = [itemCell viewWithTag:1];
        view.layer.cornerRadius = 10;
        
        itemCell.txtViewtaskName.text = [NSString stringWithFormat:@"%@", arrAssigned_MyOffers[indexPath.row][@"title"]];
        
        itemCell.txtViewAddress.text = [NSString stringWithFormat:@"%@", arrAssigned_MyOffers[indexPath.row][@"location_name"]];
        
        itemCell.lblTaskBudget.text = [NSString stringWithFormat:@"$%@", arrAssigned_MyOffers[indexPath.row][@"estimate_budget"]];
        
        itemCell.lblUserName.text = [NSString stringWithFormat:@"%@", arrAssigned_MyOffers[indexPath.row][@"name"]];
        
        itemCell.txtViewTaskType.text = [NSString stringWithFormat:@"%@", arrAssigned_MyOffers[indexPath.row][@"description"]];
        
        itemCell.lblOfferAmount.text = [NSString stringWithFormat:@"$%@", arrAssigned_MyOffers[indexPath.row][@"offer_amount"]];
        
        itemCell.imgUser.layer.cornerRadius = 30;
        itemCell.imgUser.layer.masksToBounds = YES;
        
        [itemCell.imgUser sd_setImageWithURL:[NSURL URLWithString:arrAssigned_MyOffers[indexPath.row][@"poster_image"]] placeholderImage:[UIImage imageNamed:@"Empty_user.png"]];
        
        itemCell.backgroundColor = CLEAR_COLOR;
        return itemCell;
    }
    else
    {
        MyOfferTVCell *itemCell = [[[NSBundle mainBundle]loadNibNamed:@"Cell" owner:self options:nil ]objectAtIndex:index];
        UIView *view = [itemCell viewWithTag:1];
        view.layer.cornerRadius = 10;
        
        itemCell.lbltaskName.text = [NSString stringWithFormat:@"%@", arrAssigned_MyOffers[indexPath.row][@"title"]];
        
        itemCell.lblAddress.text = [NSString stringWithFormat:@"%@", arrAssigned_MyOffers[indexPath.row][@"location_name"]];
        
        itemCell.lblTaskBudget.text = [NSString stringWithFormat:@"$%@", arrAssigned_MyOffers[indexPath.row][@"estimate_budget"]];
        
        itemCell.lblUserName.text = [NSString stringWithFormat:@"%@", arrAssigned_MyOffers[indexPath.row][@"username"]];
        
        itemCell.lblTaskType.text = [NSString stringWithFormat:@"%@", arrAssigned_MyOffers[indexPath.row][@"service_type"]];
        
        itemCell.lblOfferAmount.text = [NSString stringWithFormat:@"$%@", arrAssigned_MyOffers[indexPath.row][@"offer_amount"]];
        
        itemCell.imgUser.layer.cornerRadius = 25;
        itemCell.imgUser.layer.masksToBounds = YES;
        
        [itemCell.imgUser sd_setImageWithURL:[NSURL URLWithString:arrAssigned_MyOffers[indexPath.row][@"image"]] placeholderImage:[UIImage imageNamed:@"Empty_user.png"]];
        
        itemCell.btnModifyOffer.layer.cornerRadius = 18;
        itemCell.btnModifyOffer.layer.masksToBounds = YES;
        itemCell.btnModifyOffer.layer.borderWidth = 1;
        itemCell.btnModifyOffer.layer.borderColor = [APP_COLOR_GREEN CGColor];
        [itemCell.btnModifyOffer addTarget:self action:@selector(tapModifyOffer:) forControlEvents:UIControlEventTouchUpInside];
        itemCell.btnModifyOffer.tag = indexPath.row;
        
        itemCell.backgroundColor = CLEAR_COLOR;
        return itemCell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (index == 1)
    {
    }
    else
    {
        /*UIStoryboard *storybord = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        PostBidVC *obj = [storybord instantiateViewControllerWithIdentifier:@"PostBidVC"];
        obj.info = arrMyOffers[indexPath.row];
        [self.navigationController pushViewController:obj animated:YES];*/
    }
}

-(void)tapModifyOffer:(UIButton *)sender
{
    UIStoryboard *storybord = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    PostBidVC *obj = [storybord instantiateViewControllerWithIdentifier:@"PostBidVC"];
    obj.info = arrAssigned_MyOffers[sender.tag];
    obj.isFromMyOffer = true;
    [self.navigationController pushViewController:obj animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)tapSegment:(id)sender
{
    
}

@end

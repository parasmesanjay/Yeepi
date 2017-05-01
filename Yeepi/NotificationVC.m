//
//  NotificationVC.m
//  Yeepi
//
//  Created by Apple on 22/03/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "NotificationVC.h"
#import "NotificationTVCell.h"

@interface NotificationVC ()

@end

@implementation NotificationVC
{
    NSArray *arrNotification;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    GET_HEADER_VIEW
    header.lblTitle.text = @"Notifications";
    STATUS_BAR
    self.view.backgroundColor = APP_COLOR_BLUE;
    
    [SVProgressHUD showWithStatus:@"Loading..."];
    [self performSelector:@selector(loadData) withObject:nil afterDelay:0];
}

-(void)loadData
{
    @try
    {
        //http://appone.biz/yeepi/api/users/all-notification/2.json
        
        NSString *url = [NSString stringWithFormat:@"users/all-notification/%@.json",User_Id];
        
        [WebServiceCalls GET:url parameter:nil completionBlock:^(id JSON, WebServiceResult result)
         {
             [SVProgressHUD dismiss];
             
             NSLog(@"%@",JSON);
             
             @try
             {
                 if ([JSON[@"response"][@"status"] integerValue] == 1)
                 {
                     arrNotification = JSON[@"response"][@"data"];
                     
                     [tblViewNotification reloadData];
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
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return 70;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NotificationTVCell *itemCell = [[[NSBundle mainBundle]loadNibNamed:@"Cell" owner:self options:nil ]objectAtIndex:4];
    
    itemCell.imgUser.layer.cornerRadius = 25;
    itemCell.imgUser.layer.masksToBounds = YES;
    
    itemCell.backgroundColor = CLEAR_COLOR;
    return itemCell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end

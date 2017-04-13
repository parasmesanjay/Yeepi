//
//  MoreVC.m
//  Yeepi
//
//  Created by Apple on 15/03/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "MoreVC.h"

@interface MoreVC ()
{
    NSArray *arrTitle, *arrIdentifiers;
}
@end

@implementation MoreVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    GET_HEADER_VIEW_NO_BACK
    header.lblTitle.text = @"More";
    STATUS_BAR
    self.view.backgroundColor = APP_COLOR_BLUE;

    arrTitle = @[@"dashboard",@"my profile",@"payment history",@"payment method",@"notifications",@"task alerts",@"alret settings",@"Taxes",@"change password",@"logout"];
    
    arrIdentifiers = @[@"DashboardVC", @"MyProfileVC", @"PaymentHistoryVC", @"PaymentMethodVC", @"NotificationVC", @"TaskAlertVC", @"AlertSettingVC", @"TaxNumberVC", @"ChangePasswordVC", @"Login"];
    
    [table reloadData];
}


#pragma mark Table Delegates

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrTitle.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *itemCell = [[[NSBundle mainBundle]loadNibNamed:@"Cell" owner:self options:nil ]objectAtIndex:0];
    UILabel *lblTitle = [itemCell viewWithTag:1];
    lblTitle.text = [arrTitle[indexPath.row] uppercaseString];
    
    return itemCell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row < 9)
    {
        UIStoryboard *storybord = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *obj = [storybord instantiateViewControllerWithIdentifier:arrIdentifiers[indexPath.row]];
        [self.navigationController pushViewController:obj animated:YES];
    }
    else
    {
        UIAlertController *alertController = [UIAlertController  alertControllerWithTitle:@"Yeepi !" message:@"Are you want to Logout ?" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){  }];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
                                   {
                                       UIStoryboard *storybord = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                                       UIViewController *obj = [storybord instantiateViewControllerWithIdentifier:arrIdentifiers[indexPath.row]];
                                       [self.navigationController pushViewController:obj animated:YES];
                                       
                                   }];
        [alertController addAction:cancelAction];
        [alertController addAction:okAction];
        [self.navigationController presentViewController:alertController animated:YES completion:nil];
    }
}

@end

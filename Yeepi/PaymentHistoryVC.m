//
//  PaymentHistoryVC.m
//  Yeepi
//
//  Created by Ashish Kumar Sharma on 10/04/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "PaymentHistoryVC.h"

@interface PaymentHistoryVC ()

@end

@implementation PaymentHistoryVC
{
    NSInteger index;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    GET_HEADER_VIEW
    header.lblTitle.text = @"PAYMENT HISTORY";
    STATUS_BAR
    
    mySegment.backgroundColor = CLEAR_COLOR;
    mySegment.segmentFirstName = @"Payments Made";
    mySegment.segmentSecondName = @"Payments Received";
    
    mySegment.delegate = self;
    
    index = 1;
}

-(void)DidTapButton:(NSInteger)tag
{
    if (tag == 1)
    {
        index = tag;
        
        [tblViewPaymentHistory reloadData];
    }
    else
    {
        index = tag;
        
        [tblViewPaymentHistory reloadData];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark tableview delegates

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *itemCell = [tableView dequeueReusableCellWithIdentifier:@"PaymentHistory"];
    
    UILabel *lbl = [itemCell viewWithTag:1];
    if (index == 1)
    {
        lbl.text = @"Paid $40 to Romeo T.";
    }
    else
    {
        lbl.text = @"You received $50 from Romeo T.";
    }
    
    return itemCell;
}

@end

//
//  BankAccountVC.m
//  Yeepi
//
//  Created by Ashish Kumar Sharma on 10/04/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "BankAccountVC.h"

@interface BankAccountVC ()

@end

@implementation BankAccountVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    GET_HEADER_VIEW
    header.lblTitle.text = @"PAYMENT METHOD";
    STATUS_BAR
    
    chkBox.boxType = BEMBoxTypeSquare;
    chkBox.on = YES;

    txtAcHolder.layer.cornerRadius = txtInstitution.layer.cornerRadius = txtTransit.layer.cornerRadius = txtAcNo.layer.cornerRadius = 10;
    btnDone.layer.cornerRadius = 22;
    
    txtAcHolder.layer.masksToBounds = txtInstitution.layer.masksToBounds = txtTransit.layer.masksToBounds = txtAcNo.layer.masksToBounds = btnDone.layer.masksToBounds = YES;
    
    txtAcHolder.layer.borderWidth = txtInstitution.layer.borderWidth = txtTransit.layer.borderWidth = txtAcNo.layer.borderWidth = 1;
    
    txtAcHolder.layer.borderColor = txtInstitution.layer.borderColor = txtTransit.layer.borderColor = txtAcNo.layer.borderColor = [[UIColor colorWithRed:53/255.0 green:62/255.0 blue:91/255.0 alpha:1.0] CGColor];
    
    txtAcHolder.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"eg: Jason Range" attributes:@{NSForegroundColorAttributeName: [UIColor colorWithRed:135/255.0 green:145/255.0 blue:155/255.0 alpha:1.0]}];
    
    txtInstitution.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"eg: Swiss Bank" attributes:@{NSForegroundColorAttributeName: [UIColor colorWithRed:135/255.0 green:145/255.0 blue:155/255.0 alpha:1.0]}];
    
    txtTransit.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"eg: Transit" attributes:@{NSForegroundColorAttributeName: [UIColor colorWithRed:135/255.0 green:145/255.0 blue:155/255.0 alpha:1.0]}];
    
    txtAcNo.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"eg: xxxxxxxxxxxx" attributes:@{NSForegroundColorAttributeName: [UIColor colorWithRed:135/255.0 green:145/255.0 blue:155/255.0 alpha:1.0]}];
    
    UIView *vw = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 44)];
    
    txtAcHolder.leftView = vw;
    
    vw = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 44)];
    txtInstitution.leftView = vw;
    
    vw = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 44)];
    txtTransit.leftView = vw;
    
    vw = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 44)];
    txtAcNo.leftView = vw;
    
    txtAcHolder.leftViewMode = txtInstitution.leftViewMode = txtTransit.leftViewMode =txtAcNo.leftViewMode = UITextFieldViewModeAlways;
    
    [tpScrlView setContentSize:CGSizeMake(WIDTH, btnDone.frame.origin.y+44+30)];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

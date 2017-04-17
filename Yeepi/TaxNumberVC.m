//
//  TaxNumberVC.m
//  Yeepi
//
//  Created by Apple on 22/03/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "TaxNumberVC.h"

@interface TaxNumberVC ()

@end

@implementation TaxNumberVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GET_HEADER_VIEW
    header.lblTitle.text = @"TAX NUMBER";
    STATUS_BAR
    
    txtGSTTax.layer.borderWidth = txtPSTTax.layer.borderWidth = 1;
    
    txtGSTTax.layer.borderColor = txtPSTTax.layer.borderColor = [[UIColor colorWithRed:53/255.0 green:62/255.0 blue:91/255.0 alpha:1.0] CGColor];
    
    txtGSTTax.layer.cornerRadius = txtPSTTax.layer.cornerRadius = 10;
    btnDone.layer.cornerRadius = 22;
    
    txtGSTTax.layer.masksToBounds = txtPSTTax.layer.masksToBounds = btnDone.layer.masksToBounds = YES;
    
    txtGSTTax.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"eg:Enter GST Tax Number" attributes:@{NSForegroundColorAttributeName: [UIColor colorWithRed:135/255.0 green:145/255.0 blue:155/255.0 alpha:1.0]}];
    
    txtPSTTax.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"eg:Enter PST Tax Number" attributes:@{NSForegroundColorAttributeName: [UIColor colorWithRed:135/255.0 green:145/255.0 blue:155/255.0 alpha:1.0]}];
    
    UIView *vw = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 44)];
    
    txtGSTTax.leftView = vw;
    
    vw = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 44)];
    
    txtPSTTax.leftView = vw;
    
    txtGSTTax.leftViewMode = txtPSTTax.leftViewMode = UITextFieldViewModeAlways;
    
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

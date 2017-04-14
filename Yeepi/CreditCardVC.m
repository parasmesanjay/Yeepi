//
//  CreditCardVC.m
//  Yeepi
//
//  Created by Ashish Kumar Sharma on 10/04/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "CreditCardVC.h"

@interface CreditCardVC ()

@end

@implementation CreditCardVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    GET_HEADER_VIEW
    header.lblTitle.text = @"PAYMENT METHOD";
    STATUS_BAR
    
    txtHolderName.layer.cornerRadius = txtCardNo.layer.cornerRadius = txtExpireMonth.layer.cornerRadius = txtExpireYear.layer.cornerRadius = txtCCV.layer.cornerRadius = 10;
    btnDone.layer.cornerRadius = 22;
    
    txtHolderName.layer.masksToBounds = txtCardNo.layer.masksToBounds = txtExpireMonth.layer.masksToBounds = txtExpireYear.layer.masksToBounds = txtCCV.layer.masksToBounds = btnDone.layer.masksToBounds = YES;
    
    txtHolderName.layer.borderWidth = txtCardNo.layer.borderWidth = txtExpireMonth.layer.borderWidth = txtExpireYear.layer.borderWidth = txtCCV.layer.borderWidth = 1;
    
    txtHolderName.layer.borderColor = txtCardNo.layer.borderColor = txtExpireMonth.layer.borderColor = txtExpireYear.layer.borderColor = txtCCV.layer.borderColor = [[UIColor colorWithRed:53/255.0 green:62/255.0 blue:91/255.0 alpha:1.0] CGColor];
    
    txtHolderName.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"eg: Jason Range" attributes:@{NSForegroundColorAttributeName: [UIColor colorWithRed:135/255.0 green:145/255.0 blue:155/255.0 alpha:1.0]}];
    
    txtCardNo.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"eg: xxxxxxxxxxxx" attributes:@{NSForegroundColorAttributeName: [UIColor colorWithRed:135/255.0 green:145/255.0 blue:155/255.0 alpha:1.0]}];
    
    txtCCV.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"CCV/CVV" attributes:@{NSForegroundColorAttributeName: [UIColor colorWithRed:135/255.0 green:145/255.0 blue:155/255.0 alpha:1.0]}];
    
    UIView *vw = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 44)];
    
    txtHolderName.leftView = vw;
    
    vw = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 44)];
    txtCardNo.leftView = vw;
    
    vw = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 44)];
    txtExpireMonth.leftView = vw;
    
    UIView *arrow = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 25, 44)];
    
    UIImageView *imgArrow = [[UIImageView alloc] initWithFrame:CGRectMake(0, 14, 20, 16)];
    imgArrow.image = [UIImage imageNamed:@"down_arrow.png"];
    
    [arrow addSubview:imgArrow];
    
    txtExpireMonth.rightView = arrow;
    
    vw = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 44)];
    txtExpireYear.leftView = vw;
    
    arrow = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 25, 44)];
    
    imgArrow = [[UIImageView alloc] initWithFrame:CGRectMake(0, 14, 20, 16)];
    imgArrow.image = [UIImage imageNamed:@"down_arrow.png"];
    
    [arrow addSubview:imgArrow];
    
    txtExpireYear.rightView = arrow;
    
    txtExpireMonth.rightViewMode = txtExpireYear.rightViewMode = UITextFieldViewModeAlways;
    
    txtHolderName.leftViewMode =txtCardNo.leftViewMode = txtExpireMonth.leftViewMode =txtExpireYear.leftViewMode = UITextFieldViewModeAlways;
    
    [tpScrlView setContentSize:CGSizeMake(WIDTH, btnDone.frame.origin.y+44+30)];
    
    [imgRadio setTintColor:WHITE_COLOR];
    imgRadio.image =  [imgRadio.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

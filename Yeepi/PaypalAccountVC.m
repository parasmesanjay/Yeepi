//
//  PaypalAccountVC.m
//  Yeepi
//
//  Created by Ashish Kumar Sharma on 10/04/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "PaypalAccountVC.h"

@interface PaypalAccountVC ()

@end

@implementation PaypalAccountVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    GET_HEADER_VIEW
    header.lblTitle.text = @"PAYMENT METHOD";
    STATUS_BAR
    
    txtEmail.layer.cornerRadius = txtEmail2.layer.cornerRadius = 10;
    btnDone.layer.cornerRadius = 22;
    
    txtEmail.layer.masksToBounds = txtEmail2.layer.masksToBounds = btnDone.layer.masksToBounds = YES;
    
    txtEmail.layer.borderWidth = txtEmail2.layer.borderWidth = 1;
    
    txtEmail.layer.borderColor = txtEmail2.layer.borderColor = [[UIColor colorWithRed:53/255.0 green:62/255.0 blue:91/255.0 alpha:1.0] CGColor];
    
    txtEmail.attributedPlaceholder = txtEmail2.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"eg: xyz@email.com" attributes:@{NSForegroundColorAttributeName: [UIColor colorWithRed:135/255.0 green:145/255.0 blue:155/255.0 alpha:1.0]}];
    
    UIView *vw = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 44)];
    
    txtEmail.leftView = vw;
    
    vw = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 44)];
    txtEmail2.leftView = vw;
    
    txtEmail.leftViewMode = txtEmail2.leftViewMode = UITextFieldViewModeAlways;
    
    [tpScrlView setContentSize:CGSizeMake(WIDTH, btnDone.frame.origin.y+44+30)];
    
    [imgRadio setTintColor:WHITE_COLOR];
    imgRadio.image =  [imgRadio.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
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

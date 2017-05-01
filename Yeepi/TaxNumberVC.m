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

HIDE_KEY_ON_TOUCH

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

- (IBAction)btnDoneClk:(UIButton *)sender
{
    if (txtGSTTax.text.length < 1)
    {
        [WebServiceCalls alert:@"Enter GST Number."];
        [txtGSTTax becomeFirstResponder];
    }
    else if (txtPSTTax.text.length < 1)
    {
        [WebServiceCalls alert:@"Enter PST Number."];
        [txtPSTTax becomeFirstResponder];
    }
    else
    {
        SVHUD_START
        [self performSelector:@selector(TaxNumberUpdateHud) withObject:nil afterDelay:0];
    }
}

-(void) TaxNumberUpdateHud
{
    @try
    {
        // URL : http://appone.biz/yeepi/api/users/update-gst-pst-number.json
        
        NSDictionary *dic = @{@"user_id":User_Id,
                              @"gst_number":txtGSTTax.text,
                              @"pst_number":txtPSTTax.text};
        
        [WebServiceCalls POST:@"users/update-gst-pst-number.json" parameter:dic completionBlock:^(id JSON, WebServiceResult result)
         {
             SVHUD_STOP
             @try
             {
                 NSLog(@"%@", JSON);
                 NSDictionary *dict = JSON[@"response"];
                 
                 if ([dict[@"status"] integerValue] == 1)
                 {
                     [WebServiceCalls alert:@"GST and PST Numbers updated successfully."];
                     
                     NSDictionary *dic = [[NSDictionary alloc] initWithDictionary:dict[@"data"]];
                     NSData *myData = [NSKeyedArchiver archivedDataWithRootObject:dic];
                     
                     [[NSUserDefaults standardUserDefaults] setObject:myData forKey:@"userDetails"];
                 }
                 else
                 {
                     [WebServiceCalls alert:[NSString stringWithFormat:@"%@", dict[@"msg"]]];
                 }
             }
             @catch (NSException *exception)
             {
                 [WebServiceCalls alert:@"Some problem in Updating.\nPlease try again."];
             }
             @finally
             {
             }
         }];
    }
    @catch (NSException *exception)
    {
        [WebServiceCalls alert:@"Some problem in SignUp.\nPlease try again."];
    }
    @finally
    {
    }
}


@end

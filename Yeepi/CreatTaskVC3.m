//
//  CreatTaskVC3.m
//  Yeepi
//
//  Created by Ashish sharma on 15/05/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "CreatTaskVC3.h"

@interface CreatTaskVC3 ()

@end

@implementation CreatTaskVC3
{
    NSString *PaymentType, *EstimateBudget;
}

@synthesize dict;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    GET_HEADER_VIEW
    header.lblTitle.text = [AppDelegate AppDelegate].TaskTitle;
    STATUS_BAR
    
    viewSuccess.frame = CGRectMake(0, HEIGHT, WIDTH, HEIGHT);
    
    for (int i=1; i<=3; i++)
    {
        UILabel *lbl = [self.view viewWithTag:100+i];
        
        lbl.layer.cornerRadius = 25;
        lbl.layer.masksToBounds = YES;
    }
    
    viewPostTask.layer.cornerRadius = 22;
    viewPostTask.layer.masksToBounds = YES;
    
    [self setTintColor:imgTotalBudget :WHITE_COLOR];
    [self setTintColor:imgHourlyBudget :WHITE_COLOR];
    
    [self setPlaceHolderColor:txtPrice];
    [self setPlaceHolderColor:txtHours];
    [self setPlaceHolderColor:txtPricePreHour];
    
    viewHourly.hidden = YES;
}

-(void) setTintColor:(UIImageView *)ImageView :(UIColor *)imgColor
{
    [ImageView setTintColor:imgColor];
    ImageView.image =  [ImageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}

-(void) setPlaceHolderColor:(UITextField *)txtField
{
    txtField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    txtField.layer.borderWidth = 0.8;
    txtField.layer.cornerRadius = 10;
    [txtField setValue:[UIColor lightTextColor] forKeyPath:@"_placeholderLabel.textColor"];
    txtField.borderStyle = UITextBorderStyleRoundedRect;
    txtField.backgroundColor = CLEAR_COLOR;
}

- (IBAction)btnRadioClk:(UIButton *)sender
{
    txtPrice.text = txtHours.text = txtPricePreHour.text = nil;
    lblEstimateBudget.text = @"$0";
    if (sender.tag == 0)
    {
        imgTotalBudget.image = [UIImage imageNamed:@"radio.png"];
        imgHourlyBudget.image = [UIImage imageNamed:@"radio_unckeck.png"];
        
        PaymentType = @"0";
        
        [self setTintColor:imgTotalBudget :WHITE_COLOR];
        [self setTintColor:imgHourlyBudget :WHITE_COLOR];
        
        viewHourly.hidden = YES;
        txtPrice.hidden = NO;
    }
    else
    {
        imgHourlyBudget.image = [UIImage imageNamed:@"radio.png"];
        imgTotalBudget.image = [UIImage imageNamed:@"radio_unckeck.png"];
        
        PaymentType = @"1";
        
        [self setTintColor:imgTotalBudget :WHITE_COLOR];
        [self setTintColor:imgHourlyBudget :WHITE_COLOR];
        
        viewHourly.hidden = NO;
        txtPrice.hidden = YES;
    }
}

- (IBAction)TaskerCount:(UIButton *)sender
{
    if (sender.tag == 0)
    {
        NSString *value = txtTaskerCount.text;
        
        NSInteger count = [value integerValue];
        
        if (count != 1)
        {
            count--;
            
            txtTaskerCount.text = [NSString stringWithFormat:@"%ld",count];
            
            [self txtValueChange:nil];
        }
    }
    else
    {
        NSString *value = txtTaskerCount.text;
        
        NSInteger count = [value integerValue];
        
        if (count != 5)
        {
            count++;
            
            txtTaskerCount.text = [NSString stringWithFormat:@"%ld",count];
            
            [self txtValueChange:nil];
        }
    }
}

- (IBAction)txtValueChange:(UITextField *)sender
{
    if (sender.text.length == 1)
    {
        if ([sender.text integerValue] == 0)
        {
            sender.text = nil;
            [WebServiceCalls alert:@"Can not start with a zero."];
            
            return;
        }
    }
    
    if ([PaymentType integerValue] == 0)
    {
        if (txtPrice.text.length>0)
        {
            lblEstimateBudget.text = [NSString stringWithFormat:@"$%@",txtPrice.text];
        }
    }
    else
    {
        if (txtHours.text.length>0 && txtPricePreHour.text.length>0)
        {
            NSInteger total = [txtHours.text integerValue] * [txtPricePreHour.text integerValue] * [txtTaskerCount.text integerValue];
            
            EstimateBudget = [NSString stringWithFormat:@"%ld", total];
            
            lblEstimateBudget.text = [NSString stringWithFormat:@"$%ld",total];
        }
    }
}

- (IBAction)btnPostTaskClk:(id)sender
{
    if ([PaymentType integerValue] == 0)
    {
        if (txtPrice.text.length < 1)
        {
            [WebServiceCalls alert:@"Enter Price."];
            [txtPrice becomeFirstResponder];
        }
        else
        {
            [dict setObject:txtTaskerCount.text forKey:@"no_tasker"];
            [dict setObject:txtPrice.text forKey:@"budget_range"];
            [dict setObject:txtPrice.text forKey:@"estimate_budget"];

            [self PostTaskHud];
        }
    }
    else
    {
        if (txtHours.text.length < 1)
        {
            [WebServiceCalls alert:@"Enter Hours"];
            [txtHours becomeFirstResponder];
        }
        else if (txtPricePreHour.text.length < 1)
        {
            [WebServiceCalls alert:@"Enter Price per Hour."];
            [txtPricePreHour becomeFirstResponder];
        }
        else
        {
            [dict setObject:txtTaskerCount.text forKey:@"no_tasker"];
            [dict setObject:txtHours.text forKey:@"budget_hours"];
            [dict setObject:txtPricePreHour.text forKey:@"hour_price"];
            [dict setObject:EstimateBudget forKey:@"estimate_budget"];

            
            [self PostTaskHud];
        }
    }
}
             
-(void) PostTaskHud
{
    @try
    {
        // URL : http://appone.biz/yeepi/api/tasks/add.json
        
        SVHUD_START
        [WebServiceCalls POST:@"tasks/add.json" parameter:dict completionBlock:^(id JSON, WebServiceResult result)
         {
             SVHUD_STOP
             NSLog(@"%@", JSON);
             NSDictionary *dic = JSON[@"response"];
             @try
             {
                 if ([dic[@"status"] integerValue] == 1)
                 {
                     //[WebServiceCalls alert:[NSString stringWithFormat:@"%@", dict[@"msg"]]];
                     
                     viewSuccess.frame = CGRectMake(0, 0, WIDTH, self.view.frame.size.height);
                     
                     [AppDelegate AppDelegate].TaskTitle = @"";
                 }
                 else
                 {
                     [WebServiceCalls alert:[NSString stringWithFormat:@"%@", dic[@"msg"]]];
                 }
             }
             @catch (NSException *exception)
             {
                 [WebServiceCalls alert:@"Some problem in SignIn.\nPlease try again."];
             }
             @finally
             {
             }
         }];
    }
    @catch (NSException *exception) {
        
    } @finally {
        
    }
}

- (IBAction)btnGoToMyTaskClk:(id)sender
{
    NSArray *nav_array = [self.navigationController viewControllers];
    for (UITabBarController *controller in nav_array)
    {
        if ([controller isKindOfClass:[TabBarController class]])
        {
            //Do not forget to import AnOldViewController.h
            [self.navigationController popToViewController:controller animated:YES];
            [controller setSelectedIndex:0];
            
            return;
        }
    }
}

- (IBAction)btnCloseClk:(id)sender
{
    NSArray *nav_array = [self.navigationController viewControllers];
    for (UITabBarController *controller in nav_array)
    {
        if ([controller isKindOfClass:[TabBarController class]])
        {
            //Do not forget to import AnOldViewController.h
            [self.navigationController popToViewController:controller animated:YES];
            [controller setSelectedIndex:2];
            
            return;
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

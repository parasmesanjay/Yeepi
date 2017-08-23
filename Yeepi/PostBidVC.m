//
//  PostBidVC.m
//  Yeepi
//
//  Created by Ashish sharma on 05/04/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "PostBidVC.h"

@interface PostBidVC ()
{
    UILabel *lblPH;
    
    BOOL isModify;
    
    UIView *thnksview;
    
    NSString *offerId;
}
@end

@implementation PostBidVC

@synthesize info, isFromMyOffer;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    isModify = false;
    
    GET_HEADER_VIEW
    header.lblTitle.text = @"Make Your Offer";
    STATUS_BAR
    self.view.backgroundColor = APP_COLOR_BLUE;
  
    btnGoMyTask.layer.cornerRadius = btnGoMyTask.frame.size.height/2;
    btnMakeOffer.layer.cornerRadius = btnMakeOffer.frame.size.height/2;
    viewDeleteOffer.layer.cornerRadius = viewDeleteOffer.frame.size.height/2;
    viewDeleteOffer.layer.borderColor = WHITE_COLOR.CGColor;
    viewDeleteOffer.layer.borderWidth = 1;

    textAmt.layer.cornerRadius = Corner_Radius;
    textAmt.layer.borderColor = Border_color_brown.CGColor;
    textAmt.layer.borderWidth = 1;
    // textAmt.borderStyle = UIButtonTypeRoundedRect;
    [textAmt setValue:[UIColor lightGrayColor] forKeyPath:@"_placeholderLabel.textColor"];
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 7, 20)];
    textAmt.leftView = paddingView;
    textAmt.leftViewMode = UITextFieldViewModeAlways;

    viewComment.layer.cornerRadius = Corner_Radius;
    viewComment.layer.borderColor = Border_color_brown.CGColor;
    viewComment.layer.borderWidth = 1;
    
    lblPH = [[UILabel alloc]initWithFrame:CGRectMake(9, 6, 100, 20)];
    lblPH.text = @"Comment";
    lblPH.textColor = [UIColor lightGrayColor];
    [viewComment addSubview:lblPH];
    lblPH.font = [UIFont systemFontOfSize:14];
    
    id check;
    
    if (isFromMyOffer)
    {
        check = info;
    }
    else
    {
        check = info[@"self_offer"];
    }
    
    if([check isKindOfClass:[NSDictionary class]])
    {
        isModify = true;
        
        header.lblTitle.text = @"Modify Offer";
        
        lblPH.hidden = YES;
        
        if (isFromMyOffer)
        {
            offerId = info[@"id"];
            
            textAmt.text = [NSString stringWithFormat:@"%@",info[@"offer_amount"]];
            textComment.text = [NSString stringWithFormat:@"%@",info[@"offer_comment"]];
        }
        else
        {
            offerId = info[@"self_offer"][@"offer_id"];

            textAmt.text = [NSString stringWithFormat:@"%@",info[@"self_offer"][@"offer_amount"]];
            textComment.text = [NSString stringWithFormat:@"%@",info[@"self_offer"][@"offer_comment"]];
        }
        
        [btnMakeOffer setTitle:@"Update my Offer" forState:UIControlStateNormal];
    }
    
    lblTaskName.text = [NSString stringWithFormat:@"%@",info[@"title"]];
    lblTaskPrice.text = [NSString stringWithFormat:@"$%@",info[@"estimate_budget"]];
    txtviewAddress.text = [NSString stringWithFormat:@"%@",info[@"location_name"]];
    
    thnksview = [[UIView alloc] initWithFrame:CGRectMake(0, HEIGHT, WIDTH, HEIGHT)];
    thnksview.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
    
    viewThankYou.center = self.view.center;
    
    [thnksview addSubview:viewThankYou];
    [self.view addSubview:thnksview];
    
    [viewScroll setContentSize:CGSizeMake(WIDTH, viewDeleteOffer.frame.origin.y+50)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)tapMakeOffer:(id)sender
{
    if (textAmt.text.length < 1)
    {
        [WebServiceCalls alert:@"Enter Amount First."];
        [textAmt becomeFirstResponder];
    }
    else if (textComment.text.length < 1)
    {
        [WebServiceCalls alert:@"Enter Comment First."];
        [textComment becomeFirstResponder];
    }
    else
    {
        SVHUD_START
        [self performSelector:@selector(MakeOfferHud) withObject:nil afterDelay:0];
    }
}

-(void) MakeOfferHud
{
    @try
    {
        // URL : http://appone.biz/yeepi/api/task-offers/add.json
        // modify URL : http://appone.biz/yeepi/api/task-offers/update.json
        
        NSDictionary *dic;
        NSString *url;
        
        if (isModify)
        {
            dic = @{@"id":offerId,
                    @"offer_amount":textAmt.text,
                    @"offer_comment":textComment.text};
            url = @"task-offers/update.json";
        }
        else
        {
            dic = @{@"user_id":User_Id,
                    @"task_id":info[@"id"],
                    @"offer_amount":textAmt.text,
                    @"offer_comment":textComment.text};
            url = @"task-offers/add.json";
        }
        
        [WebServiceCalls POST:url parameter:dic completionBlock:^(id JSON, WebServiceResult result)
         {
             SVHUD_STOP
             NSLog(@"%@", JSON);
             @try
             {
                 NSDictionary *dict = JSON[@"response"];

                 if ([dict[@"status"] integerValue] == 1)
                 {
                     //[WebServiceCalls alert:[NSString stringWithFormat:@"%@", dict[@"msg"]]];
                     
                     if (isModify)
                     {
                         lblThanksMsg.text = @"You have changed your bid amount successfully. Stay tuned !";
                     }
                     else
                     {
                         lblThanksMsg.text = @"You have successfully made an offer to this task. Stay tuned !";
                     }
                     thnksview.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
                 }
                 else
                 {
                     [WebServiceCalls alert:[NSString stringWithFormat:@"%@", dict[@"msg"]]];
                 }
             }
             @catch (NSException *exception)
             {
                 [WebServiceCalls alert:@"Some problem.\nPlease try again."];
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

#pragma text view Delegate

- (void)textViewDidEndEditing:(UITextView *)theTextView
{
    if (![theTextView hasText])
    {
        lblPH.hidden = NO;
    }
}

- (void) textViewDidChange:(UITextView *)textView
{
    if(![textView hasText])
    {
        lblPH.hidden = NO;
    }
    else{
        lblPH.hidden = YES;
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
    [AppDelegate AppDelegate].isMadeBid = true;
    POP_BACK
}

@end

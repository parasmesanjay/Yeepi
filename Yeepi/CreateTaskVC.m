//
//  CreateTaskVC.m
//  Yeepi
//
//  Created by Apple on 17/03/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "CreateTaskVC.h"

@interface CreateTaskVC ()
{
    UILabel *lblPlaceHolder;
}
@end

@implementation CreateTaskVC

@synthesize isFromClean, dict;

- (void)viewDidLoad {
    [super viewDidLoad];

    GET_HEADER_VIEW
    header.lblTitle.text = [AppDelegate AppDelegate].TaskTitle;
    STATUS_BAR
    self.view.backgroundColor = APP_COLOR_BLUE;
    
    for (int i=1; i<=3; i++)
    {
        UILabel *lbl = [self.view viewWithTag:100+i];
        
        lbl.layer.cornerRadius = 25;
        lbl.layer.masksToBounds = YES;
        
        if (i != 1)
        {
            lbl.layer.borderWidth = 2;
            lbl.layer.borderColor = [WHITE_COLOR CGColor];
        }
    }
    
    textTitle.layer.borderColor = [UIColor lightGrayColor].CGColor;
    textTitle.layer.borderWidth = 0.8;
    textTitle.layer.cornerRadius = 10;
    [textTitle setValue:[UIColor lightTextColor] forKeyPath:@"_placeholderLabel.textColor"];
    textTitle.borderStyle = UITextBorderStyleRoundedRect;
    textTitle.backgroundColor = CLEAR_COLOR;
    
    textDescriptoin.layer.borderColor = [UIColor lightGrayColor].CGColor;
    textDescriptoin.layer.borderWidth = 0.8;
    textDescriptoin.layer.cornerRadius = 10;
    
    
    lblPlaceHolder = [[UILabel alloc] initWithFrame:CGRectMake(5, 0.0,textDescriptoin.frame.size.width - 10.0, 34.0)];
    [lblPlaceHolder setText:@"eg: I am looking for some extraordinary..."];
    [lblPlaceHolder setBackgroundColor:[UIColor clearColor]];
    [lblPlaceHolder setTextColor:[UIColor lightGrayColor]];
    lblPlaceHolder.font = [UIFont systemFontOfSize:14];
    textDescriptoin.delegate = self;
    [textDescriptoin addSubview:lblPlaceHolder];
    
    btnNext.layer.cornerRadius = 22;
    btnNext.layer.masksToBounds = YES;

    [viewTPScroll setContentSize:CGSizeMake(WIDTH, 667)];//btnNext.frame.origin.y+44+64+120+40)];
}


- (void)textViewDidEndEditing:(UITextView *)theTextView
{
    if (![textDescriptoin hasText]) {
        lblPlaceHolder.hidden = NO;
    }
}

- (void) textViewDidChange:(UITextView *)textView
{
    if(![textDescriptoin hasText])
    {
        lblPlaceHolder.hidden = NO;
    }
    else
    {
        lblPlaceHolder.hidden = YES;
    }  
}


- (IBAction)btnNextClk:(id)sender
{
    if (textTitle.text.length < 10)
    {
        [WebServiceCalls alert:@"Title Should be atleast 10 character"];
        [textTitle becomeFirstResponder];
    }
    else if (textDescriptoin.text.length < 25)
    {
        [WebServiceCalls alert:@"Description Should be atleast 25 character"];
        [textDescriptoin becomeFirstResponder];
    }
    else
    {
        if (isFromClean)
        {
            [dict setObject:textTitle.text forKey:@"title"];
            [dict setObject:textDescriptoin.text forKey:@"description"];
        }
        else
        {
            NSDictionary *dic = @{@"user_id" : User_Id,
                                   @"title" : textTitle.text,
                                   @"description" : textDescriptoin.text,
                                   @"task_type" : @"1",
                                   @"location_name" : @"",
                                   @"location_latitude" : @"",
                                   @"location_longtitude" : @"",
                                   @"task_timeline" : @"",
                                   @"budget_range" : @"",
                                   @"total_hours" : @"",
                                   @"no_tasker" : @"",
                                   @"budget_hours" : @"",
                                   @"hour_price" : @"",
                                   @"device_token" : @"token",
                                   @"device_type" : @"I",
                                   @"service_type_id" : _serviceID,
                                   @"estimate_budget" : @""};
            
            dict = [NSMutableDictionary dictionaryWithDictionary:dic];
        }
        
        UIStoryboard *storybord = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        CreateTaskVC2 *obj = [storybord instantiateViewControllerWithIdentifier:@"CreateTaskVC2"];
        obj.dict = [NSMutableDictionary dictionaryWithDictionary:dict];
        [self.navigationController pushViewController:obj animated:YES];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
@end

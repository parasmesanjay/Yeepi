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
}
@end

@implementation PostBidVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GET_HEADER_VIEW
    header.lblTitle.text = @"Make Your Offer";
    STATUS_BAR
    self.view.backgroundColor = APP_COLOR_BLUE;
  
    btnGoMyTask.layer.cornerRadius = btnGoMyTask.frame.size.height/2;
    btnMakeOffer.layer.cornerRadius = btnMakeOffer.frame.size.height/2;
    btnDeletOffer.layer.cornerRadius = btnDeletOffer.frame.size.height/2;
    btnDeletOffer.layer.borderColor = WHITE_COLOR.CGColor;
    btnDeletOffer.layer.borderWidth = 1;

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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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

@end

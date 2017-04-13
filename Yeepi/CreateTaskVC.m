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

- (void)viewDidLoad {
    [super viewDidLoad];

    GET_HEADER_VIEW
    header.lblTitle.text = @"Post Task";
    STATUS_BAR
    self.view.backgroundColor = APP_COLOR_BLUE;


    NSArray *arr = @[one,two,three];
    for (UILabel *lbl in arr) {
        
        lbl.layer.borderColor = WHITE_COLOR.CGColor;
        lbl.layer.borderWidth = 1;
        lbl.layer.cornerRadius = 25;
        lbl.clipsToBounds = YES;
    }
    one.backgroundColor = APP_COLOR_RED;
    
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
    [lblPlaceHolder setText:@"Enter Description"];
    [lblPlaceHolder setBackgroundColor:[UIColor clearColor]];
    [lblPlaceHolder setTextColor:[UIColor lightGrayColor]];
    lblPlaceHolder.font = [UIFont systemFontOfSize:14];
    textDescriptoin.delegate = self;
    [textDescriptoin addSubview:lblPlaceHolder];
    
    btnNext.layer.cornerRadius = 22;
    btnNext.clipsToBounds = YES;

}


- (void)textViewDidEndEditing:(UITextView *)theTextView
{
    if (![textDescriptoin hasText]) {
        lblPlaceHolder.hidden = NO;
    }
}

- (void) textViewDidChange:(UITextView *)textView
{
    if(![textDescriptoin hasText]) {
        lblPlaceHolder.hidden = NO;
    }
    else{
        lblPlaceHolder.hidden = YES;
    }  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
@end

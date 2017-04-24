//
//  VarifyPopUp.m
//  Yeepi
//
//  Created by Ashish Kumar Sharma on 19/04/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "VarifyPopUp.h"

@implementation VarifyPopUp
{
    NSArray *arrImg, *arrTitle, *arrMsz;
}

@synthesize flag, btnSubmit;

- (void)drawRect:(CGRect)rect
{
    arrImg = @[@"green_message.png", @"green_mobile.png"];
    
    arrTitle = @[@"Confirm your Email", @"Confirm your Mobile"];
    
    arrMsz = @[@"We have sent the 4-digit secret code to your email. Enter it below.", @"We have sent the 4-digit secret code to your phone. Enter it below."];
    
    imgIcon.image = [UIImage imageNamed:arrImg[flag]];
    imgIcon.contentMode = UIViewContentModeScaleAspectFit;
    
    lblTitle.text = arrTitle[flag];
    
    lblMsz.text = arrMsz[flag];
    
    btnSubmit.layer.cornerRadius = 22;
    btnSubmit.layer.masksToBounds = YES;
}

- (IBAction)btnCloseClk:(id)sender
{
    [self removeFromSuperview];
}

- (IBAction)btnSubmitClk:(id)sender
{
}

@end

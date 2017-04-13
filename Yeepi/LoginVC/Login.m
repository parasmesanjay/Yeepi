//
//  Login.m
//  Yeepi
//
//  Created by Apple on 06/03/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "Login.h"

@interface Login ()

@end

@implementation Login

- (void)viewDidLoad
{
    [super viewDidLoad];

    HIDE_NAV_BAR
    GET_HEADER_VIEW_NO_BACK
    header.lblTitle.text = @"Login to Yeepi";
    STATUS_BAR
    
    self.view.backgroundColor = APP_COLOR_BLUE;
    
    btnTerms.titleLabel.numberOfLines = 0;

    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:@"By singing up you are agree to Terms and conditions"];
    if (is_iPhone_5)
    {
        attributeString = [[NSMutableAttributedString alloc] initWithString:@"By singing up you are agree to Terms and conditions"];
    }
    
    [attributeString addAttribute:NSUnderlineStyleAttributeName
                            value:[NSNumber numberWithInt:1]
                            range:(NSRange){attributeString.length-20,20}];
    
    btnTerms.titleLabel.attributedText = attributeString;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

HIDE_KEY_ON_TOUCH

@end

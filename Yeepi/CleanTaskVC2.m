//
//  CleanTaskVC2.m
//  Yeepi
//
//  Created by Ashish sharma on 15/05/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "CleanTaskVC2.h"

@interface CleanTaskVC2 ()

@end

@implementation CleanTaskVC2

- (void)viewDidLoad
{
    [super viewDidLoad];
    
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
    
    btnNext.layer.cornerRadius = 22;
    btnNext.layer.masksToBounds = YES;
}

- (IBAction)btnNextClk:(id)sender
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

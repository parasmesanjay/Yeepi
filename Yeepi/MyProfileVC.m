//
//  MyProfileVC.m
//  Yeepi
//
//  Created by Ashish Kumar Sharma on 10/04/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "MyProfileVC.h"

@interface MyProfileVC ()

@end

@implementation MyProfileVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GET_HEADER_VIEW
    header.lblTitle.text = @"MY PROFILE";
    STATUS_BAR

    [mainScroll setContentSize:CGSizeMake(WIDTH, 1000)];
    
    mySegment.backgroundColor = CLEAR_COLOR;
    mySegment.segmentFirstName = @"Tasker";
    mySegment.segmentSecondName = @"Task Holder";
    
    mySegment.delegate = self;
    
    btnAddSkill.layer.cornerRadius = 17.5;
    btnAddTranp.layer.cornerRadius = 17.5;
    btnProceedFill.layer.cornerRadius = 17.5;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)DidTapButton:(NSInteger)tag
{
   
}

@end

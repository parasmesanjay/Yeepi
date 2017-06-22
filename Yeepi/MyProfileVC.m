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
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(WIDTH-44-15, 20, 44, 44)];
    
    [btn setBackgroundImage:[UIImage imageNamed:@"ic_edit.png"] forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(btnEditClk:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];

    [mainScroll setContentSize:CGSizeMake(WIDTH, 1000)];
    
    mySegment.backgroundColor = CLEAR_COLOR;
    mySegment.segmentFirstName = @"Tasker";
    mySegment.segmentSecondName = @"Task Holder";
    
    mySegment.delegate = self;
    
    btnAddSkill.layer.cornerRadius = 17.5;
    btnAddTranp.layer.cornerRadius = 17.5;
    btnProceedFill.layer.cornerRadius = 17.5;
    
}

- (IBAction)btnEditClk:(UIButton *)sender
{
    UIStoryboard *storybord = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    EditProfileVC *obj = [storybord instantiateViewControllerWithIdentifier:@"EditProfileVC"];
    [self.navigationController pushViewController:obj animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)DidTapButton:(NSInteger)tag
{
   
}

@end

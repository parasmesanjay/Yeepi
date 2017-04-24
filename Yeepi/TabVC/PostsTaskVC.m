//
//  PostsTaskVC.m
//  Yeepi
//
//  Created by Apple on 15/03/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "PostsTaskVC.h"

@interface PostsTaskVC ()
{
    NSArray *arrImage,*arrTitles;
    
}
@end

@implementation PostsTaskVC

- (void)viewDidLoad
{
    [super viewDidLoad];
        
    [AppDelegate AppDelegate].navigationController.navigationBarHidden = YES;
    
    GET_HEADER_VIEW_NO_BACK
    header.lblTitle.text = @"My tasks";
    STATUS_BAR
    self.view.backgroundColor = APP_COLOR_BLUE;
    
    
    arrImage = @[@"home",@"services",@"user",@"truck",@"gardening",@"remove",@"photo",@"decoration",@"other"];
    arrTitles = @[@"Cleaning",@"Assembly",@"Handyman",@"Delivery",@"Gardening",@"Removalist",@"Photograpy",@"Decoration",@"Other services"];
    
    for (int i=0;i<arrImage.count;i++)
    {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH/24+i%3*(WIDTH/4+WIDTH/12), 60+i/3*(44+WIDTH/4-20), WIDTH/4, WIDTH/4-20)];
        [mainScroll addSubview:imageView];
        imageView.image = [UIImage imageNamed:arrImage[i]];
        
        UILabel *lbl = [[UILabel alloc]initWithFrame:CGRectMake(i%3*(WIDTH/3), 60+i/3*(44+WIDTH/4-20)+WIDTH/4-20, WIDTH/3, 44)];
        lbl.textColor = WHITE_COLOR;
        lbl.text = arrTitles[i];
        [mainScroll addSubview:lbl];
        lbl.textAlignment = NSTextAlignmentCenter;
        lbl.font = [UIFont systemFontOfSize:13];
        
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(i%3*(WIDTH/3), 60+i/3*(44+WIDTH/4-20), WIDTH/3, WIDTH/4-20+44)];
        [btn addTarget:self action:@selector(tapButton) forControlEvents:UIControlEventTouchUpInside];
        [mainScroll addSubview:btn];
    }
}

-(void)tapButton
{
    [self performSegueWithIdentifier:@"goAddTask" sender:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end

//
//  TaskPostedVC.m
//  Yeepi
//
//  Created by Ashish Kumar Sharma on 07/04/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "TaskPostedVC.h"

@interface TaskPostedVC ()

@end

@implementation TaskPostedVC
{
    NSInteger index;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    index = 4;
    
    GET_HEADER_VIEW
    header.lblTitle.text = @"Task Posted";
    STATUS_BAR
    self.view.backgroundColor = APP_COLOR_BLUE;
    
    [self loadHomeScroll];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)loadHomeScroll
{
    @try
    {
        for (int i = 0; i < 2; i++)
        {
            CGFloat xOrigin = i * mainScroll.frame.size.width;
            UIView *TaskView = [[UIView alloc] initWithFrame:CGRectMake(xOrigin, 0, mainScroll.frame.size.width, mainScroll.frame.size.height)];
            
            if (i == 0)
            {
                ActiveTaskView *ATView = [[[NSBundle mainBundle] loadNibNamed:@"Active_PreviousTaskView" owner:self options:nil] objectAtIndex:0];
                ATView.frame = CGRectMake(0, 0, TaskView.frame.size.width, TaskView.frame.size.height);
                ATView.selfBack = self;
                //SView.backgroundColor = CLEAR_COLOR;
                [TaskView addSubview:ATView];
            }
            else
            {
                PreviousTaskView *PTView;
                PTView = [[[NSBundle mainBundle] loadNibNamed:@"Active_PreviousTaskView" owner:self options:nil] objectAtIndex:1];
                PTView.frame = CGRectMake(0, 0, TaskView.frame.size.width, TaskView.frame.size.height);
                PTView.selfBack = self;
                //HView.backgroundColor = CLEAR_COLOR;
                [TaskView addSubview:PTView];
            }
            
            [mainScroll addSubview:TaskView];
            
        }
        
        
        [mainScroll setContentSize:CGSizeMake(mainScroll.frame.size.width * 2, mainScroll.frame.size.height-100)];
        
    } @catch (NSException *exception) {
        
    } @finally {}
    
    mainScroll.bounces = NO;
    mainScroll.pagingEnabled = YES;
    mainScroll.contentOffset = CGPointMake(0, 0);
    // scroll_screen.contentOffset = CGPointMake(WIDTH, 0);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    lblScrl.frame = CGRectMake(scrollView.contentOffset.x/2, lblScrl.frame.origin.y, lblScrl.frame.size.width,2);
}

- (IBAction)btnScrollClk:(UIButton *)sender
{
    [UIView animateWithDuration:0.2 animations:^
     {
         mainScroll.contentOffset = CGPointMake(WIDTH * sender.tag, 0);
     }];
}

@end

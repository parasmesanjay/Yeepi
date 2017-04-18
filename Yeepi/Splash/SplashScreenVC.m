//
//  SplashScreenVC.m
//  Yeepi
//
//  Created by Apple on 06/03/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "SplashScreenVC.h"

@implementation SplashScreenVC
{
    int temp;
}
- (void)viewDidLoad
{
    [super viewDidLoad];

    temp = 0;
    [self performSelector:@selector(rotate) withObject:nil afterDelay:0];
    
    viewCon.hidden = YES;
    scroll.hidden = YES;
    
}

-(void)rotate
{
    [WebServiceCalls runSpinAnimationOnView:imgRolling duration:1 rotations:1 repeat:0];
    
    if (temp<3)
    {
        [self performSelector:@selector(rotate) withObject:nil afterDelay:1.5];
        temp ++;
    }
    else
    {
        
        viewCon.hidden = NO;
        scroll.hidden = NO;
        
        scroll.delegate = self;
        [scroll setContentSize:CGSizeMake(WIDTH*3, scroll.frame.size.height)];
        scroll.pagingEnabled = YES;
        scroll.showsHorizontalScrollIndicator = NO;
        
        NSArray *arrayImgNames = @[@"screen_one",@"screen_two",@"screen_three"];
        NSArray *arrayTitles = @[@"OUTSOURCE TASK FOR FREE",@"RECEIVE OFFERS WITHINS MINUT",@"GET YOUR WORK DONE EASILY"];
        NSArray *arraySUBTitles = @[@"Description for first app intro slide",@"Description for second app intro slide",@"Description into third app into slide, the original will set here later"];

        float imgHt = WIDTH/3+WIDTH/6;
        for (int i = 0;i<arrayTitles.count;i++)
        {
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH*i+WIDTH/2-imgHt/2,HEIGHT/2-imgHt/2-40,imgHt,imgHt)];
            imageView.image = [UIImage imageNamed:arrayImgNames[i]];
            imageView.contentMode = UIViewContentModeScaleAspectFit;
            [scroll addSubview:imageView];

            UILabel *boldTitle = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH*i+5, HEIGHT/2+imgHt/2-30, WIDTH-10,40)];
            boldTitle.text = arrayTitles[i];
            [scroll addSubview:boldTitle];
            boldTitle.font = [UIFont boldSystemFontOfSize:19];
            boldTitle.textColor = WHITE_COLOR;
            boldTitle.textAlignment = NSTextAlignmentCenter;
            
            UITextView *subTitle = [[UITextView alloc]initWithFrame:CGRectMake(WIDTH*i+40, HEIGHT/2+imgHt/2+10, WIDTH-80, 100)];
            subTitle.text = arraySUBTitles[i];
            [scroll addSubview:subTitle];
            subTitle.textColor = WHITE_COLOR;
            subTitle.userInteractionEnabled = NO;
            subTitle.backgroundColor = CLEAR_COLOR;
            subTitle.textAlignment = NSTextAlignmentCenter;
            subTitle.font = [UIFont systemFontOfSize:16];
        }
    }
}

- (IBAction)tapFire:(id)sender{

}

- (IBAction)tapSkip:(id)sender
{
    [[NSUserDefaults standardUserDefaults]setObject:@"1" forKey:@"AppFlag"];

    [self performSegueWithIdentifier:@"toLogin" sender:nil];// toLogin

}

- (IBAction)tapNext:(id)sender{
    
    // pageCon.currentPage = scroll.contentOffset.x/WIDTH;
    if (scroll.contentOffset.x < WIDTH*2)
    {
        [scroll setContentOffset:CGPointMake(scroll.contentOffset.x+WIDTH, 0) animated:YES];
    }
    else
    {
        [[NSUserDefaults standardUserDefaults]setObject:@"1" forKey:@"AppFlag"];

        [self performSegueWithIdentifier:@"toLogin" sender:nil];// toLogin
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    pageCon.currentPage = scroll.contentOffset.x/WIDTH;
    
    if (scroll.contentOffset.x >= WIDTH*2)
    {
        [btnNext setImage:[UIImage imageNamed:@"splash_ok"] forState:UIControlStateNormal];
    }
    else
    {
        [btnNext setImage:[UIImage imageNamed:@"splash_forword"] forState:UIControlStateNormal];

    }
}

@end

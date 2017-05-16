//
//  CleanTaskVC1.m
//  Yeepi
//
//  Created by Ashish sharma on 15/05/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "CleanTaskVC1.h"

@interface CleanTaskVC1 ()

@end

@implementation CleanTaskVC1

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
    
    [self setTintColor:imgRadioHouse :WHITE_COLOR];
    [self setTintColor:imgRadioApartment :WHITE_COLOR];
}

-(void) setTintColor:(UIImageView *)ImageView :(UIColor *)imgColor
{
    [ImageView setTintColor:imgColor];
    ImageView.image =  [ImageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}

- (IBAction)bedroomCount:(UIButton *)sender
{
    if (sender.tag == 0)
    {
        NSString *value = txtBedRoomCount.text;
        
        NSInteger count = [value integerValue];
        
        if (count != 0)
        {
            count--;
            
            txtBedRoomCount.text = [NSString stringWithFormat:@"%ld",count];
        }
    }
    else
    {
        NSString *value = txtBedRoomCount.text;
        
        NSInteger count = [value integerValue];
        
        if (count != 5)
        {
            count++;
            
            txtBedRoomCount.text = [NSString stringWithFormat:@"%ld",count];
        }
    }
}

- (IBAction)bathroomCount:(UIButton *)sender
{
    if (sender.tag == 0)
    {
        NSString *value = txtBathRoomCount.text;
        
        NSInteger count = [value integerValue];
        
        if (count != 0)
        {
            count--;
            
            txtBathRoomCount.text = [NSString stringWithFormat:@"%ld",count];
        }
    }
    else
    {
        NSString *value = txtBathRoomCount.text;
        
        NSInteger count = [value integerValue];
        
        if (count != 5)
        {
            count++;
            
            txtBathRoomCount.text = [NSString stringWithFormat:@"%ld",count];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

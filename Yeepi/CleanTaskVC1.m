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
{
    NSString *PropertyType;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    PropertyType = @"0";
    
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
    
    btnContinue.layer.cornerRadius = 22;
    btnContinue.layer.masksToBounds = YES;
    
    [self setTintColor:imgRadioHouse :WHITE_COLOR];
    [self setTintColor:imgRadioApartment :WHITE_COLOR];
}

-(void) setTintColor:(UIImageView *)ImageView :(UIColor *)imgColor
{
    [ImageView setTintColor:imgColor];
    ImageView.image =  [ImageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}

- (IBAction)btnRadioClk:(UIButton *)sender
{
    if (sender.tag == 0)
    {
        imgRadioHouse.image = [UIImage imageNamed:@"radio.png"];
        imgRadioApartment.image = [UIImage imageNamed:@"radio_unckeck.png"];
        PropertyType = @"0";
    }
    else
    {
        imgRadioApartment.image = [UIImage imageNamed:@"radio.png"];
        imgRadioHouse.image = [UIImage imageNamed:@"radio_unckeck.png"];
        PropertyType = @"1";
    }
}

- (IBAction)bedroomCount:(UIButton *)sender
{
    if (sender.tag == 0)
    {
        NSString *value = txtBedRoomCount.text;
        
        NSInteger count = [value integerValue];
        
        if (count != 1)
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
        
        if (count != 1)
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

- (IBAction)btnContivueClk:(id)sender
{
    NSString *isLease;
    
    if (switchLeaseClean.on)
    {
        isLease = @"1";
    }
    else
    {
        isLease = @"0";
    }
    NSDictionary *dict = @{@"user_id" : User_Id,
                           @"title" : @"",
                           @"description" :@"",
                           @"task_type" : @"1",
                           @"property_type" : PropertyType,
                           @"no_bedroom" : txtBedRoomCount.text,
                           @"no_bathroom" : txtBathRoomCount.text,
                           @"lease_clean" : isLease,
                           @"additional_cleaning" : @"",
                           @"additional_note" : @"",
                           @"location_name" : @"",
                           @"location_latitude" : @"",
                           @"location_longtitude" : @"",
                           @"task_timeline" : @"",
                           @"budget_range" : @"",
                           @"total_hours" : @"",
                           @"no_tasker" : @"",
                           @"budget_hours" : @"",
                           @"hour_price" : @"",
                           @"device_token" : @"",
                           @"device_type" : @"I",
                           @"service_type_id" : @"1",
                           @"estimate_budget" : @""};
    
    UIStoryboard *storybord = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    CleanTaskVC2 *obj = [storybord instantiateViewControllerWithIdentifier:@"CleanTaskVC2"];
    obj.dict = [NSMutableDictionary dictionaryWithDictionary:dict];
    [self.navigationController pushViewController:obj animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

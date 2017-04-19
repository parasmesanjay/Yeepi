//
//  ResgisterDetail.m
//  Yeepi
//
//  Created by Apple on 08/03/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "ResgisterDetail.h"

@interface ResgisterDetail ()

@end

@implementation ResgisterDetail

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GET_HEADER_VIEW
    header.lblTitle.text = @"Signup to Yeepi";
    STATUS_BAR
    self.view.backgroundColor = APP_COLOR_BLUE;
    
    [tpScroll setContentSize:CGSizeMake(WIDTH, btnCreate.frame.origin.y+80)];
    
    NSArray *arrViews = @[viewFistName,viewLastName,viewEmail,viewEmail,viewMobile,btnUserCurrentLoc];
    for (UIView *view in arrViews)
    {
        view.layer.cornerRadius = 10;
        view.layer.borderColor = [UIColor lightTextColor].CGColor;
        view.layer.borderWidth = 1;
        view.backgroundColor = CLEAR_COLOR;
    }
    
    arrViews = @[textEmail,textMobile,textAddress,textLastName,textFirstName];
    for (UITextField *textField in arrViews)
    {
        [textField setValue:[UIColor lightTextColor] forKeyPath:@"_placeholderLabel.textColor"];
        textField.textColor = WHITE_COLOR;
    }
    
    locTag = false;
    btnCreate.layer.cornerRadius = 22;
    
    lmanager = [[CLLocationManager alloc]init];
    [lmanager requestWhenInUseAuthorization];
    //[lmanager startUpdatingLocation];
    
    [mapLoc showsUserLocation];
    
    //lmanager.delegate = self;
}

//-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
//{
//
//    //NSLog(@"lat --   %f",locations.lastObject.coordinate.latitude);
//    
//}


- (IBAction)tapUseCurrentLocation:(id)sender
{
    locTag =YES;
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance (mapLoc.userLocation.coordinate, 50000, 50000);
    [mapLoc setRegion:region animated:NO];
    // [lmanager stopUpdatingLocation];

}



- (IBAction)tapCreate:(id)sender {
}



- (void)mapView:(MKMapView *)map regionDidChangeAnimated:(BOOL)animated
{
    @try
    {
        if (locTag == YES) {
            
        
        CLLocationCoordinate2D locationResion;
        locationResion.latitude = map.region.center.latitude;
        locationResion.longitude = map.region.center.longitude;
        
        // selected_cordinate = locationResion;
        NSString *urlString = [NSString stringWithFormat:@"http://maps.googleapis.com/maps/api/geocode/json?latlng=%f,%f&sensor=true&language=ENGLISH",locationResion.latitude,locationResion.longitude];
        lblAddress.text = @"Please Wait...";
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        manager.securityPolicy.allowInvalidCertificates = YES;
        
        [manager POST:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] parameters:nil success:^(NSURLSessionDataTask *dataTask, id responseObject)
         {
             @try
             {
                 NSMutableDictionary *json = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
                 
                 if ([[json objectForKey:@"results"] count] == 0)
                 {
                     
                 }
                 else
                 {
                     @try
                     {
                         lblAddress.text = [NSString stringWithFormat:@"%@",[[[json objectForKey:@"results"] objectAtIndex:0] objectForKey:@"formatted_address"]];
                         textAddress.text = lblAddress.text;
                         
                         //  city =  [[[[[json objectForKey:@"results"] objectAtIndex:0] objectForKey:@"address_components"] objectAtIndex:2] objectForKey:@"long_name"];
                         //                         state =  [[[[[json objectForKey:@"results"] objectAtIndex:0] objectForKey:@"address_components"] objectAtIndex:3] objectForKey:@"long_name"];
                         
                     } @catch (NSException *exception) {
                         
                     } @finally {
                         
                         //  text_address.text = [NSString stringWithFormat:@"%@",[[[json objectForKey:@"results"] objectAtIndex:0] objectForKey:@"formatted_address"]];
                     }
                 }
             }
             @catch (NSException *exception)
             {
                 
             }
             @finally
             {
                 
             }
         }failure:^(NSURLSessionDataTask *dataTask, NSError *error)
         {
         
         }];
        }
    }
    @catch (NSException *exception)
    {}
}
- (IBAction)tapSelectLocation:(id)sender {
    
    locTag = YES;

    [UIView animateWithDuration:0.2 animations:^{
        viewMap.frame = CGRectMake(0,0, WIDTH, self.view.frame.size.height);
    }];
    
}
- (IBAction)tapDoneLoc:(id)sender {
    locTag = NO;

    [UIView animateWithDuration:0.2 animations:^{
        viewMap.frame = CGRectMake(0,HEIGHT, WIDTH, HEIGHT);
    }];
}
HIDE_KEY_ON_TOUCH
@end

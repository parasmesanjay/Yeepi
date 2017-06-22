//
//  CreateTaskVC2.m
//  Yeepi
//
//  Created by Ashish sharma on 15/05/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "CreateTaskVC2.h"

@interface CreateTaskVC2 ()

@end

@implementation CreateTaskVC2
{
    NSString *lat, *lon;
    
    UIToolbar *toolBarDate;
}

@synthesize dict;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    GET_HEADER_VIEW
    header.lblTitle.text = [AppDelegate AppDelegate].TaskTitle;
    STATUS_BAR
    
    viewMap.frame = CGRectMake(0, HEIGHT, WIDTH, HEIGHT);
    locTag = false;
    lmanager = [[CLLocationManager alloc]init];
    [lmanager requestWhenInUseAuthorization];
    //[lmanager startUpdatingLocation];
    
    [mapLoc showsUserLocation];

    for (int i=1; i<=3; i++)
    {
        UILabel *lbl = [self.view viewWithTag:100+i];
        
        lbl.layer.cornerRadius = 25;
        lbl.layer.masksToBounds = YES;
        
        if (i == 3)
        {
            lbl.layer.borderWidth = 2;
            lbl.layer.borderColor = [WHITE_COLOR CGColor];
        }
    }
    
    [imgRadio setTintColor:WHITE_COLOR];
    imgRadio.image =  [imgRadio.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    [self setBorder:viewLocation];
    [self setBorder:viewTime_Date];
    
    btnNext.layer.cornerRadius = 22;
    btnNext.layer.masksToBounds = YES;
    
    search.delegate = self;
    
    [self DatePickerView];
    
    [scrollTpView setContentSize:CGSizeMake(WIDTH, 667)];
}

-(void) setBorder:(UIView *)View
{
    View.layer.borderWidth = 1;
    View.layer.borderColor = [[UIColor lightTextColor] CGColor];
    View.layer.cornerRadius = 5;
    View.layer.masksToBounds = YES;
}

- (IBAction)tapUseCurrentLocation:(id)sender
{
    locTag =YES;
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance (mapLoc.userLocation.coordinate, 50000, 50000);
    [mapLoc setRegion:region animated:NO];
    // [lmanager stopUpdatingLocation]; ff
    
    lat = [NSString stringWithFormat:@"%f",mapLoc.userLocation.coordinate.latitude];
    lon = [NSString stringWithFormat:@"%f",mapLoc.userLocation.coordinate.longitude];
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
                             lblLocation.text = lblAddress.text;
                             
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
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance (lmanager.location.coordinate, 50000, 50000);
    [mapLoc setRegion:region animated:NO];
    
    [self.view addSubview:viewMap];
    
    [UIView animateWithDuration:0.2 animations:^{
        viewMap.frame = CGRectMake(0,20, WIDTH, self.view.frame.size.height-20);
    }];
    
}
- (IBAction)tapDoneLoc:(id)sender {
    locTag = NO;
    
    lat = [NSString stringWithFormat:@"%f",mapLoc.region.center.latitude];
    lon = [NSString stringWithFormat:@"%f",mapLoc.region.center.longitude];
    
    [UIView animateWithDuration:0.2 animations:^{
        viewMap.frame = CGRectMake(0,HEIGHT, WIDTH, HEIGHT);
    }];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    
    [searchBar endEditing:YES];
    NSString *location = searchBar.text;
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:location
                 completionHandler:^(NSArray *placemarks, NSError *error){
                     if (placemarks && placemarks.count > 0) {
                         CLPlacemark *topResult = [placemarks objectAtIndex:0];
                         
                         CLLocationCoordinate2D location;
                         
                         // locatonArray = [NSArray arrayWithArray:placemarks];
                         location = topResult.location.coordinate;
                         
                         
                         // CLPlacemark *newPlacemark = [placemarks lastObject];
                         MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(location, 8000, 8000);
                         [mapLoc setRegion:[mapLoc regionThatFits:region] animated:YES];
                         
                         
                     }}];
    
}

- (IBAction)btnDate_TimeClk:(id)sender
{
    if ([txtDate_Time.text isEqualToString:@"Enter Time and Date"])
    {
        NSDate *currDate = [NSDate date];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
        NSString *dateString = [dateFormatter stringFromDate:currDate];
        
        txtDate_Time.text = dateString;
    }
    
    [txtDate_Time becomeFirstResponder];
}

#pragma mark - Date PickerView

-(void)DatePickerView
{
    txtDate_Time.delegate = self;
    
    datePicker =[[UIDatePicker alloc] init];
    datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    //    datePicker.hidden=NO;
    datePicker.date=[NSDate date];
    [datePicker addTarget:self action:@selector(LabelTitle:) forControlEvents:UIControlEventValueChanged];
    //[self.view addSubview:datePicker];
    
    UIBarButtonItem *rightBtn=[[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(save:)];
    
    UIBarButtonItem *flex = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    toolBarDate = [[UIToolbar alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-datePicker.frame.size.height-50, self.view.frame.size.width, 50)];
    
    [toolBarDate setBarStyle:UIBarStyleBlackOpaque];
    
    NSArray *toolbarItems = [NSArray arrayWithObjects:flex, rightBtn, nil];
    
    [toolBarDate setItems:toolbarItems];
    
    txtDate_Time.inputView = datePicker;
    txtDate_Time.inputAccessoryView = toolBarDate;
}

-(void)LabelTitle:(id)sender
{
    NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];
    dateFormat.dateStyle=NSDateFormatterMediumStyle;
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *str=[NSString stringWithFormat:@"%@",[dateFormat  stringFromDate:datePicker.date]];
    
    txtDate_Time.text=str;
}

-(void)save:(id)sender
{
    //[datePicker removeFromSuperview];
    
    //[txtDOB endEditing:YES];
    
    [txtDate_Time endEditing:YES];
}

- (IBAction)btnNextClk:(id)sender
{
    if ([lblLocation.text isEqualToString:@"Enter your location"])
    {
        [WebServiceCalls alert:@"Enter your Location."];
    }
    else if ([txtDate_Time.text isEqualToString:@"Enter Time and Date"])
    {
        [WebServiceCalls alert:@"Enter Date and Time."];
    }
    else
    {
        [dict setObject:lblLocation.text forKey:@"location_name"];
        [dict setObject:txtDate_Time.text forKey:@"task_timeline"];
        [dict setObject:lat forKey:@"location_latitude"];
        [dict setObject:lon forKey:@"location_longtitude"];

        UIStoryboard *storybord = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        CreatTaskVC3 *obj = [storybord instantiateViewControllerWithIdentifier:@"CreatTaskVC3"];
        obj.dict = [NSMutableDictionary dictionaryWithDictionary:dict];
        [self.navigationController pushViewController:obj animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

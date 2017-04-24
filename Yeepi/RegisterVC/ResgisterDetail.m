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
{
    NSData *image_data;
    
    NSInteger proPicFlag;
    
    NSString *lat, *lon, *OTP;
    
    NSArray *txtArray;
    
    VarifyPopUp *VPUView;
    
    BOOL emailChk, mobileChk;
}

@synthesize Email, Password;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    proPicFlag = 0;
    
    emailChk = mobileChk = false;

    GET_HEADER_VIEW
    header.lblTitle.text = @"Signup to Yeepi";
    STATUS_BAR
    self.view.backgroundColor = APP_COLOR_BLUE;
    
    viewMap.frame = CGRectMake(0, HEIGHT, WIDTH, HEIGHT);
    
    chkBoxDoTask.boxType = chkBoxPostTask.boxType = BEMBoxTypeSquare;
    
    textEmail.text = Email;
    
    btnProfile.layer.cornerRadius = 35;
    btnProfile.layer.masksToBounds = YES;
    
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
    
    txtArray = @[textEmail, textMobile];
    
    int i =0;
    for (UITextField *txt in txtArray)
    {
        UIView *vw = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 44)];
        
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 12, 20, 20)];
        
        imgView.image = [UIImage imageNamed:@"tick.png"];
        
        imgView.tag = 1000 + i;
        
        //UIImage *image = [[UIImage imageNamed:@"green_tick.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        //imgView.tintColor = WHITE_COLOR;

        [vw addSubview:imgView];
        
        txt.rightView = vw;
        
        txt.rightViewMode = UITextFieldViewModeAlways;
        
        i++;
    }
}

- (IBAction)btnVarifyClk:(UIButton *)sender
{
    
    // URL : http://appone.biz/yeepi/api/users/send-email-otp.json
    // http://appone.biz/yeepi/api/users/send-phone-otp.json
    
    NSDictionary *dic;
    NSString *url;
    
    if (sender.tag == 0)
    {
        /*if (textEmail.text.length < 1)
        {
            [WebServiceCalls alert:@"Enter Email First."];
            
            [textEmail becomeFirstResponder];
        }
        else if ([WebServiceCalls isValidEmail:textEmail.text] == NO)
        {
            [WebServiceCalls alert:@"Enter valid Email."];
            
            [textEmail becomeFirstResponder];
        }
        else
        {*/
            dic = @{@"email":textEmail.text};
            url = @"users/send-email-otp.json";
            
            [self VarifyData:dic Url:url Flag:sender.tag];
        //}
    }
    else
    {
        if (textMobile.text.length < 10)
        {
            [WebServiceCalls alert:@"Mobile number should be minimum 10 characters."];
            
            [textMobile becomeFirstResponder];
        }
        else
        {
            dic = @{@"phone":[NSString stringWithFormat:@"%@%@", PhoneCode, textMobile.text]};
            url = @"users/send-phone-otp.json";
            
            [self VarifyData:dic Url:url Flag:sender.tag];
        }
    }
}

-(void) VarifyData:(NSDictionary *)dic  Url:(NSString *)url  Flag:(NSInteger)flag
{
    @try
    {
        SVHUD_START
        [WebServiceCalls POST:url parameter:dic completionBlock:^(id JSON, WebServiceResult result)
         {
             SVHUD_STOP
             @try
             {
                 NSLog(@"%@", JSON);
                 NSDictionary *dict = JSON[@"response"];
                 if ([dict[@"status"] integerValue] == 1)
                 {
                     [SVProgressHUD showInfoWithStatus:[NSString stringWithFormat:@"%@", dict[@"msg"]]];
                     
                     VPUView = [[[NSBundle mainBundle] loadNibNamed:@"VarifyPopUp" owner:self options:nil] objectAtIndex:0];
                     VPUView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
                     VPUView.selfBack = self;
                     VPUView.flag = flag;
                     [self.view addSubview:VPUView];
                     
                     [VPUView.btnSubmit addTarget:self action:@selector(btnSubmitInViewClk:) forControlEvents:UIControlEventTouchUpInside];
                     
                     OTP = [NSString stringWithFormat:@"%@", dict[@"otp"]];
                 }
                 else
                 {
                     [WebServiceCalls alert:[NSString stringWithFormat:@"%@", dict[@"msg"]]];
                 }
             }
             @catch (NSException *exception)
             {
                 [WebServiceCalls alert:@"Some problem.\nPlease try again."];
             }
             @finally
             {
             }
         }];
    }
    @catch (NSException *exception)
    {
        [WebServiceCalls alert:@"Some problem.\nPlease try again."];
    }
    @finally {
        
    }
}

- (IBAction)btnSubmitInViewClk:(UIButton *)sender
{
    if ([VPUView.txtOTP.text isEqualToString:OTP])
    {
        if (VPUView.flag == 0)
        {
            emailChk = true;
        }
        else
        {
            mobileChk = true;
        }
        UIImageView *imgView;
        
        imgView = [self.view viewWithTag:1000+VPUView.flag];

        imgView.image = [UIImage imageNamed:@"green_tick.png"];
        
        [VPUView removeFromSuperview];
        
        [SVProgressHUD showInfoWithStatus:@"Success !\nOTP matched."];
    }
    else
    {
        [WebServiceCalls alert:@"Code not match.\nEnter a valid code."];
    }
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
    // [lmanager stopUpdatingLocation]; ff
    
    lat = [NSString stringWithFormat:@"%f",mapLoc.userLocation.coordinate.latitude];
    lon = [NSString stringWithFormat:@"%f",mapLoc.userLocation.coordinate.longitude];
}

- (IBAction)btnProfileClk:(id)sender
{
    [APPhotoLibrary sharedInstance].delegate = self;
    [[APPhotoLibrary sharedInstance]openPhotoFromCameraAndLibrary:self];
}

-(void)apActionSheetGetImage:(UIImage *)selectedPhoto
{
    CGSize newSize = CGSizeMake(500,500);
    UIGraphicsBeginImageContext(newSize);
    [selectedPhoto drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    image_data = UIImageJPEGRepresentation(newImage,0.1);
    
    [btnProfile setImage:newImage forState:UIControlStateNormal];
    
    proPicFlag = 1;
    
}

-(void)apActionSheetGetVideo:(NSURL *)selectedVideo
{
    
}

-(void)apActionSheetGetVideoThumbImage:(UIImage *)selectedVideoThumbImage
{
    
}

- (IBAction)tapCreate:(id)sender
{
    if (proPicFlag != 1)
    {
        [WebServiceCalls alert:@"Alert!\n\nUpload Profie pic First."];
    }
    else if (textFirstName.text.length < 1)
    {
        [WebServiceCalls alert:@"Enter your First name."];
        
        [textFirstName becomeFirstResponder];
    }
    else if (textLastName.text.length < 1)
    {
        [WebServiceCalls alert:@"Enter your Last name."];
        
        [textLastName becomeFirstResponder];
    }
    else if (!emailChk)
    {
        [WebServiceCalls alert:@"Varify your Email Address."];
        
    }
    /*else if ([WebServiceCalls isValidEmail:textEmail.text] == NO)
    {
        [WebServiceCalls alert:@"Enter valid Email."];
        
        [textEmail becomeFirstResponder];
    }*/
    else if (!mobileChk)
    {
        [WebServiceCalls alert:@"Varify your Mobile no."];
    }
    else if (textAddress.text.length < 1)
    {
        [WebServiceCalls alert:@"Enter your Address."];
    }
    else
    {
        SVHUD_START
        [self performSelector:@selector(SignUpDetails) withObject:nil afterDelay:0];
    }
}

-(void) SignUpDetails
{
    @try
    {
        // URL : http://appone.biz/yeepi/api/users/update-profile.json
        NSDictionary *dic = @{@"first_name":textFirstName.text,
                              @"last_name":textLastName.text,
                              @"email":textEmail.text,
                              @"phone":[NSString stringWithFormat:@"%@%@", PhoneCode, textMobile.text],
                              @"address":textAddress.text,
                              @"user_location":textAddress.text,
                              @"password":Password,
                              @"user_latitude":lat,
                              @"user_longitude":lon,
                              @"device_token":@"12345",
                              @"device_type":@"ios"};
        
        [WebServiceCalls POST:@"users/update-profile.json" parameter:dic imageData:image_data completionBlock:^(id JSON, WebServiceResult result)
        {
            SVHUD_STOP
             @try
             {
                 NSLog(@"%@", JSON);
                 NSDictionary *dict = JSON[@"response"];
                 if ([dict[@"status"] integerValue] == 1)
                 {
                     NSString *userID = [NSString stringWithFormat:@"%@", dict[@"data"][@"id"]];
                     
                     [[NSUserDefaults standardUserDefaults]setObject:userID forKey:@"userID"];
                     
                     NSString *fname = [NSString stringWithFormat:@"%@", dict[@"data"][@"first_name"]];
                     [[NSUserDefaults standardUserDefaults]setObject:fname forKey:@"fname"];
                     
                     NSString *lname = [NSString stringWithFormat:@"%@", dict[@"data"][@"last_name"]];
                     [[NSUserDefaults standardUserDefaults]setObject:lname forKey:@"lname"];
                     
                     NSDictionary *dic = [[NSDictionary alloc] initWithDictionary:dict[@"data"]];
                     NSData *myData = [NSKeyedArchiver archivedDataWithRootObject:dic];
                     
                     [[NSUserDefaults standardUserDefaults] setObject:myData forKey:@"userDetails"];
                     
                     /*UIStoryboard *storybord = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                     TabBarController *obj = [storybord instantiateViewControllerWithIdentifier:@"TabBarControllers"];
                     [obj setSelectedIndex:2];
                     [self.navigationController pushViewController:obj animated:YES];*/
                     
                     [self performSegueWithIdentifier:@"DetailsToTab" sender:nil];
                 }
                 else
                 {
                     [WebServiceCalls alert:[NSString stringWithFormat:@"%@", dict[@"msg"]]];
                 }
             }
             @catch (NSException *exception)
             {
                 [WebServiceCalls alert:@"Some problem in SignUp.\nPlease try again."];
             }
             @finally
             {
             }
         }];
    }
    @catch (NSException *exception)
    {
        [WebServiceCalls alert:@"Some problem in SignUp.\nPlease try again."];
    }
    @finally {
        
    }
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
    
    [self.view addSubview:viewMap];

    [UIView animateWithDuration:0.2 animations:^{
        viewMap.frame = CGRectMake(0,20, WIDTH, self.view.frame.size.height);
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
HIDE_KEY_ON_TOUCH
@end

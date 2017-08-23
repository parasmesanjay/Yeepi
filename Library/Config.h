//
//  Config.h
//  Vizzou'
//
//  Created by Ashish Kumar Sharma on 04/07/16.
//  Copyright © 2016 Ashish Kumar Sharma. All rights reserved.
//

#ifndef Config_h

#define WIDTH ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height)
#define HEIGHT ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width)


//#define BASE_URL @"http://appone.biz/yeepi/api/"
#define BASE_URL @"http://52.33.135.246/api/"
#define kClientID @"431281662590-2sm5ihqbmrvkv9ohg9rf80d880ucv6r8.apps.googleusercontent.com";

#define User_Id [[NSUserDefaults standardUserDefaults]objectForKey:@"userID"]

#define PhoneCode [[NSUserDefaults standardUserDefaults] objectForKey:@"PhoneCode"]

#define User_Password [[NSUserDefaults standardUserDefaults] objectForKey:@"Password"]

#define User_Fname [[NSUserDefaults standardUserDefaults]objectForKey:@"fname"]

#define User_Lname [[NSUserDefaults standardUserDefaults]objectForKey:@"lname"]

#define is_Poster [[NSUserDefaults standardUserDefaults]boolForKey:@"worker"] == NO
#define is_Worker [[NSUserDefaults standardUserDefaults]boolForKey:@"worker"] == YES

////// --- COLORS

#define WHITE_COLOR [UIColor colorWithRed:1 green:1 blue:1 alpha:1]
#define BLACK_COLOR [UIColor colorWithRed:0 green:0 blue:0 alpha:1]
#define CLEAR_COLOR [UIColor clearColor]
#define GRAY_COLOR [UIColor grayColor]

#define STATUS_COLOR [UIColor colorWithRed:2.0/255.0 green:112.0/255.0 blue:103.0/255.0 alpha:1]

#define APP_COLOR_HEADER [UIColor colorWithRed:4/255.0 green:151/255.0 blue:139/255.0 alpha:1]

#define APP_COLOR_BLUE [UIColor colorWithRed:24.0/255.0 green:44.0/255.0 blue:88.0/255.0 alpha:1]

#define TABLE_HEADER_COLOR [UIColor colorWithRed:225.0/255.0 green:225.0/255.0 blue:225.0/255.0 alpha:1]

#define APP_COLOR_RED [UIColor colorWithRed:241/255.0 green:111/255.0 blue:108/255.0 alpha:1]

#define APP_COLOR_GREEN [UIColor colorWithRed:71/255.0 green:192/255.0 blue:182/255.0 alpha:1]


#define Border_color_brown [UIColor colorWithRed:72/255.0 green:68/255.0 blue:86/255.0 alpha:1]
#define Corner_Radius 10

////// --- FIX CODES

#define HIDE_KEY [self.view endEditing:YES];

#define MBHUD_START [MBProgressHUD showHUDAddedTo:self.view animated:YES];
#define MBHUD_STOP  [MBProgressHUD hideHUDForView:self.view animated:YES];

#define SVHUD_START [SVProgressHUD show];
#define SVHUD_STOP  [SVProgressHUD dismiss];


#define HIDE_KEY_ON_TOUCH -(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event { HIDE_KEY }

#define HIDE_NAV_BAR self.navigationController.navigationBarHidden = YES;

#define POP_BACK [self.navigationController popViewControllerAnimated:YES];

#define STATUS_BAR_WHITE UIView *status = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 20)]; status.backgroundColor = WHITE_COLOR; [self.view addSubview:status];

#define STATUS_BAR UIView *status = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 20)]; status.backgroundColor = STATUS_COLOR; [self.view addSubview:status];

#define GET_HEADER_VIEW_NO_BACK  HeaderLogin *header = [[[NSBundle mainBundle] loadNibNamed:@"Header" owner:self options:nil] objectAtIndex:0]; header.selfBack = self;[self.view addSubview:header]; header.frame = CGRectMake(0, 0, WIDTH, 64); header.btnBack.hidden = YES; header.imgBack.hidden = YES;

#define GET_HEADER_VIEW HeaderLogin *header = [[[NSBundle mainBundle] loadNibNamed:@"Header" owner:self options:nil] objectAtIndex:0]; header.selfBack = self;[self.view addSubview:header]; header.frame = CGRectMake(0, 0, WIDTH, 64);

#define GET_TIP_VIEW TipView *tipView = [[[NSBundle mainBundle] loadNibNamed:@"ViewOther" owner:self options:nil] objectAtIndex:0]; tipView.selfBack = self;[self.view addSubview:tipView]; tipView.frame = CGRectMake(0,HEIGHT-60, WIDTH, 60);

#define GET_HEADER_VIEW_CART HeaderViewCart *header = [[[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:self options:nil] objectAtIndex:2]; header.selfBack = self;[self.view addSubview:header]; header.frame = CGRectMake(0, 0, WIDTH, 64);

#define SET_CORNER layer.cornerRadius = 5;


#define is_iPhone_5 WIDTH==320


#define Config_h

#endif

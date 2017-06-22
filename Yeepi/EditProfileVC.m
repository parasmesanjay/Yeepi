//
//  EditProfileVC.m
//  Yeepi
//
//  Created by Ashish Kumar Sharma on 13/06/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "EditProfileVC.h"

@interface EditProfileVC ()

@end

@implementation EditProfileVC

- (void)viewDidLoad
{
    [super viewDidLoad];

    GET_HEADER_VIEW
    header.lblTitle.text = @"EDIT PROFILE";
    STATUS_BAR
    
    [mainScroll setContentSize:CGSizeMake(WIDTH, viewInner.frame.size.height)];
    
    chkBoxDoTask.delegate = chkBoxPostTask.delegate = self;
}

- (void)didTapCheckBox:(BEMCheckBox *)checkBox
{
    if (chkBoxDoTask.on == NO && chkBoxPostTask.on == NO)
    {
        checkBox.on = YES;
        
        [SVProgressHUD showErrorWithStatus:@"Alert!\n\n You must select at least one role."];
        //[WebServiceCalls alert:@"Alert!\n\n You must select at least one role."];
    }
    else if ((chkBoxDoTask.on == YES && chkBoxPostTask.on == NO) || (chkBoxDoTask.on == NO && chkBoxPostTask.on == YES) || (chkBoxDoTask.on == YES && chkBoxPostTask.on == YES) )
    {
        if(checkBox.on == YES)
        {
            checkBox.on = NO;
        }
        else
        {
            checkBox.on = YES;
        }
        
        NSString *role_id;
        
        if (chkBoxDoTask.on == YES && chkBoxPostTask.on == YES)
        {
            role_id = @"3,2";
        }
        else if (chkBoxDoTask.on == YES )
        {
            role_id = @"3";
        }
        else if (chkBoxPostTask.on == YES )
        {
            role_id = @"2";
        }
        
        // http://appone.biz/yeepi/api/users/add-role-type.json
        // POST - , user_id
        
        NSDictionary *dic = @{@"user_id":User_Id,
                              @"role_id":role_id};
        
        [self UpdateInfo:@"users/add-role-type.json" :dic];

    }
    
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
    NSData *image_data = UIImageJPEGRepresentation(newImage,0.1);
    
    @try
    {
        // URL :
        
        NSDictionary *dic = @{@"user_id":User_Id};
        
        [WebServiceCalls POST:@"" parameter:dic imageData:image_data completionBlock:^(id JSON, WebServiceResult result)
         {
             SVHUD_STOP
             @try
             {
                 NSLog(@"%@", JSON);
                 NSDictionary *dict = JSON[@"response"];
                 if ([dict[@"status"] integerValue] == 1)
                 {
                     [btnProfilePic setImage:newImage forState:UIControlStateNormal];

                     imgProfileBkgrnd.image = newImage;
                     
                     [WebServiceCalls alert:[NSString stringWithFormat:@"Success\n\nProfile Pic Updated Successfully."]];
                 }
                 else
                 {
                     [WebServiceCalls alert:[NSString stringWithFormat:@"%@", dict[@"msg"]]];
                 }
             }
             @catch (NSException *exception)
             {
                 [WebServiceCalls alert:@"Some problem in Update Profile Pic.\nPlease try again."];
             }
             @finally
             {
             }
         }];
    }
    @catch (NSException *exception)
    {
        [WebServiceCalls alert:@"Some problem in Update Profile Pic.\nPlease try again."];
    }
    @finally {
        
    }
}

-(void)apActionSheetGetVideo:(NSURL *)selectedVideo
{
    
}

-(void)apActionSheetGetVideoThumbImage:(UIImage *)selectedVideoThumbImage
{
    
}

-(void) UpdateInfo:(NSString *)Url :(NSDictionary *)dict
{
    @try
    {
        [WebServiceCalls POST:Url parameter:dict completionBlock:^(id JSON, WebServiceResult result)
        {
                     SVHUD_STOP
             @try
             {
                 NSLog(@"%@", JSON);
                 NSDictionary *dict = JSON[@"response"];
                 if ([dict[@"status"] integerValue] == 1)
                 {
                     
                 }
                 else
                 {
                     [WebServiceCalls alert:[NSString stringWithFormat:@"%@", dict[@"msg"]]];
                 }
             }
             @catch (NSException *exception)
             {
                 [WebServiceCalls alert:@"Some problem in Update.\nPlease try again."];
             }
             @finally
             {
             }
         }];
    }
    @catch (NSException *exception)
    {
        [WebServiceCalls alert:@"Some problem in Update Profile.\nPlease try again."];
    }
    @finally {
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

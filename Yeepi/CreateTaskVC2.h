//
//  CreateTaskVC2.h
//  Yeepi
//
//  Created by Ashish sharma on 15/05/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface CreateTaskVC2 : UIViewController<MKMapViewDelegate,CLLocationManagerDelegate,UISearchBarDelegate,UITextFieldDelegate>
{
    
    IBOutlet TPKeyboardAvoidingScrollView *scrollTpView;
    
    UIDatePicker *datePicker;

    IBOutlet UIImageView *imgRadio;
    
    IBOutlet UIView *viewLocation;
    IBOutlet UILabel *lblLocation;
    
    IBOutlet UIView *viewTime_Date;
    IBOutlet UITextField *txtDate_Time;
    
    IBOutlet UIButton *btnNext;
    
    IBOutlet UIView *viewMap;
    IBOutlet MKMapView *mapLoc;
    IBOutlet UITextView *lblAddress;
    
    IBOutlet UISearchBar *search;
    
    BOOL locTag;
    CLLocationManager *lmanager;
}

@property (nonatomic, strong) NSMutableDictionary *dict;

@end

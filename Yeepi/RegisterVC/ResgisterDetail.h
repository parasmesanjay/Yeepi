//
//  ResgisterDetail.h
//  Yeepi
//
//  Created by Apple on 08/03/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ResgisterDetail : UIViewController<MKMapViewDelegate,CLLocationManagerDelegate>
{
    IBOutlet TPKeyboardAvoidingScrollView *tpScroll;
    
    IBOutlet UIView *viewFistName;
    IBOutlet UIView *viewLastName;
    IBOutlet UIView *viewEmail;
    IBOutlet UIView *viewMobile;
    
    IBOutlet UIButton *btnUserCurrentLoc;
    IBOutlet UIButton *btnCreate;
    IBOutlet UIButton *btnUseCurLoc;
 
    IBOutlet UITextField *textFirstName;
    IBOutlet UITextField *textLastName;
    IBOutlet UITextField *textEmail;
    IBOutlet UITextField *textMobile;
    IBOutlet UITextField *textAddress;

    IBOutlet UIView *viewMap;
    IBOutlet MKMapView *mapLoc;
    IBOutlet UITextView *lblAddress;

    IBOutlet UISearchBar *search;
    
    BOOL locTag;
    CLLocationManager *lmanager;

}
@end

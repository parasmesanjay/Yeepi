//
//  Login.h
//  Yeepi
//
//  Created by Apple on 06/03/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface Login : UIViewController<FBSDKLoginButtonDelegate>
{
    IBOutlet UIButton *btnLoginWithEmail;
    IBOutlet UIButton *btnTerms;
    
    FBSDKLoginButton *fbButton;

}
@end

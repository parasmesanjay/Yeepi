

#import "RegisterVC.h"

@interface RegisterVC ()

@end

@implementation RegisterVC

- (void)viewDidLoad {
    [super viewDidLoad];
   
    GET_HEADER_VIEW
    header.lblTitle.text = @"Signup to Yeepi";
    STATUS_BAR
    self.view.backgroundColor = APP_COLOR_BLUE;
    
//// ---  Text Field Properties
    
    viewEmail.layer.cornerRadius = viewPassword.layer.cornerRadius = btnLogin.layer.cornerRadius = 22;
    viewEmail.layer.borderColor = WHITE_COLOR.CGColor;
    viewEmail.layer.borderWidth = 1;
    
    viewPassword.layer.borderColor = WHITE_COLOR.CGColor;
    viewPassword.layer.borderWidth = 1;
    viewPassword.backgroundColor = viewEmail.backgroundColor = CLEAR_COLOR;
    
    [textEmail setValue:[UIColor lightTextColor] forKeyPath:@"_placeholderLabel.textColor"];
    [textPassword setValue:[UIColor lightTextColor] forKeyPath:@"_placeholderLabel.textColor"];
// tu bi ja
    
}


- (IBAction)btnSignUpClk:(id)sender
{
    if (textEmail.text.length < 1)
    {
        [WebServiceCalls alert:@"Enter Email First."];
    }
    else if ([WebServiceCalls isValidEmail:textEmail.text] == NO)
    {
        [WebServiceCalls alert:@"Enter valid Email."];
    }
    else if (textPassword.text.length < 6)
    {
        [WebServiceCalls alert:@"Password should be minimum 6 characters."];
    }
    else
    {
        SVHUD_START
        [self performSelector:@selector(SignUpChk) withObject:nil afterDelay:0];
    }
}

-(void) SignUpChk
{
    @try
    {
        // URL : http://appone.biz/yeepi/api/users/signup.json
        NSDictionary *dic = @{@"email":textEmail.text,
                              @"password":textPassword.text,
                              @"device_token":@"12345",
                              @"device_type":@"ios"};
        
        [WebServiceCalls POST:@"users/signup.json" parameter:dic completionBlock:^(id JSON, WebServiceResult result)
         {
             SVHUD_STOP
             NSLog(@"%@", JSON);
             NSDictionary *dict = JSON[@"response"];
             @try
             {
                 if ([dict[@"status"] integerValue] == 1)
                 {
                     /*UIStoryboard *storybord = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                     ResgisterDetail *obj = [storybord instantiateViewControllerWithIdentifier:@"TabBarControllers"];
                     [self.navigationController pushViewController:obj animated:YES];*/
                     
                     [self performSegueWithIdentifier:@"SignupToDetails" sender:nil];
                 }
                 else
                 {
                     [WebServiceCalls alert:[NSString stringWithFormat:@"%@", dict[@"msg"]]];
                 }
             }
             @catch (NSException *exception)
             {
                 [WebServiceCalls alert:@"Some problem in SignIn.\nPlease try again."];
             }
             @finally
             {
             }
         }];
    }
    @catch (NSException *exception) {
        
    } @finally {
        
    }
}

HIDE_KEY_ON_TOUCH
@end

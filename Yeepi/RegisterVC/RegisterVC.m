

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

    UIView *vw = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 50)];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 50)];
    
    [btn setTitle:@"Show" forState:UIControlStateNormal];
    [btn setTitle:@"Hide" forState:UIControlStateSelected];
    
    [btn setTitleColor:/*[UIColor colorWithRed:135/255.0 green:145/255.0 blue:155/255.0 alpha:1.0]*/ WHITE_COLOR forState:UIControlStateNormal];
    
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    
    //btn.tag = 1;
    
    [btn addTarget:self action:@selector(btnShoe_Hide:) forControlEvents:UIControlEventTouchUpInside];
    
    [vw addSubview:btn];
    
    textPassword.rightView = vw;
    
    textPassword.rightViewMode = UITextFieldViewModeAlways;
    
}

- (IBAction)btnShoe_Hide:(UIButton *)sender
{
    sender.selected = !sender.selected;
    
    if (sender.selected)
    {
        textPassword.secureTextEntry = NO;
    }
    else
    {
        textPassword.secureTextEntry = YES;
    }
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
             @try
             {
                 NSLog(@"%@", JSON);
                 NSDictionary *dict = JSON[@"response"];
                 
                 if ([dict[@"status"] integerValue] == 1)
                 {
                     UIStoryboard *storybord = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                     ResgisterDetail *obj = [storybord instantiateViewControllerWithIdentifier:@"ResgisterDetail"];
                     obj.Email = textEmail.text;
                     obj.Password = textPassword.text;
                     [self.navigationController pushViewController:obj animated:YES];
                 }
                 else
                 {
                     [WebServiceCalls alert:[NSString stringWithFormat:@"%@", dict[@"msg"][@"email"]]];
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
    @catch (NSException *exception)
    {
        [WebServiceCalls alert:@"Some problem in SignIn.\nPlease try again."];
    }
    @finally
    {        
    }
}

HIDE_KEY_ON_TOUCH
@end

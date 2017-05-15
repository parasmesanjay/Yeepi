//
//  PaymentMethodVC.m
//  Yeepi
//
//  Created by Ashish Kumar Sharma on 08/04/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "PaymentMethodVC.h"

@interface PaymentMethodVC ()

@end

@implementation PaymentMethodVC

- (void)viewDidLoad {
    [super viewDidLoad];
    GET_HEADER_VIEW
    header.lblTitle.text = @"PAYMENT METHOD";
    STATUS_BAR
    
    mySegment.backgroundColor = CLEAR_COLOR;
    mySegment.segmentFirstName = @"Make Payment";
    mySegment.segmentSecondName = @"Receive Payment";
    
    mySegment.delegate = self;
}
    
-(void)DidTapButton:(NSInteger)tag
{
    if (tag == 1)
    {
        btn_Bank_Card.tag = 0;
        
        img_Bank_Card.image = [UIImage imageNamed:@"image_credit_card.png"];
        lblTitle.text = @"Add a Credit Card";
    }
    else
    {
        btn_Bank_Card.tag = 1;
        
        img_Bank_Card.image = [UIImage imageNamed:@"image_bank_account.png"];
        lblTitle.text = @"Add a Bank Account";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btn_Bank_Card_Clk:(UIButton *)sender
{
    if (sender.tag == 0)
    {
        /*UIStoryboard *storybord = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        CreditCardVC *obj = [storybord instantiateViewControllerWithIdentifier:@"CreditCardVC"];
        [self.navigationController pushViewController:obj animated:YES];*/
        
        STPAddCardViewController *addCardViewController = [[STPAddCardViewController alloc] init];
        addCardViewController.delegate = self;
        // STPAddCardViewController must be shown inside a UINavigationController.
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:addCardViewController];
        [self presentViewController:navigationController animated:YES completion:nil];
    }
    else
    {
        UIStoryboard *storybord = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        BankAccountVC *obj = [storybord instantiateViewControllerWithIdentifier:@"BankAccountVC"];
        [self.navigationController pushViewController:obj animated:YES];
    }
}

- (IBAction)btnPaypalClk:(id)sender
{
    /*UIStoryboard *storybord = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    PaypalAccountVC *obj = [storybord instantiateViewControllerWithIdentifier:@"PaypalAccountVC"];
    [self.navigationController pushViewController:obj animated:YES];*/
    
    
}

#pragma mark STPAddCardViewControllerDelegate

- (void)addCardViewControllerDidCancel:(STPAddCardViewController *)addCardViewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)addCardViewController:(STPAddCardViewController *)addCardViewController
               didCreateToken:(STPToken *)token
                   completion:(STPErrorBlock)completion
{
    NSLog(@"%@", token);
    [self dismissViewControllerAnimated:YES completion:nil];

    /*[self submitTokenToBackend:token completion:^(NSError *error) {
        if (error) {
            completion(error);
        } else {
            [self dismissViewControllerAnimated:YES completion:^{
                [self showReceiptPage];
            }];
        }
    }];*/
}

#pragma mark STPPaymentCardTextFieldDelegate

/*- (void)paymentCardTextFieldDidChange:(STPPaymentCardTextField *)textField
{
    NSLog(@"Card number: %@ Exp Month: %@ Exp Year: %@ CVC: %@", textField.cardParams.number, @(textField.cardParams.expMonth), @(textField.cardParams.expYear), textField.cardParams.cvc);
    
    //self.buyButton.enabled = textField.isValid;
}*/

@end

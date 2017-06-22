//
//  CleanTaskVC2.m
//  Yeepi
//
//  Created by Ashish sharma on 15/05/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "CleanTaskVC2.h"

@interface CleanTaskVC2 ()

@end

@implementation CleanTaskVC2
{
    NSArray *arrBtn;
    
    UILabel *lblPH;
}

@synthesize dict;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    GET_HEADER_VIEW
    header.lblTitle.text = @"House Cleaning";
    STATUS_BAR
    
    arrBtn = @[btnlaundry, btnOven, btnCabinet, btnWindow, btnCarpet];
    
    for (int i=1; i<=3; i++)
    {
        UILabel *lbl = [self.view viewWithTag:100+i];
        
        lbl.layer.cornerRadius = 25;
        lbl.layer.masksToBounds = YES;
        
        if (i != 1)
        {
            lbl.layer.borderWidth = 2;
            lbl.layer.borderColor = [WHITE_COLOR CGColor];
        }
    }
    
    btnNext.layer.cornerRadius = 22;
    btnNext.layer.masksToBounds = YES;
    
    txtNotes.layer.cornerRadius = 10;
    txtNotes.layer.masksToBounds = YES;
    txtNotes.layer.borderWidth = 1;
    txtNotes.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    txtNotes.delegate = self;
    
    lblPH = [[UILabel alloc]initWithFrame:CGRectMake(txtNotes.frame.origin.x+5, txtNotes.frame.origin.y+8, txtNotes.frame.size.width-10,20)];
    lblPH.text = @"eg: Need some one very urgent.";
    [viewMain addSubview:lblPH];
    lblPH.textColor = APP_COLOR_GREEN;
    
    [viewMain setContentSize:CGSizeMake(WIDTH, btnNext.frame.origin.y+44+64+40)];
}

#pragma mark text view Delegate

- (void)textViewDidEndEditing:(UITextView *)theTextView
{
    if (![theTextView hasText]) {
        lblPH.hidden = NO;
    }
}

- (void) textViewDidChange:(UITextView *)textView
{
    if(![textView hasText])
    {
        lblPH.hidden = NO;
    }
    else
    {
        lblPH.hidden = YES;
    }
}

- (IBAction)btnAdditionalCleaningClk:(UIButton *)sender
{
    sender.selected = !sender.selected;
}

- (IBAction)btnNextClk:(id)sender
{
    if (txtNotes.text.length < 1)
    {
        [WebServiceCalls alert:@"Enter Notes first."];
    }
    else
    {
        NSString *additional_cleaning = @"";
        for (int i=1; i<=arrBtn.count; i++)
        {
            UIButton *btn = arrBtn[i-1];
            
            if (btn.selected)
            {
                if (additional_cleaning.length < 1)
                {
                    additional_cleaning = [NSString stringWithFormat:@"%d",i];
                }
                else
                {
                    additional_cleaning = [NSString stringWithFormat:@"%@,%d",additional_cleaning, i];
                }
            }
        }
        
        [self nextScreen_:additional_cleaning];
    }
}

-(void) nextScreen_:(NSString *)additional_cleaning
{
    [dict setObject:txtNotes.text forKey:@"additional_note"];
    [dict setObject:additional_cleaning forKey:@"additional_cleaning"];

    UIStoryboard *storybord = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    CreateTaskVC *obj = [storybord instantiateViewControllerWithIdentifier:@"CreateTaskVC"];
    obj.dict = dict;//[NSMutableDictionary dictionaryWithDictionary:dict];
    obj.isFromClean = true;
    [self.navigationController pushViewController:obj animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

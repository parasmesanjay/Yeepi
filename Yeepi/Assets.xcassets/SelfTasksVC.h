//
//  SelfTasksVC.h
//  Yeepi
//
//  Created by Apple on 17/03/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelfTasksVC : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    IBOutlet UIScrollView *mainScroll;
}

@property (nonatomic, readwrite) NSInteger index;

@end

//
//  BrowseVC.h
//  Yeepi
//
//  Created by Apple on 15/03/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BrowseVC : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    IBOutlet UITableView *table;

}
@end

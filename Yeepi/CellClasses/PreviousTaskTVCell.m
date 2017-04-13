//
//  PreviousTaskTVCell.m
//  Yeepi
//
//  Created by Ashish sharma on 13/04/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "PreviousTaskTVCell.h"

@implementation PreviousTaskTVCell

- (void)awakeFromNib
{
    [super awakeFromNib];

    
    
    [_icon_watch setTintColor:APP_COLOR_GREEN];
    _icon_watch.image =  [_icon_watch.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    [_icon_watch_1 setTintColor:APP_COLOR_GREEN];
    _icon_watch_1.image =  [_icon_watch_1.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

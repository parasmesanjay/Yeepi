//
//  MySegment.m
//  Yeepi
//
//  Created by Ashish sharma on 05/04/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "MySegment.h"

@implementation MySegment
{
    float vHeight,vWidth;
    
    UILabel *backLayer;
    
}
@synthesize segmentSecond,tintColor,borderColor;



- (void)drawRect:(CGRect)rect {
    
    vHeight = self.frame.size.height;
    vWidth = self.frame.size.width;
    
    float extraSpace = vHeight/2;
    float btnHt = vHeight;
    float btnWd = vWidth/2+extraSpace/2;
    
    tintColor = APP_COLOR_GREEN;
    borderColor = Border_color_brown;
    
    self.layer.borderColor = borderColor.CGColor;
    self.layer.borderWidth = 1;
    self.backgroundColor = CLEAR_COLOR;
    self.layer.cornerRadius = vHeight/2;
    
    
//    backLayer = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,btnWd,btnHt)];
//    backLayer.backgroundColor = tintColor;
//    [self addSubview:backLayer];
//    backLayer.layer.cornerRadius = btnHt/2;
//    backLayer.clipsToBounds = YES;

    
    _segmentFirst = [[UIButton alloc]initWithFrame:CGRectMake(0, 0,btnWd,btnHt)];
    _segmentFirst.layer.cornerRadius = btnHt/2;
    [self addSubview:_segmentFirst];
    _segmentFirst.backgroundColor = tintColor;
    [_segmentFirst addTarget:self action:@selector(tapSegment:) forControlEvents:UIControlEventTouchUpInside];
    _segmentFirst.tag = 1;
    [_segmentFirst setTitle:_segmentFirstName forState:UIControlStateNormal];
    
    segmentSecond = [[UIButton alloc]initWithFrame:CGRectMake(vWidth-btnWd, 0,btnWd,btnHt)];
    segmentSecond.layer.cornerRadius = btnHt/2;
    segmentSecond.backgroundColor = CLEAR_COLOR;
    [segmentSecond addTarget:self action:@selector(tapSegment:) forControlEvents:UIControlEventTouchUpInside];
    segmentSecond.tag = 2;
    [segmentSecond setTitle:_segmentSecondName forState:UIControlStateNormal];
    
    segmentSecond.titleLabel.font = _segmentFirst.titleLabel.font = [UIFont systemFontOfSize:14];
    
    [self addSubview:segmentSecond];

    [self addSubview:_segmentFirst];
    

}

-(void)tapSegment:(UIButton *)sender
{
    if (sender.tag == 1)
    {
        segmentSecond.backgroundColor = CLEAR_COLOR;
        _segmentFirst.backgroundColor = tintColor;
        
//        [UIView animateWithDuration:0.2 animations:^{
//            backLayer.frame = _segmentFirst.frame;
//        }];
        [self addSubview:_segmentFirst];
    }
    else
    {
        segmentSecond.backgroundColor = tintColor;
        _segmentFirst.backgroundColor = CLEAR_COLOR;
//        [UIView animateWithDuration:0.2 animations:^{
//            backLayer.frame = segmentSecond.frame;
//        }];
        
        [self addSubview:segmentSecond];

    }
    
    [self.delegate DidTapButton:sender.tag];
}

@end

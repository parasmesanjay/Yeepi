//
//  MySegment.h
//  Yeepi
//
//  Created by Ashish sharma on 05/04/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MySegment;
@protocol segementDelegate <NSObject>

-(void)DidTapButton:(NSInteger )tag;

@end

@interface MySegment : UIView

@property (nonatomic , assign) id <segementDelegate> delegate;

@property(nonatomic,strong) UIButton *segmentFirst;
@property(nonatomic,strong) UIButton *segmentSecond;

@property(nonatomic,strong)UIColor *borderColor;
@property(nonatomic,strong)UIColor *tintColor;

@property(nonatomic,strong) NSString *segmentFirstName;
@property(nonatomic,strong) NSString *segmentSecondName;


@end

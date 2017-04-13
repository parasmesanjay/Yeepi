//
//  UserSession.h
//  Friendsy
//
//  Created by Ashish Kumar Sharma on 13/07/16.
//  Copyright © 2016 Ashish Kumar Sharma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserSession : NSObject
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *mobile;
@property(nonatomic,strong)NSString *email;
@property(nonatomic,strong)NSString *city;
@property(nonatomic,strong)NSString *userId;
@property(nonatomic,strong)NSData *image_data;
@property(nonatomic,strong)NSString *password;


-(void)saveSession;
-(instancetype)initWithSession;
+(void)removeSession;

+(void)updateCart:(NSArray *)array;
+(void)saveNewCart:(NSDictionary *)dic;
+(NSArray*)getPreCart;



+(void)updateData:(NSDictionary *)array;
+(NSDictionary *)getPreData;
+(void)removeCartValues;
@end

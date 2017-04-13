//
//  UserSession.m
//  Friendsy
//
//  Created by Ashish Kumar Sharma on 13/07/16.
//  Copyright © 2016 Ashish Kumar Sharma. All rights reserved.
//

#import "UserSession.h"

@implementation UserSession
@synthesize name,email,userId,image_data,password,mobile,city;

-(void)saveSession
{
    [[NSUserDefaults standardUserDefaults]setObject:city forKey:@"city"];
    [[NSUserDefaults standardUserDefaults]setObject:name forKey:@"name"];
    [[NSUserDefaults standardUserDefaults]setObject:mobile forKey:@"mobile"];
    [[NSUserDefaults standardUserDefaults]setObject:email forKey:@"email"];
    [[NSUserDefaults standardUserDefaults]setObject:userId forKey:@"userId"];
    [[NSUserDefaults standardUserDefaults]setObject:image_data forKey:@"image_data"];
}

- (instancetype)initWithSession
{
    name = [[NSUserDefaults standardUserDefaults]objectForKey:@"name"];
    email = [[NSUserDefaults standardUserDefaults]objectForKey:@"email"];
    userId = [[NSUserDefaults standardUserDefaults]objectForKey:@"userId"];
    image_data = [[NSUserDefaults standardUserDefaults]objectForKey:@"image_data"];
    city = [[NSUserDefaults standardUserDefaults]objectForKey:@"city"];
    mobile = [[NSUserDefaults standardUserDefaults]objectForKey:@"mobile"];
    
    return self;
}

+(void)removeSession
{
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"name"];
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"email"];
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"userid"];
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"password"];
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"username"];
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"userData"];
}

+(void)saveNewCart:(NSDictionary *)dic;
{
    NSMutableArray *arr = [NSMutableArray array];
    
    if ([[NSUserDefaults standardUserDefaults]objectForKey:@"ArrCart"])
    {
        arr = [NSMutableArray arrayWithArray:[[NSUserDefaults standardUserDefaults]objectForKey:@"ArrCart"]];
    }
    
    [arr addObject:dic];
    [[NSUserDefaults standardUserDefaults]setObject:arr forKey:@"ArrCart"];
}

+(NSArray*)getPreCart
{
    return [[NSUserDefaults standardUserDefaults]objectForKey:@"ArrCart"];
}

+(void)updateCart:(NSArray *)array
{
    [[NSUserDefaults standardUserDefaults]setObject:array forKey:@"ArrCart"];
}

+(void)removeCartValues
{
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"ArrCart"];
}



+(void)updateData:(NSDictionary *)array
{
    [[NSUserDefaults standardUserDefaults]setObject:array forKey:@"data"];

}
+(NSDictionary *)getPreData
{
    return [[NSUserDefaults standardUserDefaults]objectForKey:@"data"];

}
@end

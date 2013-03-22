//
//  Authority.m
//  YAJIE
//
//  Created by zzlmilk on 13-1-17.
//  Copyright (c) 2013年 zzlmilk. All rights reserved.
//

#import "Authority.h"

@implementation Authority
+(BOOL)isAuthority{
    BOOL isLogin ;
    
    isLogin=   [[[NSUserDefaults standardUserDefaults] objectForKey:@"YAJI_LOGIN"] boolValue];
    return isLogin;
    
}

+(void)LoginIn{
     [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"YAJI_LOGIN"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


+(void)LoginOut{
     [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"YAJI_LOGIN"];
        [[NSUserDefaults standardUserDefaults] synchronize];
}


@end

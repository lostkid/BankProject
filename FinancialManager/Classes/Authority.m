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
   return [[[NSUserDefaults standardUserDefaults] objectForKey:@"Is_Login"] boolValue];
}

+(void)LoginIn{
     [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"Is_Login"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


+(void)LoginOut{
     [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"Is_Login"];
        [[NSUserDefaults standardUserDefaults] synchronize];
}


@end

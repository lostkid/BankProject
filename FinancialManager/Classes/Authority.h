//
//  Authority.h
//  YAJIE
//
//  Created by zzlmilk on 13-1-17.
//  Copyright (c) 2013年 zzlmilk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Authority : NSObject

+(BOOL)isAuthority;
+(void)LoginIn;
+(void)LoginOut;

@end

//
//  CustomNavigationBar.m
//  Summly
//
//  Created by zoe on 12-12-17.
//  Copyright (c) 2012年 zzlmilk. All rights reserved.
//

#import "CustomNavigationBar.h"

@implementation  UINavigationBar (UINavigationBarCategory)

- (id)init{
    
    if ([super init]) {
        NSLog(@"走过");
    }

    return self;
}

- (UIImage *)barBackground//导航栏
{
    return [UIImage imageNamed:@"bg_title_bar"];
}

- (void)drawRect:(CGRect)rect{

    [super drawRect:rect];
    
    if ([self respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)])
    {
        [self setBackgroundImage:[self barBackground] forBarMetrics:UIBarMetricsDefault];
    }
    
    UIColor *color = [UIColor groupTableViewBackgroundColor];
    self.tintColor = color;
        
    UIFont *font = [UIFont systemFontOfSize:20];
    
    NSDictionary *attr = [[NSDictionary alloc] initWithObjectsAndKeys:font, UITextAttributeFont,[UIColor whiteColor],UITextAttributeTextColor, nil];
    [self setTitleTextAttributes:attr];

}





@end

//
//  UINavigationBar+CustomNavigationBar.m
//  FinancialManager
//
//  Created by Zoe on 13-3-25.
//  Copyright (c) 2013年 邹 露. All rights reserved.
//

#import "UINavigationBar+CustomNavigationBar.h"

@implementation UINavigationBar (CustomNavigationBar)


- (UIImage *)barBackground//粉红条的导航栏
{
    return [UIImage imageNamed:@"bg_title_bar"];
}


- (void)didMoveToSuperview
{
    
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

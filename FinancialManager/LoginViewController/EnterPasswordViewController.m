//
//  EnterPasswordViewController.m
//  FinancialManager
//
//  Created by Zoe on 13-3-21.
//  Copyright (c) 2013年 邹 露. All rights reserved.
//

#import "EnterPasswordViewController.h"
#import "AppDelegate.h"

#import "Authority.h"

#define NineWidth 600

#define LabelWidth 500
#define LabelHeight 50
#define LabelTopMargin 150

@interface EnterPasswordViewController ()

@end

@implementation EnterPasswordViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    nineLockView = [[NineGridUnlockView alloc] initWithFrame:CGRectMake((self.view.bounds.size.width-NineWidth)/2, (self.view.bounds.size.height-NineWidth)/2, NineWidth, NineWidth)];
    nineLockView.delegate=self;
    [self.view addSubview:nineLockView];
    
    alertLabel  = [[UILabel alloc] initWithFrame:CGRectMake((self.view.bounds.size.width-LabelWidth)/2, nineLockView.frame.origin.y-50, LabelWidth,LabelHeight)];
    alertLabel.textAlignment =NSTextAlignmentCenter;
    if (![Authority isAuthority]) {
        [alertLabel setText:@"绘制密码"];
    }else
        [alertLabel setText:@"确定密码"];
    [self.view addSubview:alertLabel];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
 
}

#pragma mark--
#pragma mark--UnlockViewDelegate回调
- (void)unlockerView:(NineGridUnlockView*)unlockerView didFinished:(NSArray*)points{
    NSString *code =[points componentsJoinedByString:@""];
    NSLog(@"code %@ ,授权%d",code,[Authority isAuthority]);
    //先判断是否授权
    if (![Authority isAuthority]) {
        //输入密码逻辑
        if (passWordTime == FirstTime) {
            codeStr =code;
            alertLabel.text=@"确认密码";
            passWordTime=SecondTime;
            return;
        }
        if (passWordTime == SecondTime) {
            if ([codeStr isEqualToString:code]) {
                //初次设置成功跳转主界面
                NSLog(@"一次设置成功跳转主界面");
                alertLabel.text=@"密码设置成功";
                //登陆成功
                [[AppDelegate getAppdelegate] getMainVC];
                [Authority LoginIn];
                [[NSUserDefaults standardUserDefaults] setValue:codeStr forKey:@"PassWord"];
                
                NSLog(@"授权%d",[Authority isAuthority]);

            }
            else{
                NSLog(@"设置失败，重新设置密码");
                alertLabel.text=@"密码不一致，重新设置";
                passWordTime = FirstTime;
            }
            return;
        }
    }
    else{
        if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"PassWord"] isEqualToString:code]) {

            [[AppDelegate getAppdelegate] getMainVC];
            [Authority LoginIn];
        }else{
            alertLabel.text = @"密码不正确，请重新输入";
        }
    
    }
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    
//    NSLog(@"bounds%@",NSStringFromCGRect(self.view.bounds));
    
    CGRect frame;
    if ([[UIDevice currentDevice]orientation] ==UIDeviceOrientationPortrait|[[UIDevice currentDevice]orientation] ==UIDeviceOrientationPortraitUpsideDown) {
        
        frame = CGRectMake(0, 0,self.view.bounds.size.height , self.view.bounds.size.width);
    };
    if ([[UIDevice currentDevice]orientation] ==UIDeviceOrientationLandscapeLeft|[[UIDevice currentDevice]orientation] ==UIDeviceOrientationLandscapeRight) {
        frame = CGRectMake(0, 0, self.view.bounds.size.height, self.view.bounds.size.width);
    }

     [nineLockView setFrame:CGRectMake((frame.size.width-NineWidth)/2, (frame.size.height-NineWidth)/2, NineWidth, NineWidth)];
     [alertLabel setFrame:CGRectMake((frame.size.width-LabelWidth)/2, nineLockView.frame.origin.y-50, LabelWidth,LabelHeight)];

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  LoginViewController.m
//  FinancialManager
//
//  Created by Zoe on 13-3-21.
//  Copyright (c) 2013年 邹 露. All rights reserved.
//

#import "LoginViewController.h"
#import "EnterPasswordViewController.h"
#import "Authority.h"

#define LABEL_WIDTH 50
#define LABEL_HEIGHT 40
#define TextField_WIDTH 200
#define BETWEEN 10

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = NSLocalizedString(@"Login", nil);
    
    UITapGestureRecognizer *tapOne = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleOneTap:)];
    tapOne.delegate=self;
    [tapOne setNumberOfTapsRequired:1];
    [self.view addGestureRecognizer:tapOne];
    
    nameLabel = [[UILabel alloc] initWithFrame:CGRectMake((self.view.bounds.size.width-LABEL_WIDTH-BETWEEN-TextField_WIDTH)/2, 300, LABEL_WIDTH, LABEL_HEIGHT)];
    nameLabel.text = NSLocalizedString(@"name:", nil);
    nameLabel.font = [UIFont systemFontOfSize:17];
    [self.view addSubview:nameLabel];

    textField = [[UITextField alloc] initWithFrame:CGRectMake(nameLabel.frame.size.width+nameLabel.frame.origin.x+BETWEEN, nameLabel.frame.origin.y, TextField_WIDTH, LABEL_HEIGHT)];
    textField.placeholder = NSLocalizedString(@"Please enter your name", nil);
    textField.returnKeyType=UIReturnKeyNext;
    textField.borderStyle=UITextBorderStyleRoundedRect;
    textField.delegate=self;
    [self.view addSubview:textField];
    
    
    
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    
    CGRect frame;
    if ([[UIDevice currentDevice]orientation] ==UIDeviceOrientationPortrait|[[UIDevice currentDevice]orientation] ==UIDeviceOrientationPortraitUpsideDown) {
        
        frame = CGRectMake(0, 0,self.view.bounds.size.height , self.view.bounds.size.width);
    };
    if ([[UIDevice currentDevice]orientation] ==UIDeviceOrientationLandscapeLeft|[[UIDevice currentDevice]orientation] ==UIDeviceOrientationLandscapeRight) {
        frame = CGRectMake(0, 0, self.view.bounds.size.height, self.view.bounds.size.width);
    }
    
    [nameLabel setFrame:CGRectMake((frame.size.width-LABEL_WIDTH-BETWEEN-TextField_WIDTH)/2, 300, LABEL_WIDTH, LABEL_HEIGHT)];
    [textField setFrame:CGRectMake(nameLabel.frame.size.width+nameLabel.frame.origin.x+BETWEEN, nameLabel.frame.origin.y, TextField_WIDTH, LABEL_HEIGHT)];


}

#pragma mark--GestureRecognizerDelegate
//隐藏键盘
- (void)handleOneTap:(UIGestureRecognizer *)gestureRecognizer{

    [textField resignFirstResponder];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    return YES;
}

#pragma mark--
#pragma mark--TextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField{

    EnterPasswordViewController *passwordVC = [[EnterPasswordViewController alloc] init];
    [self.navigationController pushViewController:passwordVC animated:YES];
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  CustomerInformationViewController.m
//  FinancialManager
//
//  Created by Zoe on 13-3-21.
//  Copyright (c) 2013年 邹 露. All rights reserved.
//

#import "CustomerInformationViewController.h"

@interface CustomerInformationViewController ()

@end

@implementation CustomerInformationViewController

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
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    label.text=@"客户信息";
    label.font=[UIFont systemFontOfSize:20];
    [self.view addSubview:label];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

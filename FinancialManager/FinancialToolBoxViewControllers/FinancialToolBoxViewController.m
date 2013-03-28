//
//  FinancialToolBoxViewController.m
//  FinancialManager
//
//  Created by Zoe on 13-3-21.
//  Copyright (c) 2013年 邹 露. All rights reserved.
//

#import "FinancialToolBoxViewController.h"
#import "Cal1_1ViewController.h"

@interface FinancialToolBoxViewController ()

@end

@implementation FinancialToolBoxViewController

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
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 120, 200, 200)];
    label.text=@"计算器";
    label.font=[UIFont systemFontOfSize:20];
    [self.view addSubview:label];
    
    UIButton *calculatorBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    [calculatorBtn setBackgroundImage:[UIImage imageNamed:@"icon1.0.png"] forState:UIControlStateNormal];
    calculatorBtn.frame=CGRectMake(100, 100, 100, 100);
    [calculatorBtn addTarget:self action:@selector(calculatorClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:calculatorBtn];
        
}

- (void)calculatorClick:(id)sender{
    Cal1_1ViewController *calVC = [[Cal1_1ViewController alloc] init];
    [self.navigationController pushViewController:calVC animated:YES];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

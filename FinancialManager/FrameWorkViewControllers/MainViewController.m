//
//  MainViewController.m
//  FinancialManager
//
//  Created by lostkid on 13-3-12.
//  Copyright (c) 2013年 邹 露. All rights reserved.
//

#import "MainViewController.h"

#import "CustomerInformationViewController.h"
#import "MenuListViewController.h"

#define SplitWidth 200

@interface MainViewController ()

@end

@implementation MainViewController

- (id)init
{
    self = [super init];
    if (self) {
        self.splitPosition  = SplitWidth;
        self.showsMasterInPortrait =YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CustomerInformationViewController *cusInfoVC = [CustomerInformationViewController instance];
    UINavigationController *navInfo = [[UINavigationController alloc] initWithRootViewController:cusInfoVC];
    self.detailViewController = navInfo;
    
    MenuListViewController *menuListVC = [[MenuListViewController alloc] init];
    UINavigationController *navMenuVC = [[UINavigationController alloc] initWithRootViewController:menuListVC];
    menuListVC.mainVC=self;
    self.masterViewController = navMenuVC;
    menuListVC.customerInfoVC=cusInfoVC;

}


-(void)setDetailViewControllers:(UIViewController *)detailViewControllers{
    
    UIViewController *navVC = [self.viewControllers objectAtIndex:0];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:detailViewControllers];
    NSArray *viewControllers = [NSArray arrayWithObjects:navVC,navController, nil];    
    self.viewControllers = viewControllers;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

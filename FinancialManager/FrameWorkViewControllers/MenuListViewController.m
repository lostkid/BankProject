//
//  MenuListViewController.m
//  FinancialManager
//
//  Created by Zoe on 13-3-22.
//  Copyright (c) 2013年 邹 露. All rights reserved.
//

#import "MenuListViewController.h"

#import "CustomerInformationViewController.h"
#import "FinancialToolBoxViewController.h"
#import "ProductsShowViewController.h"
#import "ProductsContrastViewController.h"

@interface MenuListViewController ()

@end

@implementation MenuListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

        self.listArr = [[NSMutableArray alloc] initWithObjects:NSLocalizedString(@"Customer Info", nil),NSLocalizedString(@"Financial Tool Box", nil),NSLocalizedString(@"Product Show", nil),NSLocalizedString(@"Product Contrast", nil),nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
}

#pragma mark--
#pragma mark--TableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"CustomCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {

       cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
        
    cell.textLabel.text = [self.listArr objectAtIndex:indexPath.row];
    
     return cell;
}

#pragma mark Table Delegate Methods
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //客户资料
    if (indexPath.row==0) {
        CustomerInformationViewController *customInfoVC = [[CustomerInformationViewController alloc] init];
        self.mainVC.detailViewControllers=customInfoVC;
    }
    //金融工具箱
    if (indexPath.row==1) {
        FinancialToolBoxViewController *toolBoxVC = [[FinancialToolBoxViewController alloc] init];
        self.mainVC.detailViewControllers=toolBoxVC;
    }
    //产品展示
    if (indexPath.row==2) {
        ProductsShowViewController *productShowVC = [[ProductsShowViewController alloc] init];
        self.mainVC.detailViewControllers=productShowVC;
    }
    
    //产品对比
    if (indexPath.row==3) {
        ProductsContrastViewController *priductsContrastVC =[[ProductsContrastViewController alloc] init];
        self.mainVC.detailViewControllers=priductsContrastVC;
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

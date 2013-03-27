//
//  CustomerListViewController.m
//  FinancialManager
//
//  Created by Zoe on 13-3-27.
//  Copyright (c) 2013年 邹 露. All rights reserved.
//

#import "CustomerListViewController.h"
#import "CustomerInfo.h"

@interface CustomerListViewController ()

@end

@implementation CustomerListViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        self.listArr = [CustomerInfo getCustomerInfoFromDB];
//        NSLog(@"---%@",self.listArr);

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.listArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"CustomCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
    
    CustomerInfo *customerInfo = [self.listArr objectAtIndex:indexPath.row];
    
    NSString *nameStr = NSLocalizedString(@"customName", nil);
    nameStr = [nameStr stringByAppendingString:customerInfo.nameStr];
    cell.textLabel.text = nameStr;
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{



}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{

    NSLog(@"删除");

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

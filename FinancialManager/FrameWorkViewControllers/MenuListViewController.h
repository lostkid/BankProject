//
//  MenuListViewController.h
//  FinancialManager
//
//  Created by Zoe on 13-3-22.
//  Copyright (c) 2013年 邹 露. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
@class CustomerInformationViewController;

@interface MenuListViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>{
   @private
    CustomerInformationViewController *customInfoVC;
}

@property(nonatomic,strong) NSMutableArray *listArr;
@property(nonatomic,weak) MainViewController *mainVC;
@property(nonatomic,weak) CustomerInformationViewController *customerInfoVC;
@end

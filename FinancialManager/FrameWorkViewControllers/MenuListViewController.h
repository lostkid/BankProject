//
//  MenuListViewController.h
//  FinancialManager
//
//  Created by Zoe on 13-3-22.
//  Copyright (c) 2013年 邹 露. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"

@interface MenuListViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) NSMutableArray *listArr;
@property(nonatomic,weak) MainViewController *mainVC;
@end

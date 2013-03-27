//
//  CustomerListViewController.h
//  FinancialManager
//
//  Created by Zoe on 13-3-27.
//  Copyright (c) 2013年 邹 露. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomerListViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>


@property(nonatomic,strong) NSArray *listArr;
@end

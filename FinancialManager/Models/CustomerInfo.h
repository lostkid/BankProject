//
//  CustomerInfo.h
//  FinancialManager
//
//  Created by Zoe on 13-3-26.
//  Copyright (c) 2013年 邹 露. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBConnection.h"

@interface CustomerInfo : NSObject


@property(nonatomic,strong) NSString *nameStr;//姓名
@property(nonatomic,strong) NSString *sexStr;//性别
@property(nonatomic,strong) NSString *ageStr;//年龄
@property(nonatomic,strong) NSString *industryStr;//行业
@property(nonatomic,strong) NSString *incomeStr;//年收入
@property(nonatomic,strong) NSString *areaStr;//地区

- (void)initDB;
+ (NSMutableArray *)getCustomerInfoFromDB;//获得用户信息
-(void)deleteDataFromDB:(NSInteger )_id;//删除用户信息
@end

//
//  CustomerInfo.m
//  FinancialManager
//
//  Created by Zoe on 13-3-26.
//  Copyright (c) 2013年 邹 露. All rights reserved.
//

#import "CustomerInfo.h"

@implementation CustomerInfo

-(id)init{
    if (self =[super init]) {
        
    }
    return self;
}


//获得数据库里的客户信息
- (CustomerInfo *)initWithItem:(Statement *)statement{
    
    CustomerInfo *info = [[CustomerInfo alloc] init];
    info.nameStr = [statement getString:0];
    info.sexStr = [statement getString:1];
    info.ageStr = [statement getString:2];
    info.industryStr = [statement getString:3];
    info.areaStr = [statement getString:4];
    info.incomeStr = [statement getString:5];
    
    return info;
}

//插入数据-->数据库
- (void)initDB{

    static Statement *statement = nil;
    
    if (statement==nil) {
        statement = [DBConnection statementWithQuery:"INSERT INTO CustomerInfoTable (name,sex,age,industry,area,income) VALUES(?,?,?,?,?,?)"];
    }
    
    [statement bindString:_nameStr forIndex:1];
    [statement bindString:_sexStr forIndex:2];
    [statement bindString:_ageStr forIndex:3];
    [statement bindString:_industryStr forIndex:4];
    [statement bindString:_ageStr forIndex:5];
    [statement bindString:_incomeStr forIndex:6];

    int step = [statement step];
    if (step != SQLITE_DONE) {
		NSLog(@"insert customer error! errorcode =%d ",step);
        
    }

    [statement reset];

}



//获取用户信息
- (NSMutableArray *)getCustomerInfoFromDB{
    
    NSMutableArray *mutableArr = [NSMutableArray arrayWithCapacity:6];
    
    static Statement *statement = nil;
    
    if (statement==nil) {
        statement = [DBConnection statementWithQuery:"SELECT * FROM CustomerInfoTable"];
    }
    
    int step = [statement step];
    if (step != SQLITE_DONE) {
		NSLog(@"insert customer error! errorcode =%d ",step);
        CustomerInfo *info = [[CustomerInfo alloc] initWithItem:statement];
        [mutableArr addObject:info];
    }
    
    [statement reset];
    
    return mutableArr;
}


//删除某条数据
-(void)deleteDataFromDB:(NSInteger )_id{

    static Statement *statement = nil;
    
    if (statement==nil) {
        statement = [DBConnection statementWithQuery:"delete from CustomerInfoTable where id = ?"];
    }

    [statement bindInt32:_id forIndex:1];

    int step = [statement step];
    if (step != SQLITE_DONE) {
		NSLog(@"insert customer error! errorcode =%d ",step);
    }
    
    [statement reset];
}


@end

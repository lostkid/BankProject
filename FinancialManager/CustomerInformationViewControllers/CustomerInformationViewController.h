//
//  CustomerInformationViewController.h
//  FinancialManager
//
//  Created by Zoe on 13-3-21.
//  Copyright (c) 2013年 邹 露. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomerInfo.h"

@interface CustomerInformationViewController : UIViewController<UITextFieldDelegate>
{
    @private
    NSInteger tagInt;
    CustomerInfo *customerInfo;
}
+ (CustomerInformationViewController *)instance;

@end

//
//  LoginViewController.h
//  FinancialManager
//
//  Created by Zoe on 13-3-21.
//  Copyright (c) 2013年 邹 露. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface LoginViewController : UIViewController<UITextFieldDelegate,UIGestureRecognizerDelegate>
{
    @private
    UILabel *nameLabel;
    UITextField *textField;
}
@end

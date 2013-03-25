//
//  EnterPasswordViewController.h
//  FinancialManager
//
//  Created by Zoe on 13-3-21.
//  Copyright (c) 2013年 邹 露. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NineGridUnlockView.h"

typedef enum PassWordTime{
	FirstTime,
    SecondTime,
    ThirdTime,
    ForthTime
}PassWordTime;

@interface EnterPasswordViewController : UIViewController<NinGridUnlockViewDelegate>
{
    @private
    NineGridUnlockView *nineLockView;
    UILabel *alertLabel;
    PassWordTime passWordTime;
    NSString *codeStr;

}



@end

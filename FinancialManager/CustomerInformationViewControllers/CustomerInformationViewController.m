//
//  CustomerInformationViewController.m
//  FinancialManager
//
//  Created by Zoe on 13-3-21.
//  Copyright (c) 2013年 邹 露. All rights reserved.
//

#import "CustomerInformationViewController.h"
#define Width 300
#define TopMargin 100
#define Distance 30

#define LABEL_WIDTH 40
#define LABEL_HEIGHT 35

@interface CustomerInformationViewController ()

@end

@implementation CustomerInformationViewController

static CustomerInformationViewController *instance = nil;

+ (CustomerInformationViewController *)instance  {
     static CustomerInformationViewController *instance;
   
     @synchronized(self) {
       if(!instance) {
          instance = [[CustomerInformationViewController alloc] init];
       }
    }
      return instance;
}

- (id)init
{
    self = [super init];
    if (self) {
        instance = self;
    }
    return self;
}

-(UILabel *)createLabel:(NSInteger)y text:(NSString *)text{
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake((self.view.bounds.size.width-Width-SplitWidth)/2, y, LABEL_WIDTH, LABEL_HEIGHT)];
    label.text=text;
    [label sizeToFit];
    [self.view addSubview:label];
    return label;
    
}

- (void)createTextField:(CGRect)rect{
    UITextField *textField = [[UITextField alloc] initWithFrame:rect];
    textField.delegate=self;
    textField.placeholder = NSLocalizedString(@"", nil);
    textField.borderStyle=UITextBorderStyleRoundedRect;
    textField.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
    textField.tag=tagInt;
    [self.view addSubview:textField];
    
    tagInt ++;

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    customerInfo = [[CustomerInfo alloc] init];
    
    //姓名
    UILabel *nameLabel = [self createLabel:TopMargin text:NSLocalizedString(@"customName", nil)];
    
    [self createTextField:CGRectMake(nameLabel.frame.size.width+nameLabel.frame.origin.x+Distance, nameLabel.frame.origin.y,Width-nameLabel.frame.size.width-Distance,LABEL_HEIGHT)];
    
    //性别
    UILabel *sexLabel = [self createLabel:nameLabel.frame.size.height+nameLabel.frame.origin.y+Distance text:NSLocalizedString(@"sex", nil)];
    
    NSArray *sexArr = [[NSArray alloc] initWithObjects:NSLocalizedString(@"male",nil),NSLocalizedString(@"female", nil),nil];
    UISegmentedControl *segmentControl = [[UISegmentedControl alloc] initWithItems:sexArr];
    [segmentControl setFrame:CGRectMake(sexLabel.frame.size.width+sexLabel.frame.origin.x+Distance, sexLabel.frame.origin.y,Width-sexLabel.frame.size.width-Distance,LABEL_HEIGHT)];
    [segmentControl addTarget:self action:@selector(selectButton:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segmentControl];
        
    //年龄
    UILabel *ageLabel = [self createLabel:sexLabel.frame.size.height+sexLabel.frame.origin.y+Distance text:NSLocalizedString(@"age",nil)];

    [self createTextField:CGRectMake(ageLabel.frame.size.width+ageLabel.frame.origin.x+Distance, ageLabel.frame.origin.y,Width-ageLabel.frame.size.width-Distance,LABEL_HEIGHT)];

    //行业
    UILabel *industryLabel = [self createLabel:ageLabel.frame.origin.y+ageLabel.frame.size.height+Distance text:NSLocalizedString(@"industry", nil)];

    [self createTextField:CGRectMake(industryLabel.frame.size.width+industryLabel.frame.origin.x+Distance, industryLabel.frame.origin.y,Width-industryLabel.frame.size.width-Distance,LABEL_HEIGHT)];
    
    //年收入
    UILabel *incomeLabel = [self createLabel:industryLabel.frame.size.height+industryLabel.frame.origin.y+Distance text:NSLocalizedString(@"income", nil)];
    
    [self createTextField:CGRectMake(incomeLabel.frame.size.width+incomeLabel.frame.origin.x+Distance, incomeLabel.frame.origin.y,Width-incomeLabel.frame.size.width-Distance,LABEL_HEIGHT)];
    
    //地区
    UILabel *areaLabel = [self createLabel:incomeLabel.frame.size.height+incomeLabel.frame.origin.y+Distance text:NSLocalizedString(@"area", nil)];
    
    [self createTextField:CGRectMake(areaLabel.frame.size.width+areaLabel.frame.origin.x+Distance, areaLabel.frame.origin.y,Width-areaLabel.frame.size.width-Distance,LABEL_HEIGHT)];
    
    //保存按钮
    UIButton *saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [saveBtn setFrame:CGRectMake((568-50)/2, areaLabel.frame.size.height+areaLabel.frame.origin.y+Distance, 50, 30)];
    [saveBtn setTitle:NSLocalizedString(@"save", nil) forState:UIControlStateNormal];
    [saveBtn addTarget:self action:@selector(saveClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:saveBtn];
    
}

#pragma mark--
#pragma mark--action_method
//SegmentedControl_Method
-(void)selectButton:(id)sender{
    UISegmentedControl *segmentedControl = (UISegmentedControl *)sender;
    if (segmentedControl.selectedSegmentIndex==0)
        NSLog(@"男");
    else
        NSLog(@"女");
    
    
    
}

//UIButton_Method
- (void)saveClick:(id)sender{
    NSLog(@"保存");
    
    //将一条客户信息插入数据库
    [customerInfo initDB];
}


#pragma mark--
#pragma mark--TextFieldDelegate
- (void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField.tag==0) {
        customerInfo.nameStr = textField.text;
    }
    if (textField.tag==1) {
        customerInfo.ageStr = textField.text;
    }
    if (textField.tag==2) {
        customerInfo.industryStr = textField.text;
    }
    if (textField.tag==3) {
        customerInfo.incomeStr = textField.text;
    }
    if (textField.tag==4) {
        customerInfo.areaStr = textField.text;
    }
    
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{


    return YES;
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

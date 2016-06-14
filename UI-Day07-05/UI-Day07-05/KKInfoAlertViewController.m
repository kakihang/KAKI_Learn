//
//  KKInfoAlertViewController.m
//  UI-Day07-05
//
//  Created by kaki on 16/6/7.
//  Copyright © 2016年 刘端杭. All rights reserved.
//

#import "KKInfoAlertViewController.h"
#import "KKPersonInfo.h"

@interface KKInfoAlertViewController ()
/** 密码 **/
@property (nonatomic, strong) UITextField *pwdTextField;
@end

@implementation KKInfoAlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor yellowColor];
    self.navigationItem.title = @"修改个人信息";
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(ViewCenterX -75, ViewCenterY-20-30, 150, 30)];
    [label setText:self.info.name];
    [self.view addSubview:label];
    
    self.pwdTextField = [UITextField KK_setText:nil frame:CGRectMake(ViewCenterX-75, ViewCenterY, 150, 30) backgroundColor:TextFieldColor placeholder:@"输入新密码"];
    [self.view addSubview:self.pwdTextField];
    
    [self.view addSubview:[UIButton KKSetButtonTitle:@"确认修改" showTouch:YES cornerRadius:15 frame:CGRectMake(ViewCenterX-50, ViewCenterY+30+20, 100, 30) addTarget:self action:@selector(changeInfo)]];
}

- (void)changeInfo {
    self.info.password = self.pwdTextField.text;
    [self.navigationController popToRootViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

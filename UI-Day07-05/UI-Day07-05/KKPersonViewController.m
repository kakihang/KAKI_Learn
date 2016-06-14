//
//  KKPersonViewController.m
//  UI-Day07-05
//
//  Created by kaki on 16/6/7.
//  Copyright © 2016年 刘端杭. All rights reserved.
//

#import <objc/runtime.h>
#import "KKPersonViewController.h"
#import "KKInfoAlertViewController.h"
#import "KKPersonInfo.h"

@interface KKPersonViewController ()
/** UILabel数组 **/
@property (nonatomic, strong) NSMutableArray <UILabel*> *labelArray;
/** Button数组 **/
@property (nonatomic, strong) NSMutableArray <UIButton*> *buttonArray;
/** 信息列表 **/
@property (nonatomic, strong) NSArray *infoArray;
/** 信息参数列表 **/
@property (nonatomic, strong) NSArray *paramsArray;
@end

@implementation KKPersonViewController

- (NSMutableArray<UILabel *> *)labelArray {
    if (!_labelArray) {
        _labelArray = [NSMutableArray array];
    }
    return _labelArray;
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"修改后:%@ %@", self.info.phone, self.info.email);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor yellowColor];
    self.navigationItem.title = @"个人信息";

    self.infoArray = @[KK_ACCOUNT, KK_PHONE, KK_EMAIL];
    self.paramsArray = @[self.info.name, self.info.phone, self.info.email];
    
    CGFloat beginX = ViewCenterX - (TextFieldNormalWidth + LabelNormalWidth*2) / 2;
    CGFloat beginY = ViewCenterY - (self.infoArray.count * (TextFieldNormalHeight + LabelInterval) + ButtonNormalHeight) / 2;
    
    
    for (NSInteger i=0; i<self.infoArray.count; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(beginX, beginY, LabelNormalWidth+TextFieldNormalWidth, LabelNormalHeight)];
        label.textAlignment = NSTextAlignmentLeft;
        label.text = [NSString stringWithFormat:@"%@: %@", self.infoArray[i], self.paramsArray[i]];
        [self.view addSubview:label];
        [self.labelArray addObject:label];

        if (0 != i) {
            UIButton *button = [UIButton KKSetButtonTitleBase:@"修改" cornerRadius:5 frame:CGRectMake(beginX+LabelNormalWidth+TextFieldNormalWidth+10, beginY, 50, ButtonNormalHeight)];

            objc_setAssociatedObject(button, @"index", [NSString stringWithFormat:@"%zd", i], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            [button addTarget:self action:@selector(changePersonMessage:) forControlEvents:(UIControlEventTouchUpInside)];
            [self.view addSubview:button];
        }
        
        beginY += LabelInterval + TextFieldNormalHeight;
    }
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:(UIBarButtonItemStyleDone) target:self action:@selector(back)];
    self.navigationItem.rightBarButtonItem = item;
}

- (void)changePersonMessage:(UIButton *)button  {
    NSInteger index = [objc_getAssociatedObject(button, @"index") integerValue];
    
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:self.infoArray[index] preferredStyle:(UIAlertControllerStyleAlert)];
    
    UIAlertAction *actionChange = [UIAlertAction actionWithTitle:@"保存" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        if ([self.infoArray[index] isEqualToString:KK_PHONE]) {
            self.info.phone = alert.textFields[0].text;
            self.labelArray[index].text = [NSString stringWithFormat:@"%@: %@", self.infoArray[index], self.info.phone];
        } else if ([self.infoArray[index] isEqualToString:KK_EMAIL]){
            self.info.email = alert.textFields[0].text;
            self.labelArray[index].text = [NSString stringWithFormat:@"%@: %@", self.infoArray[index], self.info.email];
        }
    }];
    
    UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:nil];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        if ([self.infoArray[index] isEqualToString:KK_PHONE]) {
            textField.text = self.info.phone;
        } else if ([self.infoArray[index] isEqualToString:KK_EMAIL]){
            textField.text = self.info.email;
        }
    }];
    
    
    [alert addAction:actionChange];
    [alert addAction:actionCancel];
    [self presentViewController:alert animated:YES completion:nil];
}


- (void)back {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

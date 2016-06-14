//
//  KKRegisterViewController.m
//  UI-Day07-05
//
//  Created by kaki on 16/6/7.
//  Copyright © 2016年 刘端杭. All rights reserved.
//

#import "KKRegisterViewController.h"
#import "KKPersonInfo.h"

@interface KKRegisterViewController ()
/** TextField数组 **/
@property (nonatomic, strong) NSMutableArray <UITextField*> *textFieldArray;
/** 信息列表 **/
@property (nonatomic, strong) NSArray *infoArray;
@end

@implementation KKRegisterViewController

- (NSMutableArray<UITextField *> *)textFieldArray {
    if (!_textFieldArray) {
        _textFieldArray = [NSMutableArray array];
    }
    return _textFieldArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%s", __func__);
    [self setupParams];
}

- (void)setupParams {
    
    [self.navigationItem setTitle:@"注册"];
    self.view.backgroundColor = [UIColor greenColor];
    
    UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:(UIBarButtonItemStyleDone) target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem = cancelItem;
    
    self.infoArray = @[KK_ACCOUNT, KK_PASSWORD, KK_PHONE, KK_EMAIL];
    CGFloat beginX = ViewCenterX - (TextFieldNormalWidth + LabelNormalWidth) / 2;
    CGFloat beginY = ViewCenterY - (self.infoArray.count * (TextFieldNormalHeight + LabelInterval) + ButtonNormalHeight) / 2;


    for (int i=0; i<self.infoArray.count; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(beginX, beginY, LabelNormalWidth, LabelNormalHeight)];
        label.text = [NSString stringWithFormat:@"%@:", self.infoArray[i]];
        label.textAlignment = NSTextAlignmentLeft;
        [self.view addSubview:label];
        
        UITextField *textField = [UITextField KK_setText:nil frame:CGRectMake(beginX + LabelNormalWidth, beginY, TextFieldNormalWidth, TextFieldNormalHeight) backgroundColor:TextFieldColor placeholder:[NSString stringWithFormat:@"请输入%@", self.infoArray[i]]];
        [self.view addSubview:textField];
        if ([self.infoArray[i] isEqualToString:KK_PASSWORD]) {
            textField.secureTextEntry = YES;
        }
        
        beginY += LabelInterval + TextFieldNormalHeight;
        [self.textFieldArray addObject:textField];
    }

    [self.view addSubview:[UIButton KKSetButtonTitle:@"注册" showTouch:YES cornerRadius:5 frame:CGRectMake(beginX + LabelNormalWidth,  beginY, ButtonNormalWidth, ButtonNormalHeight) addTarget:self action:@selector(clickRegister)]];
}

- (void)back {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)clickRegister {

    NSString *name = self.textFieldArray[[self.infoArray indexOfObject:KK_ACCOUNT]].text;
    NSString *pwd = self.textFieldArray[[self.infoArray indexOfObject:KK_PASSWORD]].text;
    

    NSString *outputMessage = nil;
    UIAlertAction *action = nil;
    
    if (name.length == 0 || pwd.length == 0) {
        outputMessage = @"输入账号或密码为空";
        action = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:nil];
    } else {
        outputMessage = @"注册成功";
        action = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
            self.info.name = name;
            self.info.password = pwd;
            self.info.phone = self.textFieldArray[[self.infoArray indexOfObject:KK_PHONE]].text;
            self.info.email = self.textFieldArray[[self.infoArray indexOfObject:KK_EMAIL]].text;
            [self back];
        }];
    }
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"注册" message:outputMessage preferredStyle:(UIAlertControllerStyleAlert)];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

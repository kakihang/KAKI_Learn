//
//  KKLoginViewController.m
//  UI-Day07-05
//
//  Created by kaki on 16/6/7.
//  Copyright © 2016年 刘端杭. All rights reserved.
//

#import "KKLoginViewController.h"
#import "KKPersonInfo.h"
#import "KKNewsViewController.h"
#import "KKRegisterViewController.h"

@interface KKLoginViewController ()
/** 用户 **/
@property (nonatomic, strong) UITextField *nameTextField;
/** 密码 **/
@property (nonatomic, strong) UITextField *pwdTextField;
@end

@implementation KKLoginViewController

- (void)viewDidLoad {
    NSLog(@"%s", __func__);
    [super viewDidLoad];
    
    [self.navigationItem setTitle:@"登录"];
    
    [self.view setBackgroundColor:[UIColor redColor]];
    [self setupParams];
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"%s", __func__);
    NSLog(@"注册后:%@ %@", self.info.name, self.info.password);
    self.nameTextField.text = self.info.name;
}

- (void)setupParams {
    
    KKPersonInfo *info = [[KKPersonInfo alloc] init];
    self.info = info;

    UIImageView *imageView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"1bbefae9750d8f55bee4535440eeb676"] KK_scaleToSize:CGSizeMake(200, 200) proportion:KK_scaleToSizeProporsionTypeToMax]];
    
    imageView.contentMode = UIViewContentModeLeft;
    imageView.clipsToBounds = YES;
    imageView.frame = CGRectMake(ViewCenterX - 100, ViewCenterY - 200, 200, 200);
    [self.view addSubview:imageView];

    CGFloat beginX = ViewCenterX - (TextFieldNormalWidth + LabelNormalWidth) / 2;
    CGFloat beginY = ViewCenterY + LabelInterval;
    
    for (int i=0; i<2; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(beginX, beginY, LabelNormalWidth, LabelNormalHeight)];
        label.textAlignment = NSTextAlignmentLeft;
        [self.view addSubview:label];
        
        UITextField *textField = [UITextField KK_setText:nil frame:CGRectMake(beginX + LabelNormalWidth, beginY, TextFieldNormalWidth, TextFieldNormalHeight) backgroundColor:TextFieldColor placeholder:nil];
        [self.view addSubview:textField];
        
        if (0 == i) {
            label.text = @"账号:";
            textField.placeholder = @"请输入账号";
            self.nameTextField = textField;
        } else {
            label.text = @"密码:";
            textField.placeholder = @"请输入密码";
            textField.secureTextEntry = YES;
            self.pwdTextField = textField;
        }
        beginY += LabelInterval + TextFieldNormalHeight;
    }
    
    [self.view addSubview:[UIButton KKSetButtonTitle:@"登录" showTouch:YES cornerRadius:10 frame:CGRectMake(beginX + LabelNormalWidth,  beginY, ButtonNormalWidth, ButtonNormalHeight) addTarget:self action:@selector(login)]];
    
    [self.view addSubview:[UIButton KKSetButtonTitle:@"注册" showTouch:NO cornerRadius:5 frame:CGRectMake(20, self.view.KK_height - 40, 40, 20) addTarget:self action:@selector(goRegister)]];
}

- (void)login {
#if KK_DEBUG
    NSString *name = self.nameTextField.text;
    NSString *pwd = self.pwdTextField.text;
    
    NSString *outputMessage = nil;
    UIAlertAction *action = nil;
    
    if (name.length == 0 || pwd.length == 0) {
        outputMessage = @"输入账号或密码为空";
        action = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:nil];
    } else if (![name isEqualToString:self.info.name] || ![pwd isEqualToString:self.info.password]) {
        outputMessage = @"账号或密码错误";
        action = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:nil];
    } else {
        outputMessage = @"登录成功";
        action = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
#endif
            KKNewsViewController *news = [[KKNewsViewController alloc] init];
            news.info = self.info;
            NSLog(@"news.info:%@ %@", news.info.name, news.info.password);
            [self presentViewController:[[UINavigationController alloc] initWithRootViewController:news] animated:YES completion:nil];
#if KK_DEBUG
        }];
    }
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"注册" message:outputMessage preferredStyle:(UIAlertControllerStyleAlert)];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
#endif
}

- (void)goRegister{
    self.info.name = self.nameTextField.text;
    self.info.password = self.pwdTextField.text;
    KKRegisterViewController *reg = [[KKRegisterViewController alloc] init];
    reg.info = self.info;
    [self presentViewController:[[UINavigationController alloc] initWithRootViewController:reg] animated:YES completion:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

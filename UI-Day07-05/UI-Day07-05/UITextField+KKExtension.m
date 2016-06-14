//
//  UITextField+KKExtension.m
//  UI-Day07-05
//
//  Created by kaki on 16/6/7.
//  Copyright © 2016年 刘端杭. All rights reserved.
//

#import "UITextField+KKExtension.h"

@implementation UITextField (KKExtension)

+ (UITextField *)KK_setText:(NSString *)text frame:(CGRect)frame backgroundColor:(UIColor *)color placeholder:(NSString *)placeholder cornerRadius:(CGFloat)corner {
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    [textField setBackgroundColor:color];
    [textField setText:text];
    textField.placeholder = placeholder;
    textField.layer.cornerRadius = corner;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    return textField;
}

+ (UITextField *)KK_setText:(NSString *)text frame:(CGRect)frame backgroundColor:(UIColor *)color placeholder:(NSString *)placeholder {

    return [self KK_setText:text frame:frame backgroundColor:color placeholder:placeholder cornerRadius:5.0];
}

@end

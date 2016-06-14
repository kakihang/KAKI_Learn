//
//  UITextField+KKExtension.h
//  UI-Day07-05
//
//  Created by kaki on 16/6/7.
//  Copyright © 2016年 刘端杭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (KKExtension)

+ (UITextField *)KK_setText:(NSString *)text frame:(CGRect)frame backgroundColor:(UIColor *)color placeholder:(NSString *)placeholder cornerRadius:(CGFloat)corner ;

+ (UITextField *)KK_setText:(NSString *)text frame:(CGRect)frame backgroundColor:(UIColor *)color placeholder:(NSString *)placeholder;

@end

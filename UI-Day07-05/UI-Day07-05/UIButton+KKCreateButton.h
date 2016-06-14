//
//  UIButton+KKCreateButton.h
//  UI-Day07-05
//
//  Created by kaki on 16/6/7.
//  Copyright © 2016年 刘端杭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (KKCreateButton)

+ (UIButton *)KKSetButtonTitleBase:(NSString *)title cornerRadius:(NSInteger)corner frame:(CGRect)frame;
+ (UIButton *)KKSetButtonTitle:(NSString *)title showTouch:(BOOL)touchWhenHighlighted cornerRadius:(NSInteger)corner frame:(CGRect)frame addTarget:(id)target action:(SEL)selector;

@end

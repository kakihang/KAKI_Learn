//
//  UIButton+KKCreateButton.m
//  UI-Day07-05
//
//  Created by kaki on 16/6/7.
//  Copyright © 2016年 刘端杭. All rights reserved.
//

#import "UIButton+KKCreateButton.h"

@implementation UIButton (KKCreateButton)

+ (UIButton *)KKSetButtonTitleBase:(NSString *)title cornerRadius:(NSInteger)corner frame:(CGRect)frame {
    UIButton *button = [[UIButton alloc] initWithFrame:frame];
    [button setTitle:title forState:(UIControlStateNormal)];
    [button setBackgroundColor:[[UIColor alloc] initWithWhite:1.0 alpha:0.8]];
    [button setTitleColor:[[UIColor alloc] initWithWhite:0.1 alpha:0.9] forState:(UIControlStateNormal)];
    [button setTitleColor:[[UIColor alloc] initWithWhite:0.3 alpha:0.9] forState:(UIControlStateHighlighted)];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    button.layer.cornerRadius = corner;
    return button;
}

+ (UIButton *)KKSetButtonTitle:(NSString *)title showTouch:(BOOL)touchWhenHighlighted cornerRadius:(NSInteger)corner frame:(CGRect)frame addTarget:(id)target action:(SEL)selector {
    UIButton *button = [UIButton KKSetButtonTitleBase:title cornerRadius:corner frame:frame];
    button.showsTouchWhenHighlighted = touchWhenHighlighted;
    [button addTarget:target action:selector forControlEvents:(UIControlEventTouchUpInside)];
    return button;
}



@end

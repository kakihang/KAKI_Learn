//
//  UIImage+KKExtension.m
//  UI-Day07-05
//
//  Created by kaki on 16/6/9.
//  Copyright © 2016年 刘端杭. All rights reserved.
//

#import "UIImage+KKExtension.h"

@implementation UIImage (KKExtension)

- (UIImage*)KK_scaleToSize:(CGSize)size proportion:(KK_scaleToSizeProporsionType)proportion
{
    if (![self isKindOfClass:[UIImage class]]) {
        return (id)self;
    }
    
    UIImage *image = (UIImage *)self;
    CGSize trueSize = size;
    
    if (proportion != KK_scaleToSizeProporsionTypeDefault) { // 计算缩放结果
        CGFloat toWidht = size.width;
        CGFloat toHeight = size.height;
        CGFloat fromWidht = image.size.width;
        CGFloat fromHeight = image.size.height;
        
        CGFloat widhtPre = toWidht / fromWidht;
        CGFloat heightPre = toHeight / fromHeight;
        CGFloat truePre;
        if (proportion == KK_scaleToSizeProporsionTypeToMin) {
            truePre = widhtPre < heightPre ? widhtPre : heightPre;
        } else {
            truePre = widhtPre > heightPre ? widhtPre : heightPre;
        }
        
        
        trueSize.width = fromWidht * truePre;
        trueSize.height = fromHeight * truePre;
    }
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    //Determine whether the screen is retina
    if([[UIScreen mainScreen] scale] == 2.0){
        UIGraphicsBeginImageContextWithOptions(trueSize, NO, 2.0);
    }else{
        UIGraphicsBeginImageContext(trueSize);
    }
    
    // 绘制改变大小的图片
    [image drawInRect:CGRectMake(0, 0, trueSize.width, trueSize.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return scaledImage;
}

@end

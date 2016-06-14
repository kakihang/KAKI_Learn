//
//  UIImage+KKExtension.h
//  UI-Day07-05
//
//  Created by kaki on 16/6/9.
//  Copyright © 2016年 刘端杭. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIImage (KKExtension)

typedef NS_ENUM(NSInteger, KK_scaleToSizeProporsionType) {
    KK_scaleToSizeProporsionTypeDefault = 0,
    KK_scaleToSizeProporsionTypeToMin,
    KK_scaleToSizeProporsionTypeToMax
};
- (UIImage*)KK_scaleToSize:(CGSize)size proportion:(KK_scaleToSizeProporsionType)proportion;
@end

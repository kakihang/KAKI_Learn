//
//  UIView+KKExtension.m
//  UI-Day07-05
//
//  Created by kaki on 16/6/7.
//  Copyright © 2016年 刘端杭. All rights reserved.
//

#import "UIView+KKExtension.h"

@implementation UIView (KKExtension)
- (void)setKK_x:(CGFloat)KK_x {
    CGRect frame = self.frame;
    frame.origin.x = KK_x;
    self.frame = frame;
}

- (void)setKK_y:(CGFloat)KK_y {
    CGRect frame = self.frame;
    frame.origin.y = KK_y;
    self.frame = frame;
}

- (void)setKK_width:(CGFloat)KK_width {
    CGRect frame = self.frame;
    frame.size.width = KK_width;
    self.frame = frame;
}

- (void)setKK_height:(CGFloat)KK_height {
    CGRect frame = self.frame;
    frame.size.height = KK_height;
    self.frame = frame;
}

- (CGFloat)KK_x {
    return self.frame.origin.x;
}

- (CGFloat)KK_y {
    return self.frame.origin.y;
}

- (CGFloat)KK_width {
    return self.frame.size.width;
}

- (CGFloat)KK_height {
    return self.frame.size.height;
}
@end

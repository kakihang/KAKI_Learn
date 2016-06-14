//
//  KKPersonInfo.h
//  UI-Day07-05
//
//  Created by kaki on 16/6/7.
//  Copyright © 2016年 刘端杭. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KKPersonInfo : NSObject

/** 用户名 **/
@property (nonatomic, strong) NSString *name;
/** 密码 **/
@property (nonatomic, strong) NSString *password;
/** 电话 **/
@property (nonatomic, strong) NSString *phone;
/** 邮箱地址 **/
@property (nonatomic, strong) NSString *email;

@end

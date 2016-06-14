//
//  KKPersonInfo.m
//  UI-Day07-05
//
//  Created by kaki on 16/6/7.
//  Copyright © 2016年 刘端杭. All rights reserved.
//

#import "KKPersonInfo.h"

@implementation KKPersonInfo
- (NSString *)name {
    if (!_name) {
        _name = [NSString string];
    }
    return _name;
}

- (NSString *)password {
    if (!_password) {
        _password = [NSString string];
    }
    return _password;
}

- (NSString *)phone {
    if (!_phone) {
        _phone = [NSString string];
    }
    return _phone;
}

- (NSString *)email {
    if (!_email) {
        _email = [NSString string];
    }
    return _email;
}
@end

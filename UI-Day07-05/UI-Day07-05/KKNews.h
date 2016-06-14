//
//  KKNews.h
//  UI-Day07-05
//
//  Created by kaki on 16/6/13.
//  Copyright © 2016年 刘端杭. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KKNews : NSObject

/** iamge **/
@property (nonatomic, strong) NSString *newsImageName;
/** title **/
@property (nonatomic, strong) NSString *title;
/** comment **/
@property (nonatomic, strong) NSString *commentCount;

/** 列表 **/
@property (nonatomic, strong) NSArray *newsList;
/** 信息数组 **/
@property (nonatomic, strong) NSArray *newsInfo;



- (NSArray *)getListArray;
- (NSArray *)getInfoArray:(NSInteger)index;


@end

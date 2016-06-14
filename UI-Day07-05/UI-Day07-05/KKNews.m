//
//  KKNews.m
//  UI-Day07-05
//
//  Created by kaki on 16/6/13.
//  Copyright © 2016年 刘端杭. All rights reserved.
//

#import "KKNews.h"

@implementation KKNews

- (void)setArray {
    NSMutableArray *listArray = [NSMutableArray array];
    NSMutableArray *infoArray = [NSMutableArray array];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"news" ofType:@"plist"];
    NSArray *plistArray = [NSArray arrayWithContentsOfFile:path];
    
    for (NSDictionary *dict in plistArray) {
        [listArray addObject:[dict valueForKey:@"themeName"]];
        
        NSMutableArray *conArr = [NSMutableArray array];
        NSArray *arr = [dict valueForKey:@"newsList"];
        for (NSDictionary *content in arr) {
            KKNews *new = [[KKNews alloc] init];
            [new setValuesForKeysWithDictionary:content];
            [conArr addObject:new];
        }
        [infoArray addObject:conArr];
    }
    self.newsList = listArray;
    self.newsInfo = infoArray;
}

- (NSArray *)getListArray {
    if (!self.newsList) {
        [self setArray];
    }
    return self.newsList;
}

- (NSArray *)getInfoArray:(NSInteger)index {
    if (!self.newsInfo) {
        [self setArray];
    }
    if (index > self.newsInfo.count) {
        return nil;
    }
    NSLog(@"数组 %zd %@", index, self.newsInfo[index]);
    return self.newsInfo[index];
}



@end

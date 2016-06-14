//
//  KKNewsListViewController.h
//  UI-Day07-05
//
//  Created by kaki on 16/6/7.
//  Copyright © 2016年 刘端杭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KKNewsListViewController : UITableViewController

/** 标题 **/
@property (nonatomic, strong) NSString *newsTitle;
/** 新闻ID **/
@property (nonatomic, assign) NSInteger newsID;

@end

//
//  KKNewsListViewController.m
//  UI-Day07-05
//
//  Created by kaki on 16/6/7.
//  Copyright © 2016年 刘端杭. All rights reserved.
//

#import "KKNewsListViewController.h"
#import "KKNewsTableViewCell.h"
#import "KKNews.h"

@interface KKNewsListViewController ()

/** 新闻列表 **/
@property (nonatomic, strong) NSArray *titles;

@end

@implementation KKNewsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNav];
    [self setupTableView];
}

- (void)setupNav {
    self.view.backgroundColor = [UIColor grayColor];
    [self.navigationItem setTitle:self.newsTitle];
}

- (void)setupTableView {
    self.tableView.separatorStyle = NO;
    self.tableView.rowHeight = 250;

    KKNews *newsInfo = [[KKNews alloc] init];
    self.titles = [newsInfo getInfoArray:self.newsID];
    NSLog(@"titles:%@", self.titles);
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"%s %zd", __func__, self.titles.count);
    return self.titles.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __func__);
    
    static NSString *ID = @"cell";
    KKNewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([KKNewsTableViewCell class]) owner:nil options:nil]lastObject];
    }
    NSLog(@"%@", self.titles[indexPath.row]);
    
    cell.news = self.titles[indexPath.row];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

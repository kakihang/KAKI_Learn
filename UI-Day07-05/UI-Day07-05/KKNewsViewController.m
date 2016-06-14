//
//  KKNewsViewController.m
//  UI-Day07-05
//
//  Created by kaki on 16/6/7.
//  Copyright © 2016年 刘端杭. All rights reserved.
//

#import "KKNewsViewController.h"
#import "KKNewsListViewController.h"
#import "KKPersonViewController.h"
#import "KKPersonInfo.h"
#import "KKNews.h"

@interface KKNewsViewController ()
/** 标题 **/
@property (nonatomic, strong) NSMutableArray *titles;
@end

@implementation KKNewsViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNav];
    
    [self setPersonBarButton];
    
    [self setNewsTitle];
}

- (void)setNav {
    self.view.backgroundColor = [UIColor grayColor];
    [self.navigationItem setTitle:@"新闻"];
    
}

- (void)setPersonBarButton {
    self.navigationItem.rightBarButtonItem  = [[UIBarButtonItem alloc] initWithTitle:@"个人信息" style:(UIBarButtonItemStyleDone) target:self action:@selector(changeInfo)];

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:(UIBarButtonItemStylePlain) target:self action:@selector(edit:)];
    
}

- (void)setNewsTitle {
    KKNews *news = [[KKNews alloc] init];
    //self.titles = @[@"苍老师", @"波多野结衣", @"杏田"];
    self.titles = [[news getListArray] mutableCopy];
    NSLog(@"数组:%@", self.titles);
    self.tableView.separatorStyle = NO;
    //self.tableView.rowHeight = 70;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"--height--%s", __func__);
    return 70;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"--cell--%s", __func__);
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:
                 (UITableViewCellStyleSubtitle) reuseIdentifier:ID];
    }
    
    cell.textLabel.text = self.titles[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"选中了 %@", self.titles[indexPath.row]);
    [self gotoNewList:indexPath.row];
}

- (void)changeInfo {
    KKPersonViewController *person = [[KKPersonViewController alloc] init];
    person.info = self.info;
    [self presentViewController:[[UINavigationController alloc] initWithRootViewController:person] animated:YES completion:nil];
}

- (void)edit:(UIBarButtonItem *)item {
    self.tableView.editing =  !self.tableView.editing;
    item.title = self.tableView.editing ? @"完成" : @"编辑";
}

- (void)gotoNewList:(NSInteger)ID {
    KKNewsListViewController *list = [[KKNewsListViewController alloc] init];
    list.newsTitle = self.titles[ID];
    list.newsID = ID;
    [self.navigationController pushViewController:list animated:YES];
}


- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    id tmp = self.titles[sourceIndexPath.row];
    [self.titles removeObjectAtIndex:sourceIndexPath.row];
    [self.titles insertObject:tmp atIndex:destinationIndexPath.row];
    [self.tableView reloadData];
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete && [self.titles objectAtIndex:indexPath.row]) {
        [self.titles removeObjectAtIndex:indexPath.row];
        // 使用局部刷新
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:(UITableViewRowAnimationBottom)];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

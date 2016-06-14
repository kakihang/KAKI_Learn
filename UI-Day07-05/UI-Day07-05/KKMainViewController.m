//
//  KKMainViewController.m
//  UI-Day07-05
//
//  Created by kaki on 16/6/7.
//  Copyright © 2016年 刘端杭. All rights reserved.
//

#import "KKMainViewController.h"
#import "KKLoginViewController.h"

@interface KKMainViewController () <UIScrollViewDelegate>

/** scrollView **/
@property (nonatomic, strong) UIScrollView *scrollView;
/** login button **/
@property (nonatomic, strong) UIButton *loginButton;

/** 滚动控制 **/
@property (nonatomic, strong) UIPageControl *pageControl;

@end

@implementation KKMainViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[[UIColor alloc] initWithWhite:0.9 alpha:0.9]];
    
    
    [self createButton];
    [self configScrollView];
}

- (void)configScrollView {
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    scrollView.contentSize = CGSizeMake(self.view.KK_width * 4, self.view.KK_height);
    // 设置整页滑动
    scrollView.pagingEnabled = YES;
    // 关闭弹性效果
    scrollView.bounces = NO;
    // 去掉底部的滚动条
    scrollView.showsHorizontalScrollIndicator = NO;
    // 去掉 垂直滚动条
    scrollView.showsVerticalScrollIndicator = NO;
    // 代理
    scrollView.delegate = self;
    
    [self.view addSubview:scrollView];
    
    self.scrollView = scrollView;
    
    
    
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, ViewCenterY+200, self.view.KK_width, 30)];
    // 页数
    self.pageControl.numberOfPages = 4;
    // 背景颜色
    self.pageControl.backgroundColor = [[UIColor alloc] initWithWhite:0.6 alpha:0.5];
    // 当前页颜色
    self.pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    // 非当前页颜色
    self.pageControl.pageIndicatorTintColor = [UIColor blackColor];
    // 圆角
    self.pageControl.layer.cornerRadius = 0;
    
    [self.view addSubview:self.pageControl];
    
    
    // 设置scrollView的内容
    NSArray *images = @[@"47aeduh6r", @"05YA2TMG3J9Y", @"large_dYJw_5cbb000001c8125f", @"W020131211266506816695"];
    
    for (int i=0; i<images.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:images[i]] KK_scaleToSize:CGSizeMake(self.view.KK_width, self.view.KK_height-20) proportion:KK_scaleToSizeProporsionTypeToMax]];
        imageView.frame = CGRectMake(self.view.KK_width * i, 20, self.view.KK_width, self.view.KK_height-20);
        imageView.clipsToBounds = YES;
        imageView.contentMode = UIViewContentModeCenter;
        
        [self.scrollView addSubview:imageView];
        
        if (i == images.count - 1) {
            imageView.userInteractionEnabled = YES;
            [imageView addSubview:self.loginButton];
        }
    }
}

- (void)createButton {
    self.loginButton = [UIButton KKSetButtonTitle:@"进入AV世界" showTouch:YES cornerRadius:10 frame:CGRectMake((self.view.KK_width - 100) * 0.5, self.view.KK_height * 0.5, 100, 30) addTarget:self action:@selector(login)];
}

- (void)login {
    [self presentViewController:[[UINavigationController alloc] initWithRootViewController:[[KKLoginViewController alloc] init]] animated:YES completion:nil];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // NSInteger index = self.scrollView.contentOffset.x / self.view.KK_width;
    NSInteger index = self.scrollView.contentOffset.x / self.view.KK_width + 0.5;
    self.pageControl.currentPage = index;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"%s", __func__);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end

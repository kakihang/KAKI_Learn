//
//  KKNewsTableViewCell.m
//  UI-Day07-05
//
//  Created by kaki on 16/6/13.
//  Copyright © 2016年 刘端杭. All rights reserved.
//

#import "KKNewsTableViewCell.h"
#import "KKNews.h"

@interface KKNewsTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *newsImage;
@property (weak, nonatomic) IBOutlet UILabel *newsTitle;
@property (weak, nonatomic) IBOutlet UILabel *conmmentCount;

@end


@implementation KKNewsTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setNews:(KKNews *)news {
    _news = news;
    NSLog(@"%s", __func__);
    NSLog(@"%@", news.newsImageName);
    NSLog(@"%@", news.title);
    NSLog(@"%@", news.commentCount);
    NSLog(@"%@", NSStringFromCGSize(self.newsImage.frame.size));
    UIImage *image = [[UIImage imageNamed:news.newsImageName] KK_scaleToSize:self.newsImage.frame.size proportion:(KK_scaleToSizeProporsionTypeToMax)];
    self.newsImage.image = image;
    self.newsImage.clipsToBounds = YES;
    self.newsImage.contentMode = UIViewContentModeCenter;
    NSLog(@"%@", NSStringFromCGSize(image.size));
    self.newsTitle.text = news.title;
    self.conmmentCount.text = [NSString stringWithFormat:@"%@ 已阅", news.commentCount];
}

@end

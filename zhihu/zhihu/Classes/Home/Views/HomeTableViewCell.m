//
//  HomeTableViewCell.m
//  zhihu
//
//  Created by lgh on 16/9/10.
//  Copyright © 2016年 lgh. All rights reserved.
//

#import "HomeTableViewCell.h"
#import "HomeModel.h"
#import <UIImageView+WebCache.h>
#import <Masonry.h>

@interface HomeTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *myTextLabel;

@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;

/** 背景view*/
@property (nonatomic, weak) UIView *bgView;


@end

@implementation HomeTableViewCell

+ (NSString *)cellIdentify
{
    return NSStringFromClass(self);
}

- (void)setModel:(storyModel *)model
{
    _model = model;
    self.myTextLabel.text = model.title;
    [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:model.images[0]]];
}

- (void)awakeFromNib {
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    UIView *view = [[UIView alloc] init];
//    view.backgroundColor = [UIColor redColor];
    view.layer.shadowOffset = CGSizeMake(1, 1);
    view.layer.shadowOpacity = 0.3;
    view.layer.shadowColor = [UIColor blackColor].CGColor;
    view.backgroundColor = [UIColor whiteColor];
    [self.contentView insertSubview:view atIndex:0];
    self.bgView = view;
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self.contentView.mas_left).equalTo(@5);
        make.top.equalTo(self.contentView.mas_top).equalTo(@2);
        make.right.equalTo(self.contentView.mas_right).equalTo(@-2);
        make.bottom.equalTo(self.contentView.mas_bottom).equalTo(@-5);
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
    if (selected) {
        self.bgView.backgroundColor = [UIColor lightGrayColor];
    }else{
        self.bgView.backgroundColor = [UIColor whiteColor];
    }
    
}

@end












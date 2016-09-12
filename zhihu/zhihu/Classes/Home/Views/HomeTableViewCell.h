//
//  HomeTableViewCell.h
//  zhihu
//
//  Created by lgh on 16/9/10.
//  Copyright © 2016年 lgh. All rights reserved.
//

#import <UIKit/UIKit.h>
@class storyModel;

@interface HomeTableViewCell : UITableViewCell

+ (NSString *)cellIdentify;

/** 模型*/
@property (nonatomic, strong) storyModel *model;;


@end




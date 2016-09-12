//
//  HomeModel.h
//  zhihu
//
//  Created by lgh on 16/9/10.
//  Copyright © 2016年 lgh. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface storyModel : JSONModel
/** 图片*/
@property (nonatomic, strong) NSArray *images;
/** title*/
@property (nonatomic, copy) NSString *title;

@end

@interface topStoryModel : JSONModel
/** image*/
@property (nonatomic, copy) NSString *image;
/** title*/
@property (nonatomic, copy) NSString *title;
/** id*/
@property (nonatomic, copy) NSString *ID;

@end

@protocol storyModel;
@protocol topStoryModel;

@interface HomeModel : JSONModel

/** 时间*/
@property (nonatomic, copy) NSString *date;
/** 数据*/
@property (nonatomic, strong) NSMutableArray<storyModel> *stories;
/** 广告数据*/
@property (nonatomic, strong) NSMutableArray<topStoryModel> *top_stories;


@end

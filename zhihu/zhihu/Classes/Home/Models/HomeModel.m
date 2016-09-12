//
//  HomeModel.m
//  zhihu
//
//  Created by lgh on 16/9/10.
//  Copyright © 2016年 lgh. All rights reserved.
//

#import "HomeModel.h"

@implementation storyModel

+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"images":@"images"}];
}

@end

@implementation topStoryModel

+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"ID":@"id"}];
}

@end


@implementation HomeModel

+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}


@end

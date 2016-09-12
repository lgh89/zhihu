//
//  HomeViewController.m
//  zhihu
//
//  Created by lgh on 16/9/10.
//  Copyright © 2016年 lgh. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeTableViewCell.h"
#import "HomeModel.h"
#import <AFNetworking.h>

@interface HomeViewController () <UITableViewDataSource, UITableViewDelegate>
/** 表格视图*/
@property (nonatomic, weak) UITableView *tableView;
/** 模型*/
@property (nonatomic, strong) HomeModel *model;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerNib:[UINib nibWithNibName:[HomeTableViewCell cellIdentify] bundle:nil] forCellReuseIdentifier:[HomeTableViewCell cellIdentify]];
    [self fetchDataFromServer];
}

#pragma mark - helper methor

- (void)fetchDataFromServer
{
    [[AFHTTPSessionManager manager] GET:@"http://news-at.zhihu.com/api/4/news/latest" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        self.model = [[HomeModel alloc] initWithDictionary:responseObject error:nil];
        
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.model.stories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[HomeTableViewCell cellIdentify] forIndexPath:indexPath];
    cell.model = self.model.stories[indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

#pragma mark - Setter & Getter
- (UITableView *)tableView
{
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        [self.view addSubview:tableView];
        _tableView = tableView;
    }
    return _tableView;
}

@end
















//
//  TodayFireMainVC.m
//  SegmentBar
//
//  Created by xpchina2003 on 2017/6/19.
//  Copyright © 2017年 郭吉刚. All rights reserved.
//

#import "TodayFireMainVC.h"
#import "SegmentBarController.h"
#import "TodayFireVoiceListTVC.h"

#import "TodayFireDataProvider.h"


@interface TodayFireMainVC ()

@property (nonatomic, weak) SegmentBarController *segContentVC;

@property (nonatomic, strong) NSArray <CategoryModel *> *categoryMs;



@end

@implementation TodayFireMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
    [self loadData];
}

- (void)setUpUI
{
    self.title = @"今日最火";
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.segContentVC.view.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    [self.view addSubview:self.segContentVC.view];
}

- (void)loadData
{
    // 发送网络请求
    __weak typeof(self) weakSelf = self;
  
    [[TodayFireDataProvider shareInstance] getTodayFireCategoryMs:^(NSArray<CategoryModel *> *categoryMs) {
        weakSelf.categoryMs = categoryMs;
    }];
  

}

#pragma mark --懒加载
- (SegmentBarController *)segContentVC
{
    if (!_segContentVC) {
        SegmentBarController *contentVC = [[SegmentBarController alloc] init];
        [self addChildViewController:contentVC];
        _segContentVC = contentVC;
    }
    return _segContentVC;
}

- (void)setCategoryMs:(NSArray<CategoryModel *> *)categoryMs
{
    _categoryMs = categoryMs;
    
    NSInteger vcCount = _categoryMs.count;
    NSMutableArray *vcs = [NSMutableArray arrayWithCapacity:vcCount];
    for (CategoryModel *model in _categoryMs) {
        TodayFireVoiceListTVC *vc = [[TodayFireVoiceListTVC alloc] init];
        vc.loadKey = model.key;
        [vcs addObject:vc];
    }
    
    [self.segContentVC setUpWithItems:[categoryMs valueForKeyPath:@"name"] childvcs:vcs];
    [self.segContentVC.segmentBar updateWithConfig:^(SegmentBarConfig *config) {
        config.segmentBarBackColor = [UIColor whiteColor];
    }];

    
}



@end

//
//  TodayFireDataProvider.m
//  FM
//
//  Created by xpchina2003 on 2017/6/21.
//  Copyright © 2017年 郭吉刚. All rights reserved.
//

#import "TodayFireDataProvider.h"

#import "SessionManager.h"
#import "MJExtension.h"
#import "CategoryModel.h"


#define kBaseUrl @"http://mobile.ximalaya.com/"
@interface TodayFireDataProvider ()
@property (nonatomic, strong) SessionManager *sessionManager;
@end

@implementation TodayFireDataProvider


static TodayFireDataProvider *_shareInstance;

+ (instancetype)shareInstance
{
    if (!_shareInstance) {
        _shareInstance = [[self alloc] init];
    }
    return _shareInstance;
}
- (SessionManager *)sessionManager
{
    if (_sessionManager == nil) {
        _sessionManager = [[SessionManager alloc] init];
    }
    return _sessionManager;
}

- (void)getTodayFireCategoryMs:(void(^)(NSArray <CategoryModel *>*categoryMs))resultBlock
{
    
    NSString *url = [NSString stringWithFormat:@"%@%@",kBaseUrl,@"mobile/discovery/v2/rankingList/track"];
    NSDictionary *param = @{
                            @"device": @"iPhone",
                            @"key": @"ranking:track:scoreByTime:1:0",
                            @"pageId": @"1",
                            @"pageSize": @"0"
                            };
    
    [self.sessionManager request:RequestTypeGet url:url parameter:param resultBlock:^(id responseObject, NSError *error) {
        
        CategoryModel *categoryM = [[CategoryModel alloc] init];
        categoryM.key = @"ranking:track:scoreByTime:1:0";
        categoryM.name = @"总榜";
        
        NSMutableArray <CategoryModel *>*categoryMs = [CategoryModel mj_objectArrayWithKeyValuesArray:responseObject[@"categories"]];
        if (categoryMs.count > 0) {
            [categoryMs insertObject:categoryM atIndex:0];
        }
        
        
        resultBlock(categoryMs);
        
    }];
}

- (void)getTodayFireVoiceMsWithKey:(NSString *)key result:(void(^)(NSArray <DownLoadVoiceModel *>*voiceMs))resultBlock
{
    NSString *url = [NSString stringWithFormat:@"%@%@", kBaseUrl, @"mobile/discovery/v2/rankingList/track"];
    NSDictionary *param = @{
                            @"device": @"iPhone",
                            @"key": key,
                            @"pageId": @"1",
                            @"pageSize": @"30"
                            };
    
 
    [self.sessionManager request:RequestTypeGet url:url parameter:param resultBlock:^(id responseObject, NSError *error) {
        NSMutableArray <DownLoadVoiceModel *>*voiceyMs = [DownLoadVoiceModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        resultBlock(voiceyMs);

    }];

}

@end

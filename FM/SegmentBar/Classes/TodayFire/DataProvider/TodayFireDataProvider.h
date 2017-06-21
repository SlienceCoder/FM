//
//  TodayFireDataProvider.h
//  FM
//
//  Created by xpchina2003 on 2017/6/21.
//  Copyright © 2017年 郭吉刚. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CategoryModel.h"

#import "DownLoadVoiceModel.h"

@interface TodayFireDataProvider : NSObject

+ (instancetype)shareInstance;

- (void)getTodayFireCategoryMs:(void(^)(NSArray <CategoryModel *>*categoryMs))resultBlock;

- (void)getTodayFireVoiceMsWithKey:(NSString *)key result:(void(^)(NSArray <DownLoadVoiceModel *>*voiceMs))resultBlock;

@end

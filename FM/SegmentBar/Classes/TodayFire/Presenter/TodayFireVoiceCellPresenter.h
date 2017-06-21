//
//  TodayFireVoiceCellPresenter.h
//  FM
//
//  Created by xpchina2003 on 2017/6/21.
//  Copyright © 2017年 郭吉刚. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DownLoadVoiceModel.h"
#import "TodayFireVoiceCell.h"

@interface TodayFireVoiceCellPresenter : NSObject

@property (nonatomic, strong) DownLoadVoiceModel *voiceM;

@property (nonatomic, assign) NSInteger sortNum;

- (void)bindWithCell:(TodayFireVoiceCell *)cell;

@end

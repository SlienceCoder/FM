//
//  TodayFireVoiceCellPresenter.m
//  FM
//
//  Created by xpchina2003 on 2017/6/21.
//  Copyright © 2017年 郭吉刚. All rights reserved.
//

#import "TodayFireVoiceCellPresenter.h"

#import <SDWebImage/UIButton+WebCache.h>
#import "DownLoaderManager.h"
#import "RemotePlayer.h"

#import "SqliteModelTool.h"

@interface TodayFireVoiceCellPresenter ()

@property (nonatomic, weak) TodayFireVoiceCell *cell;

@end

@implementation TodayFireVoiceCellPresenter

- (NSString *)title
{
    return self.voiceM.title;
}



- (void)bindWithCell:(TodayFireVoiceCell *)cell
{
    self.cell = cell;
}
@end

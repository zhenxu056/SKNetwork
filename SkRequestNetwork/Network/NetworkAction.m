//
//  NetworkAction.m
//  XMGAJ
//
//  Created by Mr.He on 5/27/16.
//  Copyright © 2016 Mr.He. All rights reserved.
//

#import "NetworkAction.h"

@implementation NetworkAction 

#pragma mark - Init

- (instancetype)init {
    if (self = [super init]) {
        engine = [[NetworkEngine alloc] init];
    }
    return self;
}

/**
 *  获取默认单例
 */
+ (instancetype)sharedAction {
    static NetworkAction *action;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        action = [[self alloc] init];
    });
    return action;
}

- (NSURLSessionDataTask *)getHomeNoticeListWithPage:(NSNumber *)page
                                            success:(NetworkActionSuccessArrayBlock)success
                                            failuer:(NetworkActionFailureBlock)failuer {
    
    NSDictionary *paramet = @{};
    return [engine GET:@"https://www.apple.com/105/media/cn/ipad-pro/how-to/2017/a0f629be_c30b_4333_942f_13a221fc44f3/films/dock/ipad-pro-dock-cn-20160907_1280x720h.mp4" parameters:paramet progress:^(NSProgress *downloadProgress) {
        NSLog(@"%lld  ----  %lld",downloadProgress.completedUnitCount, downloadProgress.totalUnitCount);
    } success:^(NSURLSessionDataTask *task, id responseObject) {
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    } ShowHud:YES];
}


@end

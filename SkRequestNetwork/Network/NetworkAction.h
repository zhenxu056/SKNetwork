//
//  NetworkAction.h
//  XMGAJ
//
//  Created by Mr.He on 5/27/16.
//  Copyright © 2016 Mr.He. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NetworkEngine.h"
#import "NetworkConfig.h" 

typedef void (^NetworkActionSuccessArrayBlock)(NSArray *modelList, NSString *message);
typedef void (^NetworkActionSuccessModelBlock)(id model, NSString *message);
typedef void (^NetworkActionSuccessVoidBlock)(NSString *message);
typedef void (^NetworkActionFailureBlock)(NSURLSessionDataTask *task, NSError *error);

@interface NetworkAction : NSObject {
    NetworkEngine *engine;
}

/**
 *  获取默认单例
 */
+ (instancetype)sharedAction;


- (NSURLSessionDataTask *)getHomeNoticeListWithPage:(NSNumber *)page
                                            success:(NetworkActionSuccessArrayBlock)success
                                            failuer:(NetworkActionFailureBlock)failuer;


@end

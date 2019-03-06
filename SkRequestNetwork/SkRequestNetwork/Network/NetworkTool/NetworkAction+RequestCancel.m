//
//  NetworkAction+RequestCancel.m
//  SKRequestNetwork
//
//  Created by user on 2019/3/6.
//  Copyright © 2019 烧烤有点辣. All rights reserved.
//

#import "NetworkAction+RequestCancel.h"

@implementation NetworkAction (RequestCancel)

/**
 取消当前所有请求
 */
- (void)cancelAllReuest {
    [engine cancelAllReuest];
}

/**
 取消当前个别请求
 
 @param requestUrlArray 请求接口数组
 */
- (void)cancelRequestWithRequestUrlArray:(NSArray<NSURLSessionDataTask *> *)requestUrlArray {
    [engine cancelRequestWithRequestUrlArray:requestUrlArray];
}


@end

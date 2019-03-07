//
//  NetworkAction+RequestCancel.h
//  SKRequestNetwork
//
//  Created by user on 2019/3/6.
//  Copyright © 2019 烧烤有点辣. All rights reserved.
//

#import "NetworkAction.h"

NS_ASSUME_NONNULL_BEGIN

@interface NetworkAction (RequestCancel)

/**
 取消当前所有请求
 */
- (void)cancelAllReuest;

/**
 取消当前个别请求
 
 @param requestUrlArray 请求接口数组
 */
- (void)cancelRequestWithRequestUrlArray:(NSArray<NSURLSessionDataTask *> *)requestUrlArray;

@end

NS_ASSUME_NONNULL_END

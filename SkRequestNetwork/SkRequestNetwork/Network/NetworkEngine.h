//
//  NetworkEngine.h
//  XMGAJ
//
//  Created by Mr.He on 5/27/16.
//  Copyright © 2016 Mr.He. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AFHTTPSessionManager.h"
#import "NSURLSessionTask+AddURLProperty.h"

@interface NetworkEngine : NSObject

- (NSURLSessionDataTask *)GET:(NSString *)URLString
                   parameters:(id)parameters
                     progress:(void (^)(NSProgress * downloadProgress))downloadProgress
                      success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                      failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
                      ShowHud:(BOOL)showhud;

- (NSURLSessionDataTask *)POST:(NSString *)URLString
                    parameters:(id)parameters
                      progress:(void (^)(NSProgress * uploadProgress))uploadProgress
                       success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
                       ShowHud:(BOOL)showhud;

- (NSURLSessionDataTask *)POST:(NSString *)URLString
                    parameters:(id)parameters
     constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))block
                      progress:(void (^)(NSProgress * uploadProgress))uploadProgress
                       success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
                       ShowHud:(BOOL)showhud;


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

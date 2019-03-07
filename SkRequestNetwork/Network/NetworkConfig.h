//
//  NetworkConfig.h
//  XMGAJ
//
//  Created by Mr.He on 5/27/16.
//  Copyright © 2016 Mr.He. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkConfig : NSObject

/** 接口基地址 */
extern NSString *const ApiBaseUrl;

///** 认证key */
//extern NSString *const AuthKey;
///** 认证id */
//extern NSString *const AuthId;

/** 请求超时时间 */
extern const NSUInteger TimeoutInterval;

/** 默认请求条数 */
extern NSString *const DataSourceDefaultPageSize;

/** 无网络错误提示 */
extern NSString *const NetworkURLErrorMsg;

/** 接口请求成功响应码 */
extern const NSUInteger ApiResponseCodeSuccess;
/** 解析错误提示码 */
extern const NSUInteger ApiErrorCodeResponseParseError;

/** domain */
extern NSString *const ApiErrorDomainBusiness;

/** 解析错误提示 */
extern NSString *const ApiErrorMsgResponseParseError;

@end

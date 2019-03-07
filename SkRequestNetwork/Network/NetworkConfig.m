//
//  NetworkConfig.m
//  XMGAJ
//
//  Created by Mr.He on 5/27/16.
//  Copyright © 2016 Mr.He. All rights reserved.
//

#import "NetworkConfig.h"

@implementation NetworkConfig

/** 接口基地址 */
NSString *const ApiBaseUrl = @"";

///** 认证key */
//NSString *const AuthKey = @"23kjlkdfjionaiqwe";
///** 认证id */
//NSString *const AuthId = @"1";

/** 超时时间 */
const NSUInteger TimeoutInterval = 15;

/** 默认请求条数 */
NSString *const DataSourceDefaultPageSize = @"10";

/** 无网络错误提示 */
NSString *const NetworkURLErrorMsg = @"网络请求错误，请检查网络";

/** 接口请求成功响应码 */
const NSUInteger ApiResponseCodeSuccess = 1;
/** 解析错误提示码 */
const NSUInteger ApiErrorCodeResponseParseError = 5000;

/** domain */
NSString *const ApiErrorDomainBusiness = @"com.cn.BiTao";

/** 解析错误提示 */
NSString *const ApiErrorMsgResponseParseError = @"网络请求失败，请稍后重试";


@end

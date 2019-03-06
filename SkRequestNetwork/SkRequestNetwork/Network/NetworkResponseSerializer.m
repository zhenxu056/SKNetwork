//
//  NetworkResponseSerializer.m
//  XMGAJ
//
//  Created by Mr.He on 5/27/16.
//  Copyright © 2016 Mr.He. All rights reserved.
//

#import "NetworkResponseSerializer.h"
#import "NetworkConfig.h"
#import "SVProgressHUD/SVProgressHUD/SVProgressHUD.h"

@implementation NetworkResponseSerializer
 

- (id)responseObjectForResponse:(NSURLResponse *)response
                           data:(NSData *)data
                          error:(NSError *__autoreleasing *)error {
    
    if (self.requestTaskDict) {
        [self.requestTaskDict removeObjectForKey:response.URL.path];
    }
     
//    NSDictionary *responseObject = [super responseObjectForResponse:response data:data error:error];
    
    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSDictionary *responseObject = [self dictionaryWithJsonString:result];
    
    // 数据解析错误，无效的json字符串
    if(responseObject == nil) {
        *error = [[NSError alloc] initWithDomain:ApiErrorDomainBusiness code:ApiErrorCodeResponseParseError userInfo:@{NSLocalizedDescriptionKey:ApiErrorMsgResponseParseError}];
        if (self.isShowHud) {
            [SVProgressHUD showErrorWithStatus:ApiErrorMsgResponseParseError];
        }
        return nil;
    }
    
    // 空数据
    if(responseObject[@"data"] == [NSNull null]) {
        *error = [[NSError alloc] initWithDomain:ApiErrorDomainBusiness code:ApiErrorCodeResponseParseError userInfo:@{NSLocalizedDescriptionKey:responseObject[@"msg"]}];
        if (self.isShowHud) {
            [SVProgressHUD showErrorWithStatus:responseObject[@"msg"]];
        }
        return nil;
    }
    
    //错误码
    if([responseObject[@"code"] integerValue] != ApiResponseCodeSuccess) {
        *error = [[NSError alloc] initWithDomain:ApiErrorDomainBusiness code:[responseObject[@"code"] integerValue] userInfo:@{NSLocalizedDescriptionKey:responseObject[@"msg"]}];
        if (self.isShowHud) {
            [SVProgressHUD showErrorWithStatus:responseObject[@"msg"]];
        }
        return nil;
    }
    
    if (self.isShowHud) {
        [SVProgressHUD dismiss];
    }
    
    return responseObject;
}


#pragma mark - 字符串转字典

/*
 
 * @brief 把格式化的JSON格式的字符串转换成字典
 
 * @param jsonString JSON格式的字符串
 
 * @return 返回字典
 
 */

- (id)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}


@end

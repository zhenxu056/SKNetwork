//
//  NetworkSessionManager.m
//  XMGAJ
//
//  Created by Mr.He on 5/27/16.
//  Copyright © 2016 Mr.He. All rights reserved.
//

#import "NetworkSessionManager.h"
#import "NetworkConfig.h"

@implementation NetworkSessionManager

//- (NSURLSessionDataTask *)dataTaskWithRequest:(NSURLRequest *)request completionHandler:(void (^)(NSURLResponse *, id, NSError *))completionHandler {
//    void (^errorProcessBlock)(NSURLResponse *, id, NSError *) = ^(NSURLResponse *response, id responseObject, NSError *error) {
//        NSError *processError = error;
//        if ([error.domain isEqualToString:NSURLErrorDomain]) {
//            NSMutableDictionary *userInfo = [error.userInfo mutableCopy];
//            userInfo[NSLocalizedDescriptionKey] = NetworkURLErrorMsg;
//            processError = [[NSError alloc] initWithDomain:error.domain code:error.code userInfo:userInfo];
//        }
//        completionHandler(response, responseObject, processError);
//    };
//    
//    NSURLSessionDataTask *task = [super dataTaskWithRequest:request completionHandler:errorProcessBlock];
//    return task;
//}
 

@end

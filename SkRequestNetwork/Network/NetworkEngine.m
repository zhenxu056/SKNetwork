//
//  NetworkEngine.m
//  XMGAJ
//
//  Created by Mr.He on 5/27/16.
//  Copyright © 2016 Mr.He. All rights reserved.
//

#import "NetworkEngine.h"
#import "NetworkResponseSerializer.h"
#import "NetworkSessionManager.h"
#import "NetworkConfig.h"
#import "SVProgressHUD.h"
 

@interface NetworkEngine ()

@property (nonatomic, strong) AFHTTPSessionManager *networkSession;

@property (nonatomic, strong) NSMutableDictionary *requestTaskDict;

@end

@implementation NetworkEngine

- (instancetype)init {
    
    if (self = [super init]) {
        
        self.networkSession = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:ApiBaseUrl]];
        
        self.networkSession.responseSerializer = [NetworkResponseSerializer serializer];
        self.networkSession.requestSerializer = [AFHTTPRequestSerializer serializer];
        
        [self.networkSession.requestSerializer setTimeoutInterval:TimeoutInterval];
        
        self.requestTaskDict = [[NSMutableDictionary alloc] init];
        
        [self addAfNetworkNotificationCenter];
         
    }
    return self;
}

- (NSURLSessionDataTask *)GET:(NSString *)URLString
                   parameters:(id)parameters
                     progress:(void (^)(NSProgress * downloadProgress))downloadProgress
                      success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                      failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
                      ShowHud:(BOOL)showhud {
    
    if (showhud) {
        [SVProgressHUD show];
    }
    
    NetworkResponseSerializer *responseSerializer = (NetworkResponseSerializer *)self.networkSession.responseSerializer;
    responseSerializer.isShowHud = showhud;
    
    NSURLSessionDataTask *task = [self.networkSession GET:URLString parameters:parameters progress:downloadProgress success:success failure:failure];
    task.URLString = URLString;
    
    [self.requestTaskDict setObject:task forKey:URLString];
    
    return task;
}


- (NSURLSessionDataTask *)POST:(NSString *)URLString
                    parameters:(id)parameters
                      progress:(void (^)(NSProgress * uploadProgress))uploadProgress
                       success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
                       ShowHud:(BOOL)showhud {
    
    if (showhud) {
        [SVProgressHUD show];
    }
    
    NetworkResponseSerializer *responseSerializer = (NetworkResponseSerializer *)self.networkSession.responseSerializer;
    responseSerializer.isShowHud = showhud;
    
    NSURLSessionDataTask *task = [self.networkSession POST:URLString parameters:parameters progress:uploadProgress success:success failure:failure];
    task.URLString = URLString;
    
    [self.requestTaskDict setObject:task forKey:URLString];
    
    return task;
}


- (NSURLSessionDataTask *)POST:(NSString *)URLString
                    parameters:(id)parameters
     constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))block
                      progress:(void (^)(NSProgress * uploadProgress))uploadProgress
                       success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
                       ShowHud:(BOOL)showhud {
    
    if (showhud) {
        [SVProgressHUD show];
    }
    
    NetworkResponseSerializer *responseSerializer = (NetworkResponseSerializer *)self.networkSession.responseSerializer;
    responseSerializer.isShowHud = showhud;
    
    
    NSURLSessionDataTask *task = [self.networkSession POST:URLString parameters:parameters constructingBodyWithBlock:block progress:uploadProgress success:success failure:failure];
    task.URLString = URLString;
    
    [self.requestTaskDict setObject:task forKey:URLString];
    
    return task; 
}

- (void)cancelAllReuest {
    for (NSURLSessionDataTask *task in self.requestTaskDict.allValues) {
        if (task) {
            [task cancel];
        }
    }
    [self.requestTaskDict removeAllObjects];
}

- (void)cancelRequestWithRequestUrlArray:(NSArray<NSURLSessionDataTask *> *)requestUrlArray {
    for (NSURLSessionDataTask *task in requestUrlArray) {
        [self cancelReusetWtihRequestURL:task.URLString];
    }
}

- (void)cancelReusetWtihRequestURL:(NSString *)requestUrl {
    NSString *url = [NSString stringWithFormat:@"%@%@",ApiBaseUrl,requestUrl];
    NSURLSessionDataTask *task = [self.requestTaskDict objectForKey:url];
    if (task) {
        [task cancel];
        [self.requestTaskDict removeObjectForKey:url];
    }
}

- (void)addAfNetworkNotificationCenter {
    
    __weak typeof(self) weakSelf = self;
    
    [[NSNotificationCenter defaultCenter] addObserverForName:AFNetworkingTaskDidCompleteNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        
        NSDictionary *userInfo = note.userInfo;
        NSError *error = userInfo[AFNetworkingTaskDidCompleteErrorKey];
        
        if (error) {
            NetworkResponseSerializer *responseSerializer = (NetworkResponseSerializer *)weakSelf.networkSession.responseSerializer;
            
            if ([error.localizedDescription isEqualToString:@"cancelled"]) {
                if (responseSerializer.isShowHud) {
                    [SVProgressHUD dismiss];
                }
            } else {
                if (responseSerializer.isShowHud) {
                    [SVProgressHUD showErrorWithStatus:error.localizedDescription];
                }
            }
            
        } else {
            NetworkResponseSerializer *responseSerializer = (NetworkResponseSerializer *)weakSelf.networkSession.responseSerializer;
            if (responseSerializer.isShowHud) {
                [SVProgressHUD dismiss];
            }
        }
    }];
}

@end

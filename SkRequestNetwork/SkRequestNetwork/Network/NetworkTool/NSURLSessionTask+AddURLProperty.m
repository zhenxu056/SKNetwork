//
//  NSURLSessionTask+AddURLProperty.m
//  SKRequestNetwork
//
//  Created by user on 2019/3/6.
//  Copyright © 2019 烧烤有点辣. All rights reserved.
//

#import "NSURLSessionTask+AddURLProperty.h"

#import <objc/runtime.h>

static NSString *urlKey = @"urlKey";

@implementation NSURLSessionTask (AddURLProperty)

- (void)setURLString:(NSString *)URLString {
    objc_setAssociatedObject(self, &urlKey, URLString, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


- (NSString *)URLString {
    return objc_getAssociatedObject(self,&urlKey);
}

@end

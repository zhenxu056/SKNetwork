//
//  NSDictionary+LogProperty.h
//  SkRequestNetwork
//
//  Created by user on 2019/3/7.
//  Copyright © 2019 烧烤有点辣. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (LogProperty)

/**
 通过json数据转Model

 @param jsonStr json数据
 */
+ (void)logPropertyWithJson:(NSString *)jsonStr;

/**
 通过字典数据打印Model

 @param dict 字典对象
 */
+ (void)logPropertyWithDict:(NSDictionary *)dict;

/**
 通过plist文件打印Model

 @param plistTitle 复制到plist文件的名字
 */
+ (void)logPlistPropertyWithPlistTitle:(NSString *)plistTitle;

@end

NS_ASSUME_NONNULL_END

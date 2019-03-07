//
//  NSString+JSON.h
//  SkRequestNetwork
//
//  Created by user on 2019/3/7.
//  Copyright © 2019 烧烤有点辣. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (JSON)

/**
 对象转Json

 @param object 对象
 @return json字符串
 */
+ (NSString *)jsonStringWithObject:(id)object;

/**
 JSON转对象

 @param jsonString json字符串
 @return 对象
 */
+ (id)objectWithJsonString:(NSString *)jsonString;

@end

NS_ASSUME_NONNULL_END

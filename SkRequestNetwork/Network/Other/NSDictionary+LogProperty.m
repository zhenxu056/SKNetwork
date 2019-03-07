//
//  NSDictionary+LogProperty.m
//  SkRequestNetwork
//
//  Created by user on 2019/3/7.
//  Copyright © 2019 烧烤有点辣. All rights reserved.
//

#import "NSDictionary+LogProperty.h"

#import "NSString+JSON.h"

@implementation NSDictionary (LogProperty)

+ (void)logPropertyWithJson:(NSString *)jsonStr {
    
    NSDictionary *dict = [NSString objectWithJsonString:jsonStr];
    
    NSMutableArray *array = [[NSMutableArray array] initWithArray:[NSDictionary logDictMessageWithObject:dict]];
    
    NSString *_str = [array componentsJoinedByString:@""];
    
    NSLog(@"%@",_str);
    
}

+ (void)logPropertyWithDict:(NSDictionary *)dict {
    
    NSMutableArray *array = [[NSMutableArray array] initWithArray:[NSDictionary logDictMessageWithObject:dict]];
    
    NSString *_str = [array componentsJoinedByString:@""];
    
    NSLog(@"%@",_str);
}


+ (void)logPlistPropertyWithPlistTitle:(NSString *)plistTitle {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"LogProperty" ofType:@"plist"];
    NSDictionary *data = [NSDictionary dictionaryWithContentsOfFile:path];
    
    NSDictionary *dict = data[plistTitle];
    [NSDictionary logDictMessageWithObject:dict];
}


+ (NSArray *)logDictMessageWithObject:(NSDictionary *)dict {
    
    NSArray *name = [dict allKeys];
    NSMutableArray *array = [NSMutableArray array];
    
    for (NSString *title in name) {
        id value = dict[title];
        NSDictionary *logDict = [self logStringMessageWithObject:value titleKey:title];
        [array addObject:logDict[@"log"]];
    }
    
    return array;
}


+ (NSDictionary *)logStringMessageWithObject:(id)object titleKey:(NSString *)title{
    
    NSString *value      = nil;
    NSString *objectType = nil;
    
    value = object;
    
    if ([object isKindOfClass:[NSString class]]) {
        
        objectType = @"NSString";
        
    } else if([object isKindOfClass:[NSDictionary class]]) {
        
        objectType = @"NSDictionary";
        
    } else if([object isKindOfClass:[NSArray class]]) {
        
        objectType = @"NSArray";
        
    } else {
        objectType = @"NSString";
    }
    
    NSString *logString = [NSString stringWithFormat:@"\r/* %@ */\r@property (nonatomic, copy) %@ *%@;\r",value, objectType, title];
    
    return @{@"log":logString, @"type":objectType, @"title":title};
}

@end

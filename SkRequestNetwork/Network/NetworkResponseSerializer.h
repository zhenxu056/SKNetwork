//
//  NetworkResponseSerializer.h
//  XMGAJ
//
//  Created by Mr.He on 5/27/16.
//  Copyright © 2016 Mr.He. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFURLResponseSerialization.h"

@interface NetworkResponseSerializer : AFJSONResponseSerializer

/**
 是否显示Hud
 */
@property (nonatomic, assign) BOOL isShowHud;

@property (nonatomic, strong) NSMutableDictionary *requestTaskDict;

@end

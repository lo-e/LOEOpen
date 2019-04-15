//
//  LOEGlobal.h
//  HappyAA
//
//  Created by guogangj on 14-4-30.
//  Copyright (c) 2014年 guogangj. All rights reserved.
//

#import <Foundation/Foundation.h>

#define RELEASE_VERSION 0

@interface LOEGlobalData : NSObject
+ (LOEGlobalData*)sharedObj;

//保存有赞token过期时间戳
+ (void)setToken:(NSString *)token expires:(long)expires;
+ (long)getTokenExpires;
+ (NSString *)getToken;
+ (void)removeTokenExpires;
+ (void)removeToken;

@end

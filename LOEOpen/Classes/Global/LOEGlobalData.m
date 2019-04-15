//
//  LOEGlobal.m
//  HappyAA
//
//  Created by guogangj on 14-4-30.
//  Copyright (c) 2014年 guogangj. All rights reserved.
//

#import "LOEGlobalData.h"
#import "Macro.h"

static LOEGlobalData* _sharedObj = nil;
static NSString* sPlistName = @"mylocalinfo.plist";

@implementation LOEGlobalData

+ (LOEGlobalData*)sharedObj{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        _sharedObj = [[self alloc] init];
    });
    return _sharedObj;
}

//保存有赞token过期时间戳
+ (void)setToken:(NSString *)token expires:(long)expires {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    @try {
        [userDefaults setObject:[NSNumber numberWithLong:expires] forKey:TOKEN_EXPIRE_USERDEFAULT_KEY];
        [userDefaults setObject:token forKey:TOKEN_USERDEFAULT_KEY];
        [userDefaults synchronize];
    } @catch (NSException *exception) {
    } @finally {}
}

+ (long)getTokenExpires {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSNumber *result = [userDefaults objectForKey:TOKEN_EXPIRE_USERDEFAULT_KEY];
    if ([result isKindOfClass:[NSNumber class]]) {
        return [result longValue];
    }else {
        return 0;
    }
}

+ (NSString *)getToken {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:TOKEN_USERDEFAULT_KEY];
}

+ (void)removeTokenExpires {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:TOKEN_EXPIRE_USERDEFAULT_KEY];
    [userDefaults synchronize];
}

+ (void)removeToken {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:TOKEN_USERDEFAULT_KEY];
    [userDefaults synchronize];
}

@end

//
//  LOEApiManager.m
//  LOEOpen
//
//  Created by Rachel on 2019/4/6.
//  Copyright © 2019 LOE. All rights reserved.
//

#import "LOEApiManager.h"
#import "LOEClient.h"
#import "Macro.h"
#import "LOEGlobalData.h"
#import "LOEGlobal.h"
#import "Category.h"

@interface LOEApiManager ()
@property(nonatomic, copy) NSString *yzToken;

- (void)requestTokenWithSuccess:(void (^) (NSString *token))success
                        failure:(void (^) (NSError *error))failure;
@end

@implementation LOEApiManager

+ (instancetype) sharedManager {
    static dispatch_once_t once;
    static LOEApiManager *singleManager;
    dispatch_once(&once, ^{
        singleManager = [[self alloc] init];
        //可控制的选择token存储
        if (TOKEN_SAVE_ENABLE) {
            NSString *userDefaultToken = [LOEGlobalData getToken];
            long expires = [LOEGlobalData getTokenExpires];
            long sub = expires - [LOEGlobal getNowTimestamp];
            //token过期前一小时需要重新请求
            if (sub > 60*60 && [userDefaultToken length]) {
                singleManager.yzToken = userDefaultToken;
            }
        }
    });
    return singleManager;
}

#pragma mark - 获取有赞token
+ (void)yzToken:(void (^) (NSString *token))block {
    LOEApiManager *manager = [LOEApiManager sharedManager];
    if (manager.yzToken) {
        if (block) {
            block(manager.yzToken);
        }
    }else {
        [manager requestTokenWithSuccess:^(NSString * _Nonnull token) {
            if (block) {
                block(token);
            }
        } failure:^(NSError * _Nonnull error) {
            if (block) {
                block(nil);
            }
        }];
    }
}

- (void)requestTokenWithSuccess:(void (^) (NSString *token))success failure:(void (^) (NSError *error))failure {
    NSDictionary *params = @{@"grant_type":@"silent",
                             @"client_id":YZ_CLIENT_ID,
                             @"client_secret":YZ_CLIENT_SECRET,
                             @"kdt_id":YZ_KDT_ID,
                             };
    __weak __typeof(self) weakSelf = self;
    [LOEClient postWithURL:YZ_URL_TOKEN params:params success:^(id  _Nonnull response) {
        @try {
            weakSelf.yzToken = [response safeObjectForKey:@"access_token"];
            if ([weakSelf.yzToken length] && TOKEN_SAVE_ENABLE) {
                long expires = [[response safeObjectForKey:@"expires_in"] longValue];
                long now = [LOEGlobal getNowTimestamp];
                [LOEGlobalData setToken:weakSelf.yzToken expires:expires+now];
            }
        } @catch (NSException *exception) {} @finally {}
        
        if (success) {
            success(weakSelf.yzToken);
        }
    } failure:^(NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

#pragma mark - 通过商品列表解析需要的跳转url信息
+ (NSString *)getInfoFromListResponse:(NSDictionary *)response mainKey:(NSString *)mainKey {
    NSString *result = nil;
    @try {
        NSArray *itemsList = [[response safeObjectForKey:@"response"] safeObjectForKey:@"items"];
        for (NSDictionary *itemDic in itemsList) {
            NSString *title = [itemDic safeObjectForKey:@"title"];
            if ([title isEqualToString:mainKey]) {
                result = [itemDic safeObjectForKey:@"sub_title"];
                break;
            }
        }
    } @catch (NSException *exception) {} @finally {}
    return result;
}

@end

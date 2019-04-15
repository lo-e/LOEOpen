//
//  LOEClient.m
//  LOEOpen
//
//  Created by Rachel on 2019/4/6.
//  Copyright © 2019 LOE. All rights reserved.
//

#import "LOEClient.h"
#import <AFNetworking.h>

@interface LOEClient ()
@property (nonatomic, strong)AFHTTPSessionManager *manager;
@end

@implementation LOEClient

+ (instancetype) sharedClient {
    static dispatch_once_t once;
    static LOEClient *singleClient;
    dispatch_once(&once, ^{
        singleClient = [[self alloc] init];
    });
    return singleClient;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.manager = [AFHTTPSessionManager manager];
        self.manager.requestSerializer.timeoutInterval = 6.f;
    }
    return self;
}

+ (void) getWithURL:(NSString *)urlStr
             params:(NSDictionary *)params
            success:(void (^)(id response))success
            failure:(void (^) (NSError *error))failure {
    LOEClient *client = [LOEClient sharedClient];
    [client.manager GET:urlStr parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void) postWithURL:(NSString *)urlStr
             params:(NSDictionary *)params
            success:(void (^)(id response))success
            failure:(void (^) (NSError *error))failure {
    LOEClient *client = [LOEClient sharedClient];
    [client.manager POST:urlStr parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

@end

//
//  LOEClient.h
//  LOEOpen
//
//  Created by Rachel on 2019/4/6.
//  Copyright © 2019 LOE. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LOEClient : NSObject

+ (void) getWithURL:(NSString *)urlStr
             params:(NSDictionary *)params
            success:(void (^)(id response))success
            failure:(void (^) (NSError *error))failure;

+ (void) postWithURL:(NSString *)urlStr
              params:(NSDictionary *)params
             success:(void (^)(id response))success
             failure:(void (^) (NSError *error))failure;

@end

NS_ASSUME_NONNULL_END

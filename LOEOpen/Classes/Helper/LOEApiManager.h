//
//  LOEApiManager.h
//  LOEOpen
//
//  Created by Rachel on 2019/4/6.
//  Copyright © 2019 LOE. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LOEApiManager : NSObject

//获取有赞token
+ (void)yzToken:(void (^) (NSString *token))block;

//通过商品列表解析需要的跳转url信息
+ (NSString *)getInfoFromListResponse:(NSDictionary *)response mainKey:(NSString *)mainKey;

@end

NS_ASSUME_NONNULL_END

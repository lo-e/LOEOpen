//
//  LOEGlobal.m
//  LOEOpen
//
//  Created by Rachel on 2019/4/7.
//  Copyright © 2019 LOE. All rights reserved.
//

#import "LOEGlobal.h"

@implementation LOEGlobal

//获取当前时间戳
+(NSInteger)getNowTimestamp{
    NSDate* now = [NSDate date];
    NSTimeInterval timestamp = [now timeIntervalSince1970];
    return (long)timestamp;
}

@end

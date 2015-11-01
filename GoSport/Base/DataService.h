//
//  DataService.h
//  GoSport
//
//  Created by imac on 15/9/27.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import <CoreLocation/CoreLocation.h>

typedef void(^FinisheDidBlock)(AFHTTPRequestOperation *operation,id result);
typedef void(^FailureBlock)(AFHTTPRequestOperation *operation,NSError *error);


@interface DataService : NSObject


+ (id)requestDataWithFileName:(NSString *)fileName;


+ (AFHTTPRequestOperation *)requestWithURL:(NSString *)urlStr params:(NSMutableDictionary *)params httpMethod:(NSString *)httpMethod finishDidBlock:(FinisheDidBlock)finishBlock failureBlock:(FailureBlock)failureBlock;

+ (NSString *)getDistanceWithLat:(CGFloat)newLat Lon:(CGFloat)newLon;

@end

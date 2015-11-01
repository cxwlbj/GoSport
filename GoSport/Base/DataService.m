//
//  DataService.m
//  GoSport
//
//  Created by imac on 15/9/27.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "DataService.h"
#import <math.h>

@implementation DataService

+ (id)requestDataWithFileName:(NSString *)fileName
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"json"];
//    NSLog(@"filePath is %@",filePath);

    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSError *error = nil;
    id json = [NSJSONSerialization JSONObjectWithData:data
                                              options:NSJSONReadingMutableContainers
                                                error:&error];
    return json;
}

+ (AFHTTPRequestOperation *)requestWithURL:(NSString *)url
                                    params:(NSMutableDictionary *)params
                                httpMethod:(NSString *)httpMethod
                            finishDidBlock:(FinisheDidBlock)finishBlock
                              failureBlock:(FailureBlock)failureBlock
{
    if (params == nil) {
        params = [NSMutableDictionary dictionary];
    }
    //拼接url
    NSMutableString *urlStr = [NSMutableString stringWithFormat:@"%@%@",BaseUrl,url];
    //处理参数
    [params setObject:@1.2 forKey:@"v"];
    [params setObject:@"android3.01" forKey:@"client"];
    [params setObject:@"load" forKey:@"opt"];
    
    //创建请求管理对象
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    AFHTTPRequestOperation *operation = nil;
    if ([httpMethod isEqualToString:@"GET"]) {
        operation = [manager GET:urlStr
                      parameters:params
                         success:^(AFHTTPRequestOperation *operation, id responseObject) {
                             NSLog(@"数据请求成功");
                         }
                         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                             NSLog(@"数据请求失败");
                         }];
    }else if([httpMethod isEqualToString:@"POST"])
    {
        operation = [manager POST:urlStr
                       parameters:params
                          success:^(AFHTTPRequestOperation *operation, id responseObject) {
                              NSLog(@"数据请求成功");
                          }
                          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                              //
                              NSLog(@"POST数据请求失败");
                          }];
    }
    operation.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers];
    return operation;
    
}
//计算两点之间的距离
+ (NSString *)getDistanceWithLat:(CGFloat)newLat Lon:(CGFloat)newLon
{
    //构建location
    CLLocation *newLocation = [[CLLocation alloc]initWithLatitude:newLon longitude:newLat];
    
    NSDictionary *dic = [[NSUserDefaults standardUserDefaults] objectForKey:kLocation];
    CGFloat lon = [[dic objectForKey:kLon] floatValue];
    CGFloat lat = [[dic objectForKey:kLat] floatValue];
    
    CLLocation *currentLocation = [[CLLocation alloc]initWithLatitude:lat longitude:lon];
    //计算两点之间的距离
    CLLocationDistance distance = [currentLocation distanceFromLocation:newLocation];
    NSString *str;
    if (distance > 10000) {
        distance /= 10000;
        str = [NSString stringWithFormat:@"%.1fkm",distance];
    }else
    {
        str = [NSString stringWithFormat:@"%.1fm",distance];
    }
    return str;
}


@end

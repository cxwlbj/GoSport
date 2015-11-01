//
//  AreaModel.m
//  GoSport
//
//  Created by imac on 15/9/29.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "AreaModel.h"

@implementation AreaModel

- (id)initContentWithDic:(NSDictionary *)jsonDic
{
    self = [super initContentWithDic:jsonDic];
    if (self) {
        _areaID = [jsonDic objectForKey:@"id"];
        _isHot = [jsonDic objectForKey:@"isHot.id"];
        NSArray *arr = [jsonDic objectForKey:@"areaItem"];
        NSMutableArray *mArr = [NSMutableArray array];
        for (NSDictionary *dic in arr) {
            AreaModel *model = [[AreaModel alloc]initContentWithDic:dic];
            [mArr addObject:model.area];
        }
        _areaItem = mArr;
    }
    return self;
}
@end

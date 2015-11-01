//
//  CityModel.m
//  GoSport
//
//  Created by imac on 15/9/28.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "CityModel.h"

@implementation CityModel


- (id)initContentWithDic:(NSDictionary *)jsonDic
{
    self = [super initContentWithDic:jsonDic];
    if (self) {
        //
        self.cityId = [jsonDic objectForKey:@"id"];
        self.isHot = [jsonDic objectForKey:@"isHot.id"];
    }
    return self;
}
@end

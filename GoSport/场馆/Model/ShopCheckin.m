//
//  ShopCheckin.m
//  GoSport
//
//  Created by imac on 15/9/30.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "ShopCheckin.h"

@implementation ShopCheckin

- (id)initContentWithDic:(NSDictionary *)jsonDic
{
    self = [super initContentWithDic:jsonDic];
    if (self) {
        //
         _checkinID = [jsonDic objectForKey:@"id"];
    }
    return self;
}
@end

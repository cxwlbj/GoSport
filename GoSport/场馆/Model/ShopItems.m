//
//  ShopItems.m
//  GoSport
//
//  Created by imac on 15/9/30.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "ShopItems.h"

@implementation ShopItems

- (id)initContentWithDic:(NSDictionary *)jsonDic
{
    self = [super initContentWithDic:jsonDic];
    if (self) {
        //
        _itemID = [jsonDic objectForKey:@"id"];
    }
    return self;
}

@end

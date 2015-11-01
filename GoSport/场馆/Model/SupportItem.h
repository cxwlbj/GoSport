//
//  SupportItem.h
//  GoSport
//
//  Created by imac on 15/9/30.
//  Copyright (c) 2015年 imac. All rights reserved.
//
/*
 {
 "shop": 2070,
 "shopGoodsType": 748,
 "week": "4",
 "date": "2015-09-30 00:00:00",
 "count": 3,
 "freeCount": 0,
 "saleCount": 3,
 "updateTime": "2015-09-29 20:06:57",
 "maxprice": 55,
 "minprice": 55
 },

 */
#import "BaseModel.h"

@interface SupportItem : BaseModel
@property (nonatomic,copy)NSString *shop;
@property (nonatomic,copy)NSString *shopGoodsType;
@property (nonatomic,copy)NSString *week;
@property (nonatomic,copy)NSString *date;
@property (nonatomic,strong)NSNumber *count;
@property (nonatomic,strong)NSNumber *freeCount;
@property (nonatomic,strong)NSNumber *saleCount;
@property (nonatomic,copy)NSString *updateTime;
@property (nonatomic,copy)NSString *maxprice;
@property (nonatomic,copy)NSString *minprice;

@end

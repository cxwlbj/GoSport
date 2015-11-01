//
//  CityModel.h
//  GoSport
//
//  Created by imac on 15/9/28.
//  Copyright (c) 2015年 imac. All rights reserved.
//
/*
 "id": 1,
 "cityName": "武汉",
 "spell": "wuhan",
 "pid": 1,
 "isHot.id": 1
 */
#import <Foundation/Foundation.h>

@interface CityModel : BaseModel
@property (nonatomic,copy)NSString *cityId;
@property (nonatomic,copy)NSString *cityName;
@property (nonatomic,copy)NSString *spell;
@property (nonatomic,copy)NSString *pid;
@property (nonatomic,copy)NSString *isHot;

@end

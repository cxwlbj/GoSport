//
//  PersonModel.h
//  GoSport
//
//  Created by imac on 15/10/4.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "BaseModel.h"
/*
 "leader.id": 50263,
 "leader.userName": "老郑369",
 "leader.phone": "13554401422",
 "leader.name": "",
 "leader.age": 0,
 */
@interface PersonModel : BaseModel

@property (nonatomic,copy)NSString *fightName;
@property (nonatomic,copy)NSString *fightID;
@property (nonatomic,copy)NSString *userID;//用户ID
@property (nonatomic,copy)NSString *userName; //用户名
@property (nonatomic,copy)NSString *phone;//用户电话
@property (nonatomic,copy)NSString *age;//用户年龄
@property (nonatomic,copy)NSString *sex;//用户的性别
@property (nonatomic,copy)NSString *typeID;//战斗的类型ID
@property (nonatomic,copy)NSString *levelID;//队伍的级别ID
@property (nonatomic,copy)NSString *levelName;//队伍的级别名
@property (nonatomic,copy)NSString *cateID;//
@property (nonatomic,copy)NSString *cateName;
@property (nonatomic,copy)NSString *name;
@end

//
//  TeamModel.h
//  GoSport
//
//  Created by imac on 15/10/4.
//  Copyright (c) 2015年 imac. All rights reserved.
//

/*
 {
 "id": 1024,
 "name": "老郑369的羽毛球队",
 "type.id": 1,
 "type.typeName": "个人",
 "cateID.id": 19,
 "cateID.cateName": "羽毛球",
 "num": 1,
 "maxNum": 1,
 "status.id": 6,
 "status.statusName": "已满员",
 "info": "",
 "leader.id": 50263,
 "leader.userName": "老郑369",
 "leader.phone": "13554401422",
 "leader.name": "",
 "leader.age": 0,
 "score": 25890,
 "createTime": "",
 "warbandItems": [],
 "level.id": 6,
 "level.levelName": "至尊",
 "wins": 60.35,
 "combatGains": "242胜/159负（401场）"
 "img_attachment.attachmentPath":"http://img.dongqil.com.cn/iSports//upload/attachment/20150419/591375c0_d72a_4164_a140_00f0b83f17f2.jpg"
 },
 */
#import "BaseModel.h"

@interface TeamModel : BaseModel

@property (nonatomic,copy)NSString *teamID;
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *typeID;
@property (nonatomic,copy)NSString *typeName;
@property (nonatomic,copy)NSString *cateID;
@property (nonatomic,copy)NSString *cateName;
@property (nonatomic,copy)NSString *num;
@property (nonatomic,copy)NSString *maxNum;
@property (nonatomic,copy)NSString *statusID;
@property (nonatomic,copy)NSString *statusName;

@property (nonatomic,copy)NSString *leaderID;
@property (nonatomic,copy)NSString *leaderName;
@property (nonatomic,copy)NSString *leaderPhone;
@property (nonatomic,copy)NSString *leaderAge;

@property (nonatomic,copy)NSString *score;
@property (nonatomic,copy)NSString *createTime;
@property (nonatomic,strong)NSNumber *levelID;
@property (nonatomic,copy)NSString *levelName;
@property (nonatomic,strong)NSNumber *wins;
@property (nonatomic,copy)NSString *combatGains;

@property (nonatomic,copy)NSString *imgStr;

@end

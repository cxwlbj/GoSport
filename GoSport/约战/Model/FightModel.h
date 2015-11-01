//
//  FightModel.h
//  GoSport
//
//  Created by imac on 15/10/4.
//  Copyright (c) 2015年 imac. All rights reserved.
//
/*
 {
 "id": 124161,
 "title": "leng9的羽毛球个人挑战",
 "shop.id": 2188,
 "shop.name": "雪莲体育馆羽毛球馆",
 "status.id": 6,
 "status.statusName": "约战完成",
 "homeWarband.type.id": 1,
 "homeWarband.level.id": 6,
 "homeWarband.level.levelName": "至尊",
 "homeWarband.id": 1490,
 "homeWarband.name": "王鹏2的羽毛球队",
 "homeWarband.cateID.id": 19,
 "homeWarband.cateID.cateName": "羽毛球",
 "homeWarband.leader.id": 148533,
 "homeWarband.leader.userName": "leng9",
 "homeWarband.leader.phone": "18559203510",
 "homeWarband.leader.gender.id": 1,
 "homeWarband.leader.age": 10,
 "guestWarband.leader.id": 144225,
 "guestWarband.leader.userName": "leng10",
 "guestWarband.leader.phone": "13907168080",
 "guestWarband.id": 1485,
 "guestWarband.name": "风声4的羽毛球队",
 "role": "",
 "payMode.id": 2,
 "payMode.modeName": "AA制",
 "result.id": 1,
 "result.resultName": "主队胜",
 "sitefees": 0,
 "warTime": "2015-10-03 21:45:00",
 "endTime": "2015-10-03 21:45:00",
 "personNum": 1,
 "awardStatus.id": 2,
 "awardCode": "832251105",
 "award": "5元代金券",
 "awardPrice": 5,
 "awardTime": "",
 "outAwardTime": "2015-11-03 00:00:00",
 "winningTime": "2015-10-04 02:15:04",
 "homeScore": "100",
 "guestScore": "10",
 "resultText": "主队:"
 },
 */
#import "BaseModel.h"
#import "PersonModel.h"
//约战
@interface FightModel : BaseModel

@property (nonatomic,copy)NSString *fightID;
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *shopID;
@property (nonatomic,copy)NSString *shopName;
@property (nonatomic,copy)NSString *statusID;
@property (nonatomic,copy)NSString *statusName;
@property (nonatomic,copy)NSString *imgUrl;

//主队
//@property (nonatomic,strong)PersonModel *homeModel;
//@property (nonatomic,strong)PersonModel *guestModel;

@property (nonatomic,copy)NSString *homeFightName;
@property (nonatomic,copy)NSString *homeFightID;
@property (nonatomic,copy)NSString *homeUserID;//用户ID
@property (nonatomic,copy)NSString *homeUserName; //用户名
@property (nonatomic,copy)NSString *homephone;//用户电话
@property (nonatomic,copy)NSString *homeAge;//用户年龄
@property (nonatomic,copy)NSString *homeSex;//用户的性别
@property (nonatomic,copy)NSString *homeTypeID;//战斗的类型ID
@property (nonatomic,copy)NSString *homeLevelID;//队伍的级别ID
@property (nonatomic,copy)NSString *homeLevelName;//队伍的级别名
@property (nonatomic,copy)NSString *homeCateID;//
@property (nonatomic,copy)NSString *homeCateName;
@property (nonatomic,copy)NSString *homeName;

//guest
@property (nonatomic,copy)NSString *guestFightName;
@property (nonatomic,copy)NSString *guestFightID;
@property (nonatomic,copy)NSString *guestUserID;//用户ID
@property (nonatomic,copy)NSString *guestUserName; //用户名
@property (nonatomic,copy)NSString *guestphone;//用户电话
@property (nonatomic,copy)NSString *guestAge;//用户年龄
@property (nonatomic,copy)NSString *guestSex;//用户的性别
@property (nonatomic,copy)NSString *guestTypeID;//战斗的类型ID
@property (nonatomic,copy)NSString *guestLevelID;//队伍的级别ID
@property (nonatomic,copy)NSString *guestLevelName;//队伍的级别名
@property (nonatomic,copy)NSString *guestCateID;//
@property (nonatomic,copy)NSString *guestCateName;
@property (nonatomic,copy)NSString *guestName;

@property (nonatomic,copy)NSString *payModeName;
@property (nonatomic,copy)NSString *resultName;
@property (nonatomic,strong)NSNumber *sitefees;
@property (nonatomic,copy)NSString *warTime;
@property (nonatomic,copy)NSString *endTime;
@property (nonatomic,strong)NSNumber *personNum;

@property (nonatomic,copy)NSString *awardStatusID;
@property (nonatomic,copy)NSString *awardCode;
@property (nonatomic,copy)NSString *award;
@property (nonatomic,copy)NSString *awardPrice;
@property (nonatomic,copy)NSString *awardTime;
@property (nonatomic,copy)NSString *outAwardTime;
@property (nonatomic,copy)NSString *winningTime;
@property (nonatomic,copy)NSString *homeScore;
@property (nonatomic,copy)NSString *guestScore;
@property (nonatomic,copy)NSString *resultText;

@end

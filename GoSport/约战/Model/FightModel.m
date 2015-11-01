//
//  FightModel.m
//  GoSport
//
//  Created by imac on 15/10/4.
//  Copyright (c) 2015年 imac. All rights reserved.
//
#import "PersonModel.h"
#import "FightModel.h"

@implementation FightModel
- (id)initContentWithDic:(NSDictionary *)jsonDic
{
    self = [super initContentWithDic:jsonDic];
    if (self) {
        //
        _fightID = [jsonDic objectForKey:@"id"];
        _shopID = [jsonDic objectForKey:@"shop.id"];
        _shopName = [jsonDic objectForKey:@"shop.name"];
        _statusID = [jsonDic objectForKey:@"status.id"];
        _statusName = [jsonDic objectForKey:@"status.statusName"];
        
        _homeFightID = [jsonDic objectForKey:@"homeWarband.id"];
        _homeFightName = [jsonDic objectForKey:@"homeWarband.name"];
        _homeUserID = [jsonDic objectForKey:@"homeWarband.leader.id"];
        _homeUserName = [jsonDic objectForKey:@"homeWarband.leader.userName"];
        _homephone =[jsonDic objectForKey:@"homeWarband.leader.phone"];
        _homeAge = [jsonDic objectForKey:@"homeWarband.leader.age"];
        _homeTypeID = [jsonDic objectForKey:@"homeWarband.type.id"];
        _homeLevelID = [jsonDic objectForKey:@"homeWarband.level.id"];
        _homeLevelName = [jsonDic objectForKey:@"homeWarband.level.levelName"];
        _homeCateID = [jsonDic objectForKey:@"homeWarband.cateID.id"];
        _homeCateName = [jsonDic objectForKey:@"homeWarband.cateID.cateName"];
        NSInteger num = [[jsonDic objectForKey:@"homeWarband.leader.gender.id"] integerValue];
        if (num == 1) {
            _homeSex = @"男";
        }else if (num == 2)
        {
            _homeSex = @"女";
        }else
        {
            _homeSex = @"性别未设置";
        }
        
        _guestUserName = jsonDic[@"guestWarband.leader.userName"] ;
        _guestUserID =jsonDic[@"guestWarband.leader.id"];
        _guestphone = jsonDic[@"guestWarband.leader.phone"];
        _guestName = jsonDic[@"guestWarband.name"];
        _guestFightID = jsonDic[@"guestWarband.id"];
        
        _payModeName = jsonDic[@"payMode.modeName"];
        _resultName = jsonDic[@"result.resultName"];
        
        
    }
    return self;
}

@end

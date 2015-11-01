//
//  VenueModel.h
//  GoSport
//
//  Created by imac on 15/9/28.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GroupModel.h"
/*
 code": "52299",
 "name": "黄冈杰斯特健身",
 "img_attachment.attachmentPath": "http://img.dongqil.com.cn/iSports//upload/attachment/20150318/70190942_fe6a_45fb_a350_1c46f78f71b7.jpg",
 "recKeyword": "地址:湖北黄冈黄州区七一路一号",
 "cityName": "黄冈",
 "bkNum": 86,
 "address": "湖北黄冈黄州区七一路一号",
 "area.area": "洪山区",
 "cate.cateName": "运动类型",
 "phone": "(0713)8618688",
 "lat": "114.879696",
 "lng": "30.460068",
 "rate": 5,
 "project": "台球,乒乓球,健身",
 "detail": "杰斯特健身黄冈会所（原黄冈全民健身中心）是目前黄冈地区档次最高、规模最大的全天候健身、健美场馆，是一家集健身、休闲、娱乐一体化的综合性场所。会所设有器械训练区、有氧训练区、力量训练区、综合操房、Spinning动感单车、室桌球室、乒乓球室、体能测试中心、休闲商务中心等。是集运动、休闲、娱乐为一体的综合性健身健美场所。会所每周推出超过100小时的群体活动课程：瑜伽、踏板、有氧拉丁、形体芭蕾、肚皮舞、",
 "moreInfo": "",
 "reviews": 51,
 "views": 0,
 "signs": 3,
 "version": 1059059,
 "shopImgs": [],
 "shopItems": [],
 "shopCheckins": [],
 "shopReviews": [],
 "shopGoodsTypes": [],
 "areaText": "黄冈",
 "isFree.id": 2,
 "supportYouhui.id": 2,
 "isSign.id": 2,
 "groupId": {
 "cascadeDirty": true,
 "dataSymbol": "",
 "deletedFlag": false,
 "dirty": true,
 "id": 1,
 "name": "湖北",
 "parentEntity": null,
 "primarykey": 1,
 "remark": "",
 "version": 0
 }
 */
@interface VenueModel : BaseModel
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *imgURL;//*（img_attachment.attachmentPath）
@property (nonatomic,copy)NSString *recKeyword;//地址
@property (nonatomic,copy)NSString *cityName;
@property (nonatomic,copy)NSString *address;
@property (nonatomic,copy)NSString *area;//地区*（area.area）
@property (nonatomic,copy)NSString *cateName;//运动类型（cate.cateName）
@property (nonatomic,strong)NSNumber *rate;
@property(nonatomic,copy)NSString *phone;
@property(nonatomic,copy)NSString *lat;
@property(nonatomic,copy)NSString *lng;
@property (nonatomic,copy)NSString *distance;
@property(nonatomic,copy)NSString *project;
@property(nonatomic,copy)NSString *detail;
@property(nonatomic,strong)GroupModel *groupModel;
@property(nonatomic,copy)NSString *areaText;
@property (nonatomic,copy)NSString *isFree;
@property (nonatomic,copy)NSString *isYouHui;

@property (nonatomic,strong)NSArray *shopingImgs;
@property (nonatomic,strong)NSArray *shopItems;
@property (nonatomic,strong)NSArray *shopCheckins;
@property (nonatomic,strong)NSArray *shopReviews;
@property (nonatomic,strong)NSArray *shopGoodsTypes;


@end

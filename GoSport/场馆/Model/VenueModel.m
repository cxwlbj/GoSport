//
//  VenueModel.m
//  GoSport
//
//  Created by imac on 15/9/28.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "VenueModel.h"
#import "ShopItems.h"
#import "ShopCheckin.h"
#import "ShopReview.h"
#import <CoreLocation/CoreLocation.h>

@implementation VenueModel

- (id)initContentWithDic:(NSDictionary *)jsonDic
{
    self = [super initContentWithDic:jsonDic];
    if (self) {
        //
        _imgURL = [jsonDic objectForKey:@"img_attachment.attachmentPath"];
        _area = [jsonDic objectForKey:@"area.area"];
        _cateName = [jsonDic objectForKey:@"cate.cateName"];
        //处理优惠
        _isYouHui = [jsonDic objectForKey:@"supportYouhui.id"];
        _isFree = [jsonDic objectForKey:@"isFree.id"];
        //处理距离
        NSString *distance = [DataService getDistanceWithLat:[_lat floatValue] Lon:[_lng floatValue]];
        _distance = distance;
        //处理图片
        NSArray *imgs = jsonDic[@"shopImgs"];
        NSMutableArray *mArr = [NSMutableArray array];
        for (NSDictionary *dic in imgs) {
            NSString *imgName = [dic objectForKey:@"img_attachment.attachmentPath"];
            [mArr addObject:imgName];
        }
        _shopingImgs = mArr;
        //处理shopItem
        NSArray *arr = [jsonDic objectForKey:@"shopItems"];
        NSMutableArray *itemArr = [NSMutableArray array];
        for (NSDictionary *dic in arr) {
            ShopItems *shopItem = [[ShopItems alloc]initContentWithDic:dic];
            [itemArr addObject:shopItem];
        }
        _shopItems = itemArr;
        //处理shopCheckin
        NSArray *checkArr = [jsonDic objectForKey:@"shopCheckins"];
        NSMutableArray *check = [NSMutableArray array];
        for (NSDictionary *dic  in checkArr) {
            ShopCheckin *shopch = [[ShopCheckin alloc]initContentWithDic:dic];
            [check addObject:shopch];
        }
        _shopCheckins = check;
        //处理shopReview
        NSArray *reviewArr = [jsonDic objectForKey:@"shopReviews"];
        NSMutableArray *review = [NSMutableArray array];
        for (NSDictionary *dic in reviewArr) {
            ShopReview *shopReview = [[ShopReview alloc]initContentWithDic:dic];
            [review addObject:shopReview];
        }
        _shopReviews = review;

        //处理shopGoodsTypes
        NSArray *typeArr = [jsonDic objectForKey:@"shopGoodsTypes"];
        NSMutableArray *types = [NSMutableArray array];
        for (NSDictionary *dic in typeArr) {
            NSString *name = dic[@"name"];
            [types addObject:name];
        }
        _shopGoodsTypes = types;
    }
    return self;
}

@end

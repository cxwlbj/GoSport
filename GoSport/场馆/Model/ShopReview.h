//
//  ShopReview.h
//  GoSport
//
//  Created by imac on 15/9/30.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "BaseModel.h"
//用户评价
@interface ShopReview : BaseModel

@property (nonatomic,copy)NSString *reviewID;
@property (nonatomic,copy)NSString *userName;
@property (nonatomic,copy)NSString *postTime;
@property (nonatomic,copy)NSString *content;
@property (nonatomic,copy)NSString *score;
@property (nonatomic,copy)NSString *reply;
@end

//
//  ShopCheckin.h
//  GoSport
//
//  Created by imac on 15/9/30.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "BaseModel.h"

@interface ShopCheckin : BaseModel

@property (nonatomic,copy)NSString *checkinID;
@property (nonatomic,copy)NSString *userName;
@property (nonatomic,copy)NSString *checkinTime;
@property (nonatomic,copy)NSString *content;
@property (nonatomic,copy)NSString *reply;

@end

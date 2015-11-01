//
//  ShopItems.h
//  GoSport
//
//  Created by imac on 15/9/30.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "BaseModel.h"

@interface ShopItems : BaseModel
@property (nonatomic,copy)NSString *itemID;
@property (nonatomic,copy)NSString *itemType;
@property (nonatomic,copy)NSString *itemContent;
@property (nonatomic,copy)NSString *sortCode;

@end

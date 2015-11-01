//
//  AreaModel.h
//  GoSport
//
//  Created by imac on 15/9/29.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AreaModel : BaseModel

@property (nonatomic,copy)NSString *areaID;
@property (nonatomic,copy)NSString *area;
@property (nonatomic,copy)NSString *isHot;
@property (nonatomic,copy)NSString *sortId;
@property (nonatomic,strong)NSArray *areaItem;

@end

//
//  GroupModel.h
//  GoSport
//
//  Created by imac on 15/9/28.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "BaseModel.h"
/*
 {
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
@interface GroupModel : BaseModel
@property (nonatomic,copy)NSString *name;
@end

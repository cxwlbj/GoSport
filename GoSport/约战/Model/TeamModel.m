//
//  TeamModel.m
//  GoSport
//
//  Created by imac on 15/10/4.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "TeamModel.h"

@implementation TeamModel

- (id)initContentWithDic:(NSDictionary *)jsonDic
{
    self = [super initContentWithDic:jsonDic];
    if (self) {
        //
        _imgStr = [jsonDic objectForKey:@"img_attachment.attachmentPath"];
        _levelID = [jsonDic objectForKey:@"level.id"];
        _levelName = [jsonDic objectForKey:@"level.levelName"];
        
    }
    return self;
}

@end

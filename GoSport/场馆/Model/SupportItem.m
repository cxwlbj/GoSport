//
//  SupportItem.m
//  GoSport
//
//  Created by imac on 15/9/30.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "SupportItem.h"

@implementation SupportItem

- (id)initContentWithDic:(NSDictionary *)jsonDic
{
    self = [super initContentWithDic:jsonDic];
    if (self) {
        //处理week
        NSString *week = jsonDic[@"week"];
        switch ([week integerValue]) {
            case 1:
                _week = @"星期一";
                break;
            case 2:
                _week = @"星期二";
                break;
            case 3:
                _week = @"星期三";
                break;
            case 4:
                _week = @"星期四";
                break;
            case 5:
                _week = @"星期五";
                break;
            case 6:
                _week = @"星期六";
                break;
            case 7:
                _week = @"星期天";
                break;
            default:
                break;
        }
        
        //处理date
        NSString *dateStr = jsonDic[@"date"];
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        formatter.locale = [[NSLocale alloc]initWithLocaleIdentifier:@"en_US"];
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSDate *date = [formatter dateFromString:dateStr];
        [formatter setDateFormat:@"MM/dd"];
        _date = [formatter stringFromDate:date];
        
    }
    return self;
}

@end

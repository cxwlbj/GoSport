
//
//  Annotation.m
//  GoSport
//
//  Created by imac on 15/10/7.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "Annotation.h"

@implementation Annotation

- (instancetype)initWithCGLocation:(CLLocationCoordinate2D)coord
{
    self = [super init];
    if (self) {
        //
        _coordinate = coord;
    }
    return self;
}

@end

//
//  Annotation.h
//  GoSport
//
//  Created by imac on 15/10/7.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Annotation : NSObject<MKAnnotation>

@property (nonatomic,readonly)CLLocationCoordinate2D coordinate;
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *subTitle;

- (instancetype)initWithCGLocation:(CLLocationCoordinate2D)coord;

@end

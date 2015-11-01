//
//  LocationViewController.h
//  GoSport
//
//  Created by imac on 15/10/7.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "BaseViewController.h"
#import <MapKit/MapKit.h>
#import "VenueModel.h"

@interface LocationViewController : BaseViewController<MKMapViewDelegate>
{
    MKMapView *mapView1;
}
@property (nonatomic,strong)VenueModel *model;

@end

//
//  MainTabBarController.h
//  Sport
//
//  Created by imac on 15/9/26.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MainTabBarController : UITabBarController<CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
    NSInteger selectedItem;

}
@end

//
//  MainTabBarController.m
//  Sport
//
//  Created by imac on 15/9/26.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "MainTabBarController.h"
#import "MainTabBarItem.h"
#import "FirstOpenView.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
#pragma mark - 定位
- (void)_initLocation
{
    //初始化位置服务
    locationManager = [[CLLocationManager alloc]init];
    //设置定位精度
    [locationManager setDesiredAccuracy:kCLLocationAccuracyNearestTenMeters];
    //设置代理
    locationManager.delegate = self;
    //如果实在iOS8.0之后，我们需要添加以下操作
    //1.调用方法--requestWhenInUseAuthorization 或者 requestAlwaysAuthorization
    //2.配置plist文件
    if([UIDevice currentDevice].systemVersion.floatValue > 8.0)
    {
        [locationManager requestWhenInUseAuthorization];
    }
    
    //开始定位
    [locationManager startUpdatingLocation];
}
#pragma mark - CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations
{
    NSLog(@"定位成功");
    //停止定位
    [locationManager stopUpdatingLocation];
    CLLocation *location = [locations lastObject];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    NSNumber *lat = [NSNumber numberWithDouble:location.coordinate.latitude];
    NSNumber *lon = [NSNumber numberWithDouble:location.coordinate.longitude];
    [dic setObject:lat forKey:kLat];
    [dic setObject:lon forKey:kLon];
    
    [[NSUserDefaults standardUserDefaults]setObject:dic forKey:kLocation];
    //反编码
    CLGeocoder *geoCoder = [[CLGeocoder alloc]init];
    [geoCoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        for (CLPlacemark *place in placemarks) {
            NSString *currentCity = place.locality;
            [[NSUserDefaults standardUserDefaults] setObject:currentCity forKey:kcurrentCity];
            NSArray *latestArr = [[NSUserDefaults standardUserDefaults] objectForKey:kLatestCity];
            NSString *latest = latestArr[0];
//            NSLog(@"%@%@",currentCity,latest);
            if (![latest isEqualToString:currentCity]) {
                //不是一个城市
                NSString *message = [NSString stringWithFormat:@"\n您所在地是%@，是否切换至%@？\n",currentCity,currentCity];
                UIAlertController *alertControl = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                    //

                }];
                [alertControl addAction:sureAction];
                UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                    //
                }];
                [alertControl addAction:cancelAction];
                [self presentViewController:alertControl animated:YES completion:nil];
        }
       }
    }];
}
- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    NSLog(@"定位失败");
}



- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSArray *items = self.tabBar.subviews;
    for (UIView *view in items) {
        if ([view isKindOfClass:[MainTabBarItem class]]) {
            return;
        }
    }
    
    //定位
    NSString *first = [[NSUserDefaults standardUserDefaults]objectForKey:kFirstOpen];
    if (first.length == 0) {
        [self createFirstView];
        [[NSUserDefaults standardUserDefaults] setObject:@"firstOpen" forKey:kFirstOpen];
    }else
    {
//        NSString *uid = [[NSUserDefaults standardUserDefaults] objectForKey:kUid];
//
//        if (bgView != nil || uid.length != 0) {
//            return;
//        }
        UIView *bgView = [[UIView alloc]initWithFrame:self.view.bounds];
        bgView.backgroundColor = [UIColor blackColor];
        [self.view addSubview:bgView];
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:self.view.bounds];
        imgView.backgroundColor = [UIColor blackColor];
        imgView.image = [UIImage imageNamed:@"Default.png"];
        [self.view addSubview:imgView];
        imgView.alpha = 0;
        [UIView animateWithDuration:3 animations:^{
            imgView.alpha = 1;
        } completion:^(BOOL finished) {
            [bgView removeFromSuperview];
            [UIView animateWithDuration:0.35 animations:^{
                imgView.right = 0;
            } completion:^(BOOL finished) {
                [imgView removeFromSuperview];
                [self _initLocation];
            }];
        }];
    }

    [self createTabbar];
}
- (void)createFirstView
{
    FirstOpenView *openView = [[FirstOpenView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:openView];
}
- (void)createTabbar
{
    
    //设置selected的默认值
    selectedItem = 100;

    NSArray *arr = self.tabBar.subviews;
    for (UIView *view in arr) {
        Class cls = NSClassFromString(@"UITabBarButton");
        if ([view isKindOfClass:cls]) {
            [view removeFromSuperview];
        }
    }
    NSArray *normalImgName = @[@"ico_changguan_nomal.png",@"ico_yuezhan_nomal.png",@"ico_peilian_nomal.png",@"ico_wode_nomal.png"];
    NSArray *selectedImgName =@[@"ico_changguan_current.png",@"ico_yuezhan_current.png",@"ico_peilian_current.png",@"ico_wode_current.png"];
    NSArray *titles = @[@"场馆",@"约战",@"活动",@"我的"];
    for (int i = 0; i < normalImgName.count; i ++) {
        CGRect itemFrame = CGRectMake((kScreenWidth /4) * i, 5, kScreenWidth /4, 49);
        CGRect imgFrame = CGRectMake(((kScreenWidth /4) - 24)/2, 0, 24, 24);
        UIColor *titleColor = [UIColor grayColor];
        UIColor *highColor = [UIColor colorWithRed:0 green:0.7 blue:0.9 alpha:1];
        
        MainTabBarItem *item = [[MainTabBarItem alloc] initWithFrame:itemFrame ImgFrame:imgFrame ImgName:normalImgName[i] highLightImgName:selectedImgName[i] Title:titles[i] TitleFontSize:12 titleColor:titleColor titleHighLightColor:highColor];
        item.tag = 100 + i;
        [item addTarget:self action:@selector(itemAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.tabBar addSubview:item];
        if (i == 0) {
            item.imgView.highlighted = YES;
            item.label.highlighted = YES;
        }
        
    } 
    
    
    
    
    
}
#pragma mark - itemAction
- (void)itemAction:(MainTabBarItem *)item
{
    self.selectedIndex = item.tag - 100;
    if (selectedItem == item.tag) {
        return;
    }else
    {
        MainTabBarItem *lastItem = (MainTabBarItem *)[self.tabBar viewWithTag:selectedItem];
        lastItem.label.highlighted = NO;
        lastItem.imgView.highlighted = NO;
    }
    item.label.highlighted = YES;
    item.imgView.highlighted = YES;
    selectedItem = item.tag;

}


@end

//
//  LocationViewController.m
//  GoSport
//
//  Created by imac on 15/10/7.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "LocationViewController.h"
#import <MapKit/MapKit.h>
#import "Annotation.h"

@interface LocationViewController ()

@end

@implementation LocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //创建视图
    [self _initMapView];
    [self _initBtn];
}
#pragma mark -MapView
- (void)_initMapView
{
    mapView1 = [[MKMapView alloc]initWithFrame:self.view.bounds];
    mapView1.mapType = MKMapTypeStandard;
    mapView1.delegate = self;
//    mapView.showsUserLocation = YES;
    
    CGFloat lat = [_model.lng floatValue];
    CGFloat lng = [_model.lat floatValue];
    CLLocation *location = [[CLLocation alloc]initWithLatitude:lat longitude:lng];
    CLLocationCoordinate2D center = location.coordinate;
    MKCoordinateSpan span = {0.1,0.1};
    MKCoordinateRegion region = {center,span};
    //给地图设置显示区域
    [mapView1 setRegion:region animated:YES];

    [self.view addSubview:mapView1];
    
    //添加anotation
    Annotation *annotation = [[Annotation alloc]initWithCGLocation:center];
    annotation.title = _model.name;
    annotation.subTitle = _model.address;
    [mapView1 addAnnotation:annotation];

}
#pragma mark - btn
- (void)_initBtn
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, kScreenHeight - 50, kScreenWidth, 50);
    btn.backgroundColor = [UIColor colorWithRed:0.3 green:0.6 blue:1 alpha:1];
    [btn setTitle:@"到这去" forState:UIControlStateNormal];
    [self.view addSubview:btn];
}
#pragma mark - MKMapViewDelegate
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MKUserLocation class]])
    {
        return nil;
    }
    NSString *identifier = @"PinView";
    MKPinAnnotationView *pinView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (pinView == nil) {
        pinView = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:identifier];
        pinView.pinColor = MKPinAnnotationColorRed;
        //是否显示标题视图
        pinView.canShowCallout = YES;
        //从天而降的动画
        pinView.animatesDrop = YES;
    }
    return pinView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

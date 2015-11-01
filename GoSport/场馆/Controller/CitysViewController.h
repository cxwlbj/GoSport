//
//  CitysViewController.h
//  GoSport
//
//  Created by imac on 15/9/28.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "BaseViewController.h"

@interface CitysViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_cityTableView;
    UIView *headeView;
    UILabel *locationLabel;
    UITextField *searchTf;
}
@property (nonatomic,strong)NSMutableArray *spellData;
@property (nonatomic,strong)NSArray *data;//数组数据
@property (nonatomic,strong)NSArray *filterData;//筛选的数据

@property (nonatomic,strong)NSArray *allCaptail;
@property (nonatomic,strong)NSArray *hotCitys;//热门城市
@property (nonatomic,strong)NSDictionary *allCityDic;//分组数据
@property (nonatomic,strong)NSArray *subCitys;//所有城市的首字母

@property (nonatomic,strong)NSMutableArray *latestCity;

@end

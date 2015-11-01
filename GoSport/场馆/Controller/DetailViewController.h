//
//  DetailViewController.h
//  GoSport
//
//  Created by imac on 15/9/29.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "BaseViewController.h"
#import "SubTypeTableView.h"

@interface DetailViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
{
    UIView *_selectedView;
    SubTypeTableView *_venueTabelView;
    UIImageView *_bgView;
    UITableView *areaTableV;
    UITableView *itemTableV;
    UIView *selectedView;
    UITableView *centerTableV;
    UITableView *rightTableV;
    UIView *maskView;//遮罩视图
}
@property (nonatomic,strong)NSArray *itemData;
@property (nonatomic,strong)NSArray *areaData;
@property (nonatomic,strong)NSArray *centerData;
@property (nonatomic,strong)NSArray *rightData;
@end

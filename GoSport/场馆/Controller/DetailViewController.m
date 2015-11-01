//
//  DetailViewController.m
//  GoSport
//
//  Created by imac on 15/9/29.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "DetailViewController.h"
#import "AreaModel.h"
#import "VenueModel.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    //初始化tableV
    [self _initTableView];
    //初始化视图
    [self _initSeleteView];
    //请求地区数据
    [self requestData];
    //请求中间的数据
    [self requestCenterData];

}


#pragma mark - 初始化选择视图
- (void)_initSeleteView
{
    _selectedView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, 40)];
    NSArray *titleName = @[@"全部商区",@"游泳",@"系统推荐"];
    for (int i = 0; i < 3; i ++) {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake((kScreenWidth /3) * i, 0, kScreenWidth/3, _selectedView.height)];
//        btn.backgroundColor = [UIColor blackColor];
        btn.titleLabel.font = [UIFont boldSystemFontOfSize:13];
        UIImage *img = [UIImage imageNamed:@"title_bg_down.png"];
        [img stretchableImageWithLeftCapWidth:1 topCapHeight:1];
        [btn setBackgroundImage:img forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [btn setTitle:titleName[i] forState:UIControlStateNormal];
        btn.tag = 300 + i;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_selectedView addSubview:btn];
    }
    [self.view addSubview:_selectedView];
    //初始化遮罩视图
    if(maskView == nil)
    {
        maskView = [[UIView alloc]initWithFrame:CGRectMake(0, _selectedView.bottom, kScreenWidth, kScreenHeight - 104)];
        maskView.backgroundColor = [UIColor grayColor];
        maskView.alpha = 0.5;
        maskView.hidden = YES;
        [self.view insertSubview:maskView aboveSubview:_venueTabelView];
//        [self.view addSubview:maskView];
    }
}
#pragma mark - topBtnClick
- (void)btnClick:(UIButton *)btn
{

    
    //创建背景视图
    if (_bgView == nil) {
        _bgView = [[UIImageView alloc]initWithFrame:CGRectMake(10, _selectedView.bottom, kScreenWidth - 20, 0)];
        _bgView.userInteractionEnabled = YES;
        [self.view addSubview:_bgView];
    }
    btn.selected = !btn.selected;
    maskView.hidden = !btn.selected;
    if (btn.selected) {
        //显示
        [UIView animateWithDuration:0.2 animations:^{
            _bgView.height = 450;
//            maskView.hidden = NO;
        }];
    }else{
        //隐藏
        [UIView animateWithDuration:0.2 animations:^{
            _bgView.height = 0;
//            maskView.hidden = YES;
        }];
    }
    UIImage *img = nil;
    switch (btn.tag) {
        case 300:
        {
            //left
            //其余视图隐藏
            centerTableV.hidden = YES;
            rightTableV.hidden = YES;
            img = [UIImage imageNamed:@"popup_left_big_bg.png"];
            if (btn.selected) {
                areaTableV.hidden = NO;
                itemTableV.hidden = NO;
            }else
            {
                areaTableV.hidden = YES;
                itemTableV.hidden = YES;
            }

            if (areaTableV == nil) {
                areaTableV = [[UITableView alloc]initWithFrame:CGRectMake(0, 10, _bgView.width/2, _bgView.height- 20) style:UITableViewStylePlain];
                areaTableV.scrollEnabled = YES;
                areaTableV.delegate = self;
                areaTableV.dataSource = self;
                [_bgView addSubview:areaTableV];
                
                //选择视图
                selectedView = [[UIView alloc]initWithFrame:CGRectMake(5, 0, 5, 44)];
                selectedView.backgroundColor = [UIColor blueColor];
                selectedView.hidden = YES;
                selectedView.alpha = 0.5;
                [areaTableV addSubview:selectedView];
            }

         break;
        }
        case 301:
        {
            //center
            //隐藏左侧的视图
            areaTableV.hidden = YES;
            itemTableV.hidden = YES;
            rightTableV.hidden = YES;
            //设置背景图片
            img = [UIImage imageNamed:@"popup_middle_bg.png"];
            //创建中间的tableV
            if (centerTableV == nil) {
                centerTableV = [[UITableView alloc]initWithFrame:CGRectMake(0, 10, _bgView.width, _bgView.height - 20)];
                centerTableV.delegate = self;
                centerTableV.dataSource = self;
                [_bgView addSubview:centerTableV];
            }
            if (btn.selected) {
                centerTableV.hidden = NO;
            }else
            {
                centerTableV.hidden = YES;
            }
            break;
        }
        case 302:
        {
            //right
            //隐藏左侧的视图
            areaTableV.hidden = YES;
            itemTableV.hidden = YES;
            centerTableV.hidden = YES;
            //设置背景图片
            img = [UIImage imageNamed:@"popup_right_bg.png"];
            if (rightTableV == nil) {
                rightTableV = [[UITableView alloc]initWithFrame:CGRectMake(0, 10, _bgView.width, _bgView.height - 20) style:UITableViewStylePlain];
                rightTableV.delegate = self;
                rightTableV.dataSource = self;
                [_bgView addSubview:rightTableV];
            }
            if (btn.selected) {
                rightTableV.hidden = NO;
            }else
            {
                rightTableV.hidden = YES;
            }
        }
        default:
            break;
    }
    img = [img stretchableImageWithLeftCapWidth:80 topCapHeight:50];
    _bgView.image = img;
        
}
//请求数据
- (void)requestData
{
    NSDictionary *jsonDic = [DataService requestDataWithFileName:kArea];
    NSArray *dataArr = jsonDic[@"data"];
    NSMutableArray *mArr = [NSMutableArray array];
    for (NSDictionary *dic in dataArr){
        AreaModel *model = [[AreaModel alloc]initContentWithDic:dic];
        [mArr addObject:model];
    }
    self.areaData = mArr;
    
    self.rightData = @[@"系统推荐",@"离我最近",@"人气最高",@"评价最好",@"最近更新"];
    
}
- (void)requestCenterData
{
    NSDictionary *jsonDic = [DataService requestDataWithFileName:kCateNames];
    NSArray *dataArr = jsonDic[@"data"];
    NSMutableArray *mArr = [NSMutableArray array];
    for (NSDictionary *dic in dataArr) {
        NSString *cateName = [dic objectForKey:@"cateName"];
        [mArr addObject:cateName];
    }
    [mArr insertObject:@"全部分类" atIndex:0];
    self.centerData = mArr;
}
#pragma mark - 初始化tableV
- (void)_initTableView
{
    _venueTabelView = [[SubTypeTableView alloc]initWithFrame:CGRectMake(0, 104, kScreenWidth, kScreenHeight - 104) style:UITableViewStylePlain];
    _venueTabelView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_venueTabelView];
    //处理数据
    [self dealVenueData];
}
- (void)dealVenueData
{
    NSDictionary *jsonDic = [DataService requestDataWithFileName:kSwim];
    NSArray *dataArr = [jsonDic objectForKey:@"data"];
    NSMutableArray *mArr = [NSMutableArray array];
    for (NSDictionary *dic in dataArr) {
        VenueModel *model = [[VenueModel alloc]initContentWithDic:dic];
        [mArr addObject:model];
    }
    _venueTabelView.venueData = mArr;
}
#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == areaTableV) {
        return self.areaData.count;
    }else if(tableView == centerTableV)
    {
        return self.centerData.count;
    }else if (tableView == rightTableV)
    {
        return self.rightData.count;
    }
    return self.itemData.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identidier = @"AreaCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identidier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identidier];
    }
    if (tableView == areaTableV) {
        AreaModel *model = self.areaData[indexPath.row];
        cell.textLabel.text = model.area;
        
    }else if(tableView == itemTableV)
    {
        NSString *itemStr = self.itemData[indexPath.row];
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        cell.textLabel.text = itemStr;
        
        cell.backgroundColor = [UIColor clearColor];
    }else if(tableView == centerTableV)
    {
        NSString *cateName = self.centerData[indexPath.row];
        cell.textLabel.text = cateName;
    }else if(tableView == rightTableV)
    {
        cell.textLabel.text = self.rightData[indexPath.row];
    }

    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (tableView == areaTableV) {
        selectedView.hidden = NO;
        [UIView animateWithDuration:0.2 animations:^{
            selectedView.top = 44 * indexPath.row;
        }];
        AreaModel *model = self.areaData[indexPath.row];
        self.itemData = model.areaItem;
        if (itemTableV == nil) {
            itemTableV = [[UITableView alloc]initWithFrame:CGRectMake(areaTableV.right, areaTableV.top, areaTableV.width, areaTableV.height)];
            itemTableV.backgroundColor = [UIColor clearColor];
            itemTableV.separatorStyle = UITableViewCellSelectionStyleNone;
            itemTableV.delegate = self;
            itemTableV.dataSource = self;
            [_bgView addSubview:itemTableV];
        }
        [itemTableV reloadData];
    }else if(tableView == itemTableV)
    {
        UIButton *leftBtn = (UIButton *)[_selectedView viewWithTag:300];
        [leftBtn setTitle:self.itemData[indexPath.row] forState:UIControlStateNormal];
        [self btnClick:leftBtn];
    }else if(tableView == centerTableV)
    {
        UIButton *centerBtn = (UIButton *)[_selectedView viewWithTag:301];
        [centerBtn setTitle:self.centerData[indexPath.row] forState:UIControlStateNormal];
        [self btnClick:centerBtn];
    }else if(tableView == rightTableV)
    {
        UIButton *rightBtn = (UIButton *)[_selectedView viewWithTag:302];
        [rightBtn setTitle:self.rightData[indexPath.row] forState:UIControlStateNormal];
        [self btnClick:rightBtn];
    }
}


@end

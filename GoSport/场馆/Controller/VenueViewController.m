//
//  VenueViewController.m
//  GoSport
//
//  Created by imac on 15/9/26.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "VenueViewController.h"
#import "VenueTableView.h"
#import "MainTabBarItem.h"
#import "TypeControl.h"
#import "VenueTableViewCell.h"
#import "CitysViewController.h"
#import "DetailViewController.h"

@interface VenueViewController ()

@end

@implementation VenueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    //初始化视图
    [self _initViews];
    //请求数据
    [self requestData];
    
}
#pragma mark - 初始化视图
- (void)_initViews
{
    _totalTableView = [[VenueTableView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight - 49 - 64) style:UITableViewStyleGrouped];
    _totalTableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_totalTableView];
    
    //创建头视图
    [self createHeaderView];
    
    //创建左右的导航栏barButtonItem
    [self createBarButtonItem];
}
- (void)createHeaderView
{
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 250)];
    _totalTableView.tableHeaderView = headerView;
    
    //创建topScrollView
    _topScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 5, kScreenWidth, 140)];
    _topScrollView.backgroundColor = [UIColor whiteColor];
    _topScrollView.pagingEnabled = YES;
    _topScrollView.contentSize = CGSizeMake(kScreenWidth * 2, _topScrollView.height);
    _topScrollView.bounces = NO;
    _topScrollView.showsHorizontalScrollIndicator = NO;
    _topScrollView.showsVerticalScrollIndicator = NO;
    _topScrollView.scrollEnabled = YES;
    _topScrollView.backgroundColor = [UIColor clearColor];
    _topScrollView.delegate = self;
    [headerView addSubview:_topScrollView];
    
    //循环创建typeItem
    //从json文件中取出数据
    NSDictionary *jsonDic = [DataService requestDataWithFileName:khome_top];
    NSArray *iconsArr = [jsonDic objectForKey:@"data"];
    for (int i = 0; i <= iconsArr.count; i ++) {
        NSInteger page = i / 6;
        NSInteger section = i % 6 % 3;
        NSInteger row = i % 6 /3;
        CGRect itemFrame = CGRectMake(kScreenWidth * page + section * (kScreenWidth /3) + 5,row * 70, kScreenWidth/3, 70);
        if (i == iconsArr.count) {
            CGRect imgFrame = CGRectMake((itemFrame.size.width - 40)/2, 0, 40, 40);
            MainTabBarItem *moreType = [[MainTabBarItem alloc]initWithFrame:itemFrame ImgFrame:imgFrame ImgName:@"ico_more.png" highLightImgName:@"ico_more.png" Title:@"更多" TitleFontSize:16 titleColor:[UIColor blackColor] titleHighLightColor:[UIColor blackColor]];
            moreType.backgroundColor = [UIColor clearColor];
            moreType.tag = 100 + i;
            [moreType addTarget:self action:@selector(typeAction:) forControlEvents:UIControlEventTouchUpInside];
            [_topScrollView addSubview:moreType];
        }else
        {
            NSDictionary *dic = iconsArr[i];
            NSString *title = dic[@"cateName"];
            NSString *imgName = dic[@"imgUrl_attachment.attachmentPath"];
            TypeControl *subtype = [[TypeControl alloc]initWithFrame:itemFrame imgUrlStr:imgName title:title];
            subtype.backgroundColor = [UIColor clearColor];
            subtype.tag = 100 + i;
            [subtype addTarget:self action:@selector(typeAction:) forControlEvents:UIControlEventTouchUpInside];
            [_topScrollView addSubview:subtype];
        }
    }
    //分页
    pageCtrl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, 140, kScreenWidth, 20)];
    [pageCtrl addTarget:self action:@selector(pageCtrlAction:) forControlEvents:UIControlEventValueChanged];
    pageCtrl.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0.1 alpha:0.1];
    pageCtrl.currentPage = 0;
    pageCtrl.currentPageIndicatorTintColor = [UIColor cyanColor];
    pageCtrl.pageIndicatorTintColor = [UIColor lightGrayColor];
    pageCtrl.numberOfPages = 2;
    [headerView addSubview:pageCtrl];
    //创建两个按钮
    _freeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _freeBtn.frame = CGRectMake(0, pageCtrl.bottom, kScreenWidth/2,headerView.height - _topScrollView.height - pageCtrl.height);
    [_freeBtn setImage:[UIImage imageNamed:@"free.png"] forState:UIControlStateNormal];
    [_freeBtn addTarget:self action:@selector(typeAction:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:_freeBtn];
    _specialBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _specialBtn.frame = CGRectMake(_freeBtn.right, pageCtrl.bottom, kScreenWidth/2, _freeBtn.height);
    [_specialBtn addTarget:self action:@selector(typeAction:) forControlEvents:UIControlEventTouchUpInside];
    [_specialBtn setImage:[UIImage imageNamed:@"special.png"] forState:UIControlStateNormal];
    [headerView addSubview:_specialBtn];
}
- (void)pageCtrlAction:(UIPageControl *)pageCtrl1
{
    NSInteger currentPage = pageCtrl1.currentPage;
    [_topScrollView setContentOffset:CGPointMake(kScreenWidth * currentPage, 0)];
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger page = scrollView.contentOffset.x/kScreenWidth;
    pageCtrl.currentPage = page;
}
- (void)typeAction:(TypeControl *)subType
{
    DetailViewController *detailVC = [[DetailViewController alloc]init];
    [self.navigationController pushViewController:detailVC animated:YES];
}
#pragma mark - 请求数据
- (void)requestData
{
    NSDictionary *jsondic = [DataService requestDataWithFileName:kHome];
    NSArray *arr = jsondic[@"data"];
    NSMutableArray *mArr = [NSMutableArray array];
    for (NSDictionary *dic in arr) {
        VenueModel *model = [[VenueModel alloc]initContentWithDic:dic];
        [mArr addObject:model];
    }
    _venueData = mArr;
    _totalTableView.venueData = _venueData;
}
#pragma mark -创建左右的导航栏barButtonItem
- (void)createBarButtonItem
{
    UIButton *leftBtn = [UIButton buttonWithType: UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, 105, 40);
    [leftBtn addTarget:self action:@selector(changeCity:) forControlEvents:UIControlEventTouchUpInside];
    //创建文字label
    UILabel *leftLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 55, 40)];
    leftLabel.tag = 600;
    leftLabel.textAlignment = NSTextAlignmentRight;
    leftLabel.textColor = [UIColor whiteColor];
    [leftBtn addSubview:leftLabel];
    //创建向下的图片
    UIImageView *downImgV = [[UIImageView alloc]initWithFrame:CGRectMake(leftLabel.right, 0, 40, 40)];
    downImgV.image = [UIImage imageNamed:@"ico_down_white_carut.png"];
    [leftBtn addSubview:downImgV];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIImageView *titleImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 85, 37)];
    titleImgView.image = [UIImage imageNamed:@"isports_title.png"];
    self.navigationItem.titleView = titleImgView;
}
- (void)changeCity:(UIButton *)btn
{
    CitysViewController *cityVC = [[CitysViewController alloc]init];
    [self.navigationController pushViewController:cityVC animated:YES];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    UIButton *btn = (UIButton *)self.navigationItem.leftBarButtonItem.customView;
    UILabel *leftLabel = (UILabel *)[btn viewWithTag:600];
    NSArray *arr = [[NSUserDefaults standardUserDefaults]objectForKey:kLatestCity];
    NSString *city = nil;
    if (arr.count == 0) {
        city = @"黄冈";
    }else
    {
        city = arr[0];
    }
    leftLabel.text = city;
}

@end

//
//  VDetailViewController.m
//  GoSport
//
//  Created by imac on 15/9/29.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "VDetailViewController.h"
#import "SupportItem.h"

@interface VDetailViewController ()

@end

@implementation VDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"场馆详情";
    self.view.backgroundColor = [UIColor whiteColor];
    
    //处理数据
    [self dealData];
    //初始化视图
    [self _initViews];
}

#pragma mark -处理数据
-(void)dealData
{
    NSDictionary *jsonDic = [DataService requestDataWithFileName:kGreenDetail];
    NSArray *dataArr = [jsonDic objectForKey:@"data"];
    NSDictionary *detailDic = dataArr[0];
    venueModel = [[VenueModel alloc]initContentWithDic:detailDic];
    detailTableView.model = venueModel;
    [detailTableView reloadData];
}
#pragma mark - 初始化视图
- (void)_initViews
{
    detailTableView = [[DetailTableView alloc]initWithFrame:self.view.bounds];
    detailTableView.model = venueModel;
    [self.view addSubview:detailTableView];
    //创建headerView
    [self createHeaderView];
}
#pragma mark -创建headerView
- (void)createHeaderView
{
    //创建头视图
    headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 340)];
    detailTableView.tableHeaderView = headerView;

    //创建滑动视图
    [self createTopScrollView];
    //创建pageCtrl
    [self createPageCtrl];
    //创建支持项目
    [self createSupportView];
    //请求数据
    [self requestData:0];
}
#pragma mark -创建滑动视图
- (void)createTopScrollView
{
    //创建头视图上的滑动视图
    UIScrollView *topScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 180)];
    topScrollView.tag = 400;
    topScrollView.backgroundColor = [UIColor redColor];
    topScrollView.contentSize = CGSizeMake(kScreenWidth * 3, topScrollView.height);
    topScrollView.showsHorizontalScrollIndicator = NO;
    topScrollView.showsVerticalScrollIndicator = NO;
    topScrollView.pagingEnabled = YES;
    topScrollView.bounces = NO;
    [headerView addSubview:topScrollView];
    
    for (int i = 0; i < 3; i ++) {
        UIImageView *topImgView = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth * i, 0, kScreenWidth, topScrollView.height)];
        NSArray *imgs = venueModel.shopingImgs;
        NSURL *imgUrl = [NSURL URLWithString:imgs[i]];
//        NSLog(@"imgurl %@",imgs[i]);
        topScrollView.delegate = self;
        [topImgView sd_setImageWithURL:imgUrl];
        [topScrollView addSubview:topImgView];
    }

}
#pragma mark -创建pageCtrl
- (void)createPageCtrl
{
    UIView *pageView = [[UIView alloc] initWithFrame:CGRectMake(0,180 - 40, kScreenWidth, 40)];
    pageView.backgroundColor = [UIColor darkGrayColor];
    pageView.alpha = 0.5;
    [headerView addSubview:pageView];
    UIPageControl *pageCtrl = [[UIPageControl alloc]initWithFrame:CGRectMake(kScreenWidth - 100, pageView.top, 100, pageView.height)];
    pageCtrl.tag = 401;
    pageCtrl.numberOfPages = 3;
    pageCtrl.currentPage = 0;
    pageCtrl.currentPageIndicatorTintColor = [UIColor cyanColor];
    [pageCtrl addTarget:self action:@selector(pageCtrlAcrtion:) forControlEvents:UIControlEventValueChanged];
    [headerView addSubview:pageCtrl];
    
    //创建label
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, pageView.top, 250, pageView.height)];
    titleLabel.text = venueModel.name;
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont systemFontOfSize:16];
    [headerView addSubview:titleLabel];
}
- (void)pageCtrlAcrtion:(UIPageControl *)pageCtrl
{
    NSInteger page = pageCtrl.currentPage;
    UIScrollView *topScrollView = (UIScrollView *)[headerView viewWithTag:400];
    topScrollView.contentOffset = CGPointMake(kScreenWidth * page, 0);
}
#pragma mark -创建支持项目
- (void)createSupportView
{
    UIView *supportView = [[UIView alloc] initWithFrame:CGRectMake(0, 180, kScreenWidth, 160)];
    supportView.backgroundColor = [UIColor clearColor];
    [headerView addSubview:supportView];
    
    //创建支持项目
    UILabel *leftLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 70, 40)];
    leftLabel.text = @"支持项目";
    leftLabel.font = [UIFont systemFontOfSize:13];
    leftLabel.textAlignment = NSTextAlignmentCenter;
    [supportView addSubview:leftLabel];
    //竖线
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(leftLabel.right, leftLabel.top, 1, leftLabel.height)];
    lineView.backgroundColor = [UIColor grayColor];
    [supportView addSubview:lineView];
    
    //创建分类
    //创建选中的视图
    selectedView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 70, 2)];
    selectedView.backgroundColor = [UIColor cyanColor];
    [supportView addSubview:selectedView];
    for (int i = 0; i < venueModel.shopGoodsTypes.count; i ++) {
        //
        UIButton *typeBtn = [[UIButton alloc]initWithFrame:CGRectMake(70 + 80 * i, 0,80,leftLabel.height)];
        typeBtn.tag = 500 + i;
        [typeBtn setImage:[UIImage imageNamed:@"ico_shuttlecock_small.png"] forState:UIControlStateNormal];
        [typeBtn setTitle:venueModel.shopGoodsTypes[i] forState:UIControlStateNormal];
        [typeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        typeBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [typeBtn addTarget:self action:@selector(typeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [supportView addSubview:typeBtn];
        if (i == 0) {
            selectedView.frame = CGRectMake(typeBtn.left + 5, typeBtn.bottom - 2, typeBtn.width - 10, 2);
        }
    }
    //创建支持新项目的具体信息
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(100, 100);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumInteritemSpacing = 10;
    flowLayout.minimumLineSpacing = 10;

    detailCollectionV = [[DetailCollectionView alloc]initWithFrame:CGRectMake(0, leftLabel.bottom, kScreenWidth, 120) collectionViewLayout:flowLayout];
    [supportView addSubview:detailCollectionV];
}
- (void)typeBtnClick:(UIButton *)btn
{
    selectedView.frame = CGRectMake(btn.left + 5, btn.bottom - 2, btn.width - 10, 2);
    NSInteger index = btn.tag;
    //请求数据
    [self requestData:index];
}
- (void)requestData:(NSInteger)index
{
    NSDictionary *dic = [DataService requestDataWithFileName:kGreenSportSupport];

    NSArray *jsonArr = [dic objectForKey:@"data"];
    NSMutableArray *mArr = [NSMutableArray array];
    for (NSDictionary *jsonDic in jsonArr) {
        //
        SupportItem *item = [[SupportItem alloc]initContentWithDic:jsonDic];
        [mArr addObject:item];
    }
    detailCollectionV.data = mArr;
    [detailCollectionV reloadData];
}
#pragma mark -UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x/kScreenWidth;
    UIPageControl *pageCtrl = (UIPageControl *)[headerView viewWithTag:401];
    pageCtrl.currentPage = index;
}

@end

//
//  FightViewController.m
//  GoSport
//
//  Created by imac on 15/9/26.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "FightViewController.h"
#import "TeamModel.h"
#import "FightModel.h"

@interface FightViewController ()

@end

@implementation FightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"同城约战";
    self.view.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:0.9];
    self.automaticallyAdjustsScrollViewInsets = NO;
    //处理数据
    [self requestData];

    //创建视图
    [self createViews];

}
#pragma mark - 创建视图
- (void)createViews
{
    //创建总视图
    bgView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64,kScreenWidth,kScreenHeight - 64 - 49)];
//    bgView.contentSize = CGSizeMake(kScreenWidth, kScreenHeight - 64 - 49);
    bgView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:bgView];
    
    //top
    [self createTopView];
    //center
    [self createCenterView];
    //推荐战队&&挑战达人
    [self createRecommentView];
    //最近约战&&中奖约战
    [self recentlyView];
    
}
//top
- (void)createTopView
{
    topScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 150)];
    topScrollView.contentSize = CGSizeMake(kScreenWidth * 3, 150);
    topScrollView.delegate = self;
    topScrollView.pagingEnabled = YES;
    topScrollView.bounces = NO;
    topScrollView.showsHorizontalScrollIndicator = NO;
    topScrollView.showsVerticalScrollIndicator = NO;
    [bgView addSubview:topScrollView];
    for (int i = 0; i < 3; i ++) {
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth * i, 0, kScreenWidth, topScrollView.height)];
        [imgView sd_setImageWithURL:[NSURL URLWithString:self.topImgData[i]]];
        [topScrollView addSubview:imgView];
    }
    //创建pageCtrl
    pageCtrl = [[UIPageControl alloc]initWithFrame:CGRectMake(kScreenWidth - 100, topScrollView.height - 40, 100, 40)];
    pageCtrl.numberOfPages = 3;
    pageCtrl.pageIndicatorTintColor = [UIColor lightGrayColor];
    pageCtrl.currentPageIndicatorTintColor = [UIColor cyanColor];
    [pageCtrl addTarget:self action:@selector(pageCtrlAction:) forControlEvents:UIControlEventValueChanged];
    [bgView addSubview:pageCtrl];
}
//center
- (void)createCenterView
{
    centerBgView = [[UIView alloc]initWithFrame:CGRectMake(0, topScrollView.bottom, kScreenWidth, 130)];
    centerBgView.backgroundColor = [UIColor clearColor];
    [bgView addSubview:centerBgView];
    
    NSArray *imgNames = @[@"btn_yuezhan.png",@"btn_yingzhan.png",@"btn_yuezhan.png"];
    for (int i = 0; i < 2; i ++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag = 500 + i;
        btn.frame = CGRectMake(((kScreenWidth - 60)/2 + 20) * i + 20, 10, (kScreenWidth - 60)/2, 110);
        [btn setBackgroundImage:[UIImage imageNamed:imgNames[i]] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [centerBgView addSubview:btn];
    }
}
//推荐战队&&挑战达人
- (void)createRecommentView
{
    recommendView = [[UIView alloc]initWithFrame:CGRectMake(0, centerBgView.bottom, kScreenWidth, 150)];
    recommendView.backgroundColor = [UIColor whiteColor];
    [bgView addSubview:recommendView];
    
    //推荐战队
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"推荐战队" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(recommentBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(0, 0, kScreenWidth/2, 45);
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.selected = YES;
    btn.tag = 504;
    btn.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    [btn setTitleColor:[UIColor cyanColor] forState:UIControlStateSelected];
    [recommendView addSubview:btn];
    
    //挑战达人
    UIButton *challengeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    challengeBtn.selected = NO;
    challengeBtn.tag = 505;
    [challengeBtn setTitle:@"挑战达人" forState:UIControlStateNormal];
    challengeBtn.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    challengeBtn.backgroundColor = [UIColor clearColor];
    challengeBtn.frame = CGRectMake(kScreenWidth / 2, 0, kScreenWidth/2, 45);
    [challengeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [challengeBtn setTitleColor:[UIColor cyanColor] forState:UIControlStateSelected];
    [challengeBtn addTarget:self action:@selector(challengeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [recommendView addSubview:challengeBtn];
    
    //分割线
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, challengeBtn.bottom, kScreenWidth, 1)];
    lineView.backgroundColor = [UIColor lightGrayColor];
    [recommendView addSubview:lineView];
    
    UIView *selectedView = [[UIView alloc]initWithFrame:CGRectMake(0, challengeBtn.bottom, kScreenWidth/2, 2)];
    selectedView.tag = 506;
    selectedView.backgroundColor = [UIColor cyanColor];
    [recommendView addSubview:selectedView];
    //创建collectionView
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(80, 100);
    flowLayout.minimumInteritemSpacing = 10;
    flowLayout.minimumLineSpacing = 10;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    recommentCollectionV = [[RecommentCollectionView alloc]initWithFrame:CGRectMake(0, selectedView.bottom, kScreenWidth, 100) collectionViewLayout:flowLayout];
    recommentCollectionV.bounces = NO;
    recommentCollectionV.showsHorizontalScrollIndicator = NO;
    recommentCollectionV.showsVerticalScrollIndicator = NO;
    recommentCollectionV.data = self.commentData;
    [recommendView addSubview:recommentCollectionV];
    
}
//最近约战&&中奖约战
- (void)recentlyView
{
    recentlyView = [[UIView alloc]initWithFrame:CGRectMake(0, recommendView.bottom + 15, kScreenWidth, 100)];
    recentlyView.backgroundColor = [UIColor whiteColor];
    [bgView addSubview:recentlyView];
    
    //最近约战
    UIButton *recentlyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [recentlyBtn setTitle:@"最近约战" forState:UIControlStateNormal];
    [recentlyBtn addTarget:self action:@selector(recentBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    recentlyBtn.frame = CGRectMake(0, 0, kScreenWidth/2, 45);
    [recentlyBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    recentlyBtn.selected = YES;
    recentlyBtn.tag = 511;
    recentlyBtn.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    [recentlyBtn setTitleColor:[UIColor cyanColor] forState:UIControlStateSelected];
    [recentlyView addSubview:recentlyBtn];
    
    //中奖约战
    UIButton *prizeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    prizeBtn.tag = 512;
    prizeBtn.selected = NO;
    [prizeBtn setTitle:@"中奖约战" forState:UIControlStateNormal];
    prizeBtn.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    prizeBtn.backgroundColor = [UIColor clearColor];
    prizeBtn.frame = CGRectMake(kScreenWidth / 2, 0, kScreenWidth/2, 45);
    [prizeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [prizeBtn setTitleColor:[UIColor cyanColor] forState:UIControlStateSelected];
    [prizeBtn addTarget:self action:@selector(prizeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [recentlyView addSubview:prizeBtn];
    
    //分割线
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, prizeBtn.bottom, kScreenWidth, 1)];
    lineView.backgroundColor = [UIColor lightGrayColor];
    [recentlyView addSubview:lineView];
    
    UIView *selectedView = [[UIView alloc]initWithFrame:CGRectMake(0, prizeBtn.bottom, kScreenWidth/2, 2)];
    selectedView.tag = 513;
    selectedView.backgroundColor = [UIColor cyanColor];
    [recentlyView addSubview:selectedView];
    
    //FightTableView
    fightTableView = [[FightTableView alloc]initWithFrame:CGRectMake(0, selectedView.bottom , kScreenWidth, 0) style:UITableViewStylePlain];
    fightTableView.data = self.recentData;
    [recentlyView addSubview:fightTableView];
    
    if (self.recentData.count != 0) {
        fightTableView.data = self.recentData;
        bgView.contentSize = CGSizeMake(kScreenWidth,kScreenHeight - 49 - 64 + _recentData.count * 80 - 60);
        fightTableView.height = 80 * self.recentData.count;
        [fightTableView reloadData];
    }
}
- (void)pageCtrlAction:(UIPageControl *)pageControl
{
    CGFloat width = pageCtrl.currentPage * kScreenWidth;
    topScrollView.contentOffset = CGPointMake(width, 0);
}
#pragma mark -处理数据
- (void)requestData
{
    //头部图片数据
    NSDictionary *dataDic = [DataService requestDataWithFileName:kSameCityTopImage];
    NSArray *dataArr = [dataDic objectForKey:@"data"];
    NSMutableArray *mArr = [NSMutableArray array];
    for (NSDictionary *dic in dataArr) {
        NSString *imgName = [dic objectForKey:@"img_attachment.attachmentPath"];
        [mArr addObject:imgName];
    }
    _topImgData = mArr;
    [self reloadInputViews];
    
    //挑战数据
    NSDictionary *challengeDic = [DataService requestDataWithFileName:kChanllengeDaRen];
    NSArray *challengeArr = [challengeDic objectForKey:@"data"];
    NSMutableArray *chArr = [NSMutableArray array];
    for (NSDictionary *dic in challengeArr) {
        TeamModel *teamModel = [[TeamModel alloc]initContentWithDic:dic];
        [chArr addObject:teamModel];
    }
    self.challengeData = chArr;
    [recommentCollectionV reloadData];
    
    //推荐数据
    NSDictionary *recommentDic = [DataService requestDataWithFileName:kRecomment];
    NSArray *recommentArr = [recommentDic objectForKey:@"data"];
    NSMutableArray *reArr = [NSMutableArray array];
    for (NSDictionary *dic in recommentArr) {
        TeamModel *teamModel = [[TeamModel alloc]initContentWithDic:dic];
        [reArr addObject:teamModel];
    }
    self.commentData = reArr;
    //最近约战数据
    NSDictionary *recentDic = [DataService requestDataWithFileName:kRecentFight];
    NSArray *recentArr = [recentDic objectForKey:@"data"];
    NSMutableArray *fightArr = [NSMutableArray array];
    for (NSDictionary *dic in recentArr) {
        FightModel *fightModel = [[FightModel alloc]initContentWithDic:dic];
        [fightArr addObject:fightModel];
    }
    self.recentData = fightArr;
    //中奖约战数据
    
    NSDictionary *prizeDic = [DataService requestDataWithFileName:kPrizaFight];
    NSArray *prizeArr = [prizeDic objectForKey:@"data"];
    NSMutableArray *pArr = [NSMutableArray array];
    for (NSDictionary *dic in prizeArr) {
        FightModel *fightModel = [[FightModel alloc]initContentWithDic:dic];
        [pArr addObject:fightModel];
    }
    self.prizeData = pArr;
}

#pragma mark -UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger page = scrollView.contentOffset.x/kScreenWidth;
    pageCtrl.currentPage = page;
}

#pragma mark -CenterBtnClick
- (void)btnClick:(UIButton *)btn
{
    if (btn.tag == 500) {
        //我要约战
    }else{
        //我要应战
    }
}
#pragma mark -recommentBtnClick
//推荐战队
- (void)recommentBtnClick:(UIButton *)btn
{
    btn.selected = YES;
    UIButton *chBtn = (UIButton *)[recommendView viewWithTag:505];
    chBtn.selected = NO;
    UIView *selectedView = [recommendView viewWithTag:506];
    selectedView.left = 0;
    recommentCollectionV.data = self.commentData;
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:0];
    [recommentCollectionV scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
    [recommentCollectionV reloadData];
}
//挑战达人
- (void)challengeBtnClick:(UIButton *)btn
{
    btn.selected = YES;
    UIButton *reBtn = (UIButton *)[recommendView viewWithTag:504];
    reBtn.selected = NO;
    UIView *selectedView = [recommendView viewWithTag:506];
    selectedView.left = kScreenWidth/2;
    recommentCollectionV.data = self.challengeData;
    [recommentCollectionV reloadData];
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:0];
    [recommentCollectionV scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
}
//最近约战
- (void)recentBtnClick:(UIButton *)btn
{
    UIButton *prizeBtn = (UIButton *)[recentlyView viewWithTag:512];
    prizeBtn.selected = NO;
    btn.selected = YES;
    UIView *selectedView = [recentlyView viewWithTag:513];
    selectedView.left = 0;
    fightTableView.data = self.recentData;
    [fightTableView reloadData];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [fightTableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionNone animated:YES];
    if (self.recentData.count != 0) {
        fightTableView.height = 80 * self.recentData.count;
        fightTableView.data = self.recentData;
        bgView.contentSize = CGSizeMake(kScreenWidth,kScreenHeight - 64 - 49 + 80 * _recentData.count - 60);
        [fightTableView reloadData];
    }
    
}
- (void)prizeBtnClick:(UIButton *)btn
{
    UIButton *recentBtn = (UIButton *)[recentlyView viewWithTag:511];
    recentBtn.selected = NO;
    btn.selected = YES;
    UIView *selectedView = [recentlyView viewWithTag:513];
    selectedView.left = kScreenWidth/2;

    //传递数据
    fightTableView.data = self.prizeData;
    [fightTableView reloadData];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [fightTableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionNone animated:NO];
    
    if (self.prizeData.count != 0) {
        fightTableView.height = 80 * self.prizeData.count;
        fightTableView.data = self.prizeData;
        bgView.contentSize = CGSizeMake(kScreenWidth,kScreenHeight - 64 - 49 + _prizeData.count * 80 - 60);
        [fightTableView reloadData];
    }
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

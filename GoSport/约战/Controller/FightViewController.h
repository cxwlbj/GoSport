//
//  FightViewController.h
//  GoSport
//
//  Created by imac on 15/9/26.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "BaseViewController.h"
#import "RecommentCollectionView.h"
#import "FightTableView.h"

@interface FightViewController : BaseViewController<UIScrollViewDelegate>
{
    //背景视图
    UIScrollView *bgView;
    //top
    UIScrollView *topScrollView;
    //top - pageCtrl
    UIPageControl *pageCtrl;
    //center
    UIView *centerBgView;
    //推荐战队
    UIView *recommendView;
    RecommentCollectionView *recommentCollectionV;
    
    //最近约战
    UIView *recentlyView;
    
    //tableView
    FightTableView *fightTableView;
    
    
}
@property (nonatomic,strong)NSArray *topImgData;
@property (nonatomic,strong)NSArray *challengeData;
@property (nonatomic,strong)NSArray *commentData;
@property (nonatomic,strong)NSArray *recentData;
@property (nonatomic,strong)NSArray *prizeData;


@end

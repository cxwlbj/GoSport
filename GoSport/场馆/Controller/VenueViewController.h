//
//  VenueViewController.h
//  GoSport
//
//  Created by imac on 15/9/26.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "BaseViewController.h"
#import "VenueTableView.h"

@interface VenueViewController : BaseViewController<UIScrollViewDelegate>
{

    //总视图tabelView
    VenueTableView *_totalTableView;

    //头视图
    //top滑动视图
    UIScrollView *_topScrollView;
    //分页视图
    UIPageControl *pageCtrl;
    //中间的两个按钮
    UIButton *_freeBtn;
    UIButton *_specialBtn;
}
@property (nonatomic,strong)NSArray *venueData;
@end

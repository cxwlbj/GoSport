//
//  VDetailViewController.h
//  GoSport
//
//  Created by imac on 15/9/29.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "BaseViewController.h"
#import "VenueModel.h"
#import "DetailCollectionView.h"
#import "DetailTableView.h"
@interface VDetailViewController : BaseViewController<UIScrollViewDelegate>
{
    DetailTableView *detailTableView;
    UIView *headerView;
    VenueModel *venueModel;
    UIView *selectedView;
    DetailCollectionView *detailCollectionV;
}
@property (nonatomic,strong)VenueModel *model;
@end

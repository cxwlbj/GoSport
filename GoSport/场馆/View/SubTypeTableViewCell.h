//
//  SubTypeTableViewCell.h
//  GoSport
//
//  Created by imac on 15/9/29.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VenueModel.h"
#import "StarView.h"

@interface SubTypeTableViewCell : UITableViewCell

@property (nonatomic,strong)VenueModel *model;//数据

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *freeImgView;
@property (weak, nonatomic) IBOutlet UIImageView *huiImgView;


@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@property (weak, nonatomic) IBOutlet UIImageView *picimgView;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;


@property (weak, nonatomic) IBOutlet UILabel *typeLabel;

@property (weak, nonatomic) IBOutlet UILabel *areaLabel;
@property (weak, nonatomic) IBOutlet StarView *starView;


@end

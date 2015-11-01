//
//  FightTableViewCell.h
//  GoSport
//
//  Created by imac on 15/10/4.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FightModel.h"

@interface FightTableViewCell : UITableViewCell

@property (nonatomic,strong)FightModel *model;

@property (weak, nonatomic) IBOutlet UIImageView *userImgView;
//等级
@property (weak, nonatomic) IBOutlet UIImageView *rankImgView;

@property (weak, nonatomic) IBOutlet UILabel *rankLabel;
@property (weak, nonatomic) IBOutlet UIImageView *typeImgVIew;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UILabel *sexAgeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *prizeImgView;

@end

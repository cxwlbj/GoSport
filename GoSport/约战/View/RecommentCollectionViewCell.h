//
//  RecommentCollectionViewCell.h
//  GoSport
//
//  Created by imac on 15/10/4.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TeamModel.h"

@interface RecommentCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *levelImgView;

@property (weak, nonatomic) IBOutlet UILabel *levelLabel;

@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;

@property (weak, nonatomic) IBOutlet UIImageView *userImgView;
@property (nonatomic,strong)TeamModel *teamModel;

@end

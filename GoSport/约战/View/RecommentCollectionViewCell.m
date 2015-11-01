//
//  RecommentCollectionViewCell.m
//  GoSport
//
//  Created by imac on 15/10/4.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "RecommentCollectionViewCell.h"

@implementation RecommentCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
    _userImgView.layer.cornerRadius = 30;
    _userImgView.layer.masksToBounds = YES;

    _levelImgView.hidden = YES;
    _levelLabel.hidden = YES;

}
- (void)setTeamModel:(TeamModel *)teamModel
{
    if (_teamModel != teamModel) {
        _teamModel = teamModel;
        [self setNeedsLayout];
        
    }
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    _userNameLabel.text = self.teamModel.name;
    if (self.teamModel.imgStr.length != 0) {
        [_userImgView sd_setImageWithURL:[NSURL URLWithString:self.teamModel.imgStr]];
//        NSLog(@b"%@",self.teamModel.imgStr);
    }else
    {
        _userImgView.image = [UIImage imageNamed:@"default_team.png"];
    }
    if (self.teamModel.levelName.length != 0) {
        _levelLabel.hidden = NO;
        _levelImgView.hidden = NO;
        _levelLabel.text = self.teamModel.levelName;
        NSString *imgName = [NSString stringWithFormat:@"ico_team_v%@.png",self.teamModel.levelID];
        _levelImgView .image = [UIImage imageNamed:imgName];
    }else
    {
        _levelImgView.hidden = YES;
        _levelLabel.hidden = YES;
    }
    
}

@end

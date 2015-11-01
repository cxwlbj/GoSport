//
//  FightTableViewCell.m
//  GoSport
//
//  Created by imac on 15/10/4.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "FightTableViewCell.h"

@implementation FightTableViewCell

- (void)awakeFromNib {
    // Initialization code
    _userImgView.layer.cornerRadius = 30;
    _userImgView.layer.masksToBounds = YES;
    
    _rankImgView.hidden = YES;
    _rankLabel.hidden = YES;
    
    _sexAgeLabel.layer.cornerRadius = 10;
    _sexAgeLabel.layer.masksToBounds = YES;
}
- (void)setModel:(FightModel *)model
{
    if (_model != model) {
        _model = model;
        [self setNeedsLayout];
    }
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    _nameLabel.text = _model.title;
    if (_model.imgUrl.length == 0) {
        _userImgView.image = [UIImage imageNamed:@"default_team.png"];
    }else
    {
        [_userImgView sd_setImageWithURL:[NSURL URLWithString:_model.imgUrl]];
    }
    
    _locationLabel.text = _model.shopName;
    _timeLabel.text = _model.warTime;
    
    NSString *sexAgeStr = [NSString stringWithFormat:@"%@   %@",_model.homeSex,_model.homeAge];
    _sexAgeLabel.text = sexAgeStr;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

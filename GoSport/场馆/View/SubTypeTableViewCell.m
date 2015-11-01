//
//  SubTypeTableViewCell.m
//  GoSport
//
//  Created by imac on 15/9/29.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "SubTypeTableViewCell.h"

@implementation SubTypeTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    _titleLabel.font = [UIFont systemFontOfSize:16];
    _addressLabel.numberOfLines = 0;
}
- (void)setModel:(VenueModel *)model
{
    if (_model != model) {
        _model = model;
        [self setNeedsLayout];
    }
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    _distanceLabel.text = self.model.distance;
    _titleLabel.text = self.model.name;
    [_picimgView sd_setImageWithURL:[NSURL URLWithString:self.model.imgURL]];
    _addressLabel.text = [NSString stringWithFormat:@"地址%@",self.model.address];
    _typeLabel.text = self.model.project;
    _areaLabel.text = self.model.areaText;
    //处理优惠和免费
    if ([self.model.isFree integerValue] != 1) {
        //隐藏
        _freeImgView.hidden = YES;
        if ([self.model.isYouHui integerValue] != 1) {
            _huiImgView.hidden = YES;
        }else
        {
            _huiImgView.hidden = NO;
        }
    }else
    {
        _freeImgView.hidden = NO;
        if ([self.model.isYouHui integerValue] != 1) {
            _huiImgView.hidden = YES;
            _freeImgView.left = _huiImgView.left;
        }else
        {
            _huiImgView.hidden = NO;
        }
    }
    CGFloat rating = [self.model.rate floatValue]/5;
    _starView.rating = rating;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    

    // Configure the view for the selected state
}

@end

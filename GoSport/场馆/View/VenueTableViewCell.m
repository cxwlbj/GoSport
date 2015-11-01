
//
//  VenueTableViewCell.m
//  GoSport
//
//  Created by imac on 15/9/28.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "VenueTableViewCell.h"

@implementation VenueTableViewCell

- (void)awakeFromNib {
    // Initialization code
    _imgView.image = [UIImage imageNamed:@"shop_default.png"];
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

    _titleLabel.text = self.model.name;
    NSString *imgUrl = self.model.imgURL;
    [_imgView sd_setImageWithURL:[NSURL URLWithString:imgUrl]];
    _addressLabel.text = [NSString stringWithFormat:@"地址：%@",self.model.address];
    _areaLabel.text = self.model.area;
    _typeLabel.text = self.model.project;
    
    _distanceLabel.text = self.model.distance;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

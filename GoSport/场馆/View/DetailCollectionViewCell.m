//
//  DetailCollectionViewCell.m
//  GoSport
//
//  Created by imac on 15/9/30.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "DetailCollectionViewCell.h"

@implementation DetailCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)setItem:(SupportItem *)item
{
    if (_item != item) {
        _item = item;
        [self setNeedsLayout];
    }
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.dateLabel.text = [NSString stringWithFormat:@"%@ %@",self.item.week,self.item.date];
    _leftLabel.text = [NSString stringWithFormat:@"%@",self.item.count];
    _freeLabel.text = [NSString stringWithFormat:@"%@",self.item.freeCount];
    _huiLabel.text = [NSString stringWithFormat:@"%@",self.item.saleCount];
}

@end

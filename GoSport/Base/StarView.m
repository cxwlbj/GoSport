//
//  StarView.m
//  GoSport
//
//  Created by imac on 15/10/6.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "StarView.h"

@implementation StarView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //创建视图
        [self _initViews];
    }
    return self;
}
- (void)awakeFromNib
{
    [super awakeFromNib];
    [self _initViews];
}

- (void)_initViews
{
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 55, 11)];
    [self addSubview:bgView];
    UIImage *grayImg = [UIImage imageNamed:@"star_dark.png"];
    UIImage *yellowImg = [UIImage imageNamed:@"star_bright.png"];
    
    grayImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 55, 11)];
    grayImgView.backgroundColor = [UIColor colorWithPatternImage:grayImg];
    [bgView addSubview:grayImgView];
    
    yellowImgView = [[UIImageView alloc]initWithFrame:CGRectZero];
    yellowImgView.backgroundColor = [UIColor colorWithPatternImage:yellowImg];
    [bgView addSubview:yellowImgView];
    
    CGFloat scale = self.height/bgView.height;
    bgView.transform = CGAffineTransformMakeScale(scale, scale);
    bgView.origin = CGPointZero;
}
- (void)setRating:(CGFloat)rating
{
    if (_rating != rating) {
        _rating = rating;
        [self setNeedsLayout];
    }
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    yellowImgView.width = grayImgView.width * _rating;
//    NSLog(@"%.2f",grayImgView.width);
    yellowImgView.frame = CGRectMake(0, 0,grayImgView.width * _rating, grayImgView.height);
    yellowImgView.origin = CGPointZero;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

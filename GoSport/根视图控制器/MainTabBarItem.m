//
//  MainTabBarItem.m
//  Sport
//
//  Created by imac on 15/9/26.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "MainTabBarItem.h"

@implementation MainTabBarItem

- (instancetype)initWithFrame:(CGRect)frame ImgFrame:(CGRect)imgFrame ImgName:(NSString *)imgName highLightImgName:(NSString *)hImgName Title:(NSString *)title TitleFontSize:(NSInteger)size titleColor:(UIColor *)color titleHighLightColor:(UIColor*)hcolor
{
    self = [super initWithFrame:frame];
    if (self) {
        //创建图片视图
        _imgView = [[UIImageView alloc]initWithFrame:imgFrame];
        _imgView.contentMode = UIViewContentModeScaleAspectFit;
        _imgView.image = [UIImage imageNamed:imgName];
        _imgView.highlightedImage = [UIImage imageNamed:hImgName];
        [self addSubview:_imgView];
        //创建标签
        _label = [[UILabel alloc]initWithFrame:CGRectMake(0, _imgView.bottom, self.width,15)];
        _label.text = title;
        _label.textAlignment = NSTextAlignmentCenter;
        _label.textColor = color;
        _label.highlightedTextColor = hcolor;
        _label.font = [UIFont systemFontOfSize:size];
        [self addSubview:_label];        
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

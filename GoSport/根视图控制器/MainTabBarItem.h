//
//  MainTabBarItem.h
//  Sport
//
//  Created by imac on 15/9/26.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainTabBarItem : UIControl

@property (nonatomic,strong)UIImageView *imgView;
@property (nonatomic,strong)UILabel *label;

- (instancetype)initWithFrame:(CGRect)frame ImgFrame:(CGRect)imgFrame ImgName:(NSString *)imgName highLightImgName:(NSString *)hImgName Title:(NSString *)title TitleFontSize:(NSInteger)size titleColor:(UIColor *)color titleHighLightColor:(UIColor *)hcolor;
@end

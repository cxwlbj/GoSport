//
//  FirstOpenView.m
//  GoSport
//
//  Created by imac on 15/10/6.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "FirstOpenView.h"
#import "CitysViewController.h"

@implementation FirstOpenView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //
        [self _creatViews];
    }
    return self;
}
- (void)_creatViews
{
    //创建启动界面
    NSArray *imgNames = @[@"FirstUse_bg_01.jpg",@"FirstUse_bg_02.jpg",@"FirstUse_bg_03.jpg"];
    UIScrollView *beginScrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
    beginScrollView.contentSize = CGSizeMake(imgNames.count * kScreenWidth, kScreenHeight);
    beginScrollView.bounces = NO;
    beginScrollView.pagingEnabled = YES;
    beginScrollView.showsHorizontalScrollIndicator = NO;
    beginScrollView.showsVerticalScrollIndicator = NO;
    beginScrollView.delegate = self;
    [self addSubview:beginScrollView];
    
    for (int i = 0; i < 3; i ++) {
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth * i, 0, kScreenWidth, kScreenHeight)];
        NSString *imgName = imgNames[i];
        imgView.image = [UIImage imageNamed:imgName];
        [beginScrollView addSubview:imgView];
        if (i == 2) {
            imgView.userInteractionEnabled = YES;
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake((kScreenWidth - 150)/2, kScreenHeight - 150, 120, 30);
            [btn setTitle:@"立即体验" forState:UIControlStateNormal];
            btn.backgroundColor = [UIColor whiteColor];
            UIColor *titleColor = [UIColor colorWithRed:0.3 green:0.5 blue:1 alpha:1];
            btn.titleLabel.font = [UIFont systemFontOfSize:24];
            [btn setTitleColor:titleColor forState:UIControlStateNormal];
            btn.layer.cornerRadius = 4;
            btn.layer.masksToBounds = YES;
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            [imgView addSubview:btn];
        }
    }
}
- (void)btnClick:(UIButton *)btn
{
    
    CitysViewController *cityVC = [[CitysViewController alloc]init];
    [self.viewController.navigationController pushViewController:cityVC animated:YES];
    [UIView animateWithDuration:0.35 animations:^{
        self.right -= kScreenWidth;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
#pragma mark - UIScrollViewDelegate

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

//
//  TypeControl.m
//  GoSport
//
//  Created by imac on 15/9/26.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "TypeControl.h"

@implementation TypeControl

- (instancetype)initWithFrame:(CGRect)frame imgUrlStr:(NSString *)urlStr title:(NSString *)title
{
    self = [super initWithFrame:frame];
    if (self) {
        //
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake((self.width - 40)/2, 0, 40, 40)];
        imgView.contentMode = UIViewContentModeScaleAspectFit;
        [imgView sd_setImageWithURL:[NSURL URLWithString:urlStr]];
        [self addSubview:imgView];
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 40, self.width, 20)];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = [UIFont systemFontOfSize:16];
        titleLabel.textColor = [UIColor blackColor];
        titleLabel.text = title;
        [self addSubview:titleLabel];
        
        
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

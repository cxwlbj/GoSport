//
//  DetailTableView.m
//  GoSport
//
//  Created by imac on 15/9/30.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "DetailTableView.h"
#import "ShopItems.h"
#import "ShopCheckin.h"
#import "ShopReview.h"
#import "SearchViewController.h"
#import "StarView.h"
#import "LocationViewController.h"

@implementation DetailTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        //
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}
#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    //创建cell
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    switch (indexPath.row) {
        case 0:
        {
            //地址
            UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(10, (44 - 28)/2, 18, 28)];
            imgView.image = [UIImage imageNamed:@"ico-position.png"];
            [cell.contentView addSubview:imgView];
            UILabel *addressLabel = [[UILabel alloc]initWithFrame:CGRectMake(imgView.right + 10, imgView.top, 300, imgView.height)];
            addressLabel.text = self.model.address;
            addressLabel.textColor = [UIColor blackColor];
            addressLabel.font = [UIFont systemFontOfSize:14];
            [cell.contentView addSubview:addressLabel];
            UIImageView *arrowView = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth - 25, (cell.height - 23)/2, 15, 23)];
            arrowView.image = [UIImage imageNamed:@"hyzx_jiantou.png"];
            [cell.contentView addSubview:arrowView];
            break;
        }
        case 1:
        {
            //电话
            UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(10, (cell.height - 22)/2, 22, 22)];
            imgView.image = [UIImage imageNamed:@"ico-phone.png"];
            [cell.contentView addSubview:imgView];
            
            UILabel *phoneLabel = [[UILabel alloc]initWithFrame:CGRectMake(imgView.right + 10, imgView.top, 300, imgView.height)];
            phoneLabel.text = self.model.phone;
            [cell.contentView addSubview:phoneLabel];
            
            break;
        }
        case 2:
        {
            //场馆服务
            //处理数据
            NSArray *shopitem = self.model.shopItems;
            NSArray *imgNames = @[@"ico_fenlei.png",@"ico-price.png",@"ico-tese.png"];
            CGFloat height = 0;
            for (int i = 0; i < shopitem.count; i++) {
                //创建背景视图
                UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 0)];
                [cell.contentView addSubview:bgView];

                UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(10, height + 10, 13, 14)];
                imgView.image = [UIImage imageNamed:imgNames[i]];
                [bgView addSubview:imgView];
                //创建label
                UILabel *serviceLabel = [[UILabel alloc]initWithFrame:CGRectMake(imgView.right + 10, imgView.top, 300, imgView.height)];
                ShopItems *item = shopitem[i];
                serviceLabel.font = [UIFont systemFontOfSize:14];
                serviceLabel.text = item.itemType;
                [bgView addSubview:serviceLabel];
                UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(10, serviceLabel.bottom + 10, kScreenWidth - 20, 1)];
                lineView.backgroundColor = [UIColor colorWithRed:0 green:0.5 blue:0.9 alpha:0.5];
                [bgView addSubview:lineView];
                height += 34;
//                NSLog(@"%.2f",height);
                
                if (i == 0) {
                    //场馆服务
                    NSString *str = item.itemContent;
                    NSArray *arr = [str componentsSeparatedByString:@","];
                    for (int j = 0;j < arr.count;j++) {
                        NSInteger row = j/3;
                        NSInteger column = j % 3;
                        
                        CGFloat width = (kScreenWidth - 4 * 10)/3;
                        UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake((10 + width) * column + 10, 10 + 30 * row + height, width, 25)];
                        NSString *imgName = [NSString stringWithFormat:@"%@.png",arr[j]];
                        imgView.image = [UIImage imageNamed:imgName];
                        [bgView addSubview:imgView];
                    }
                    bgView.height = height + ((arr.count - 1)/2 + 1) * 30;
                    height = bgView.height;
                    
                }else if (i == 1)
                {
                    //场地价格
                    UILabel *priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(10,lineView.bottom + 10, kScreenWidth - 20, 0)];
                    NSString *priceStr = item.itemContent;
                    priceLabel.text = priceStr;
                    priceLabel.textColor = [UIColor grayColor];
                    priceLabel.numberOfLines = 0;
                    priceLabel.font = [UIFont systemFontOfSize:14];
                    CGRect rect = [priceStr boundingRectWithSize:CGSizeMake(kScreenWidth - 20, 10000)
                                                         options:NSStringDrawingUsesLineFragmentOrigin
                                                      attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}
                                                         context:nil];
                    priceLabel.height = rect.size.height;
                    [bgView addSubview:priceLabel];
                    bgView.height = height + rect.size.height;
                    height = bgView.height;
                }else if(i == 2)
                {
                    //场馆特色
                    NSString *specialStr = item.itemContent;
                    NSArray *specialArr = [specialStr componentsSeparatedByString:@","];
                    for (int j = 0;j < specialArr.count;j++) {
                        NSInteger row = j/3;
                        NSInteger column = j % 3;
                        CGFloat width = (kScreenWidth - 10 * 4)/3;
                        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake((width + 10) * column + 10, 10 + 30 * row + height, 100, 25)];
                        label.text = specialArr[j];
                        label.textColor = [UIColor whiteColor];
                        label.textAlignment = NSTextAlignmentCenter;
                        label.backgroundColor = [UIColor colorWithRed:arc4random() % 10 * 0.1 green:arc4random() % 10 * 0.1 blue:arc4random() % 10 * 0.1 alpha:1];
                        [bgView addSubview:label];
                    }
                    bgView.height = height + ((specialArr.count - 1)/2 ) * 30;
                    height = bgView.height;
                }
            }
            break;
        }
        case 3:
        {
            //用户评价
            UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 13 ,14 )];
            imgView.image = [UIImage imageNamed:@"ico_comment.png"];
            [cell.contentView addSubview:imgView];
            UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(imgView.right +10,imgView.top, 100, imgView.height)];
            titleLabel.text = @"用户评价";
            titleLabel.font = [UIFont systemFontOfSize:14];
            [cell.contentView addSubview:titleLabel];
             StarView *starView = [[StarView alloc]initWithFrame:CGRectMake(titleLabel.right + 10, imgView.top, 75, 15)];
            starView.rating = 4.1/5;
            [cell.contentView addSubview:starView];
            //评分label
            UILabel *ratingLabel = [[UILabel alloc]initWithFrame:CGRectMake(starView.right, starView.top, 50, starView.height)];
            ratingLabel.text = @"4.1";
            [cell.contentView addSubview:ratingLabel];
            UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(imgView.left, imgView.bottom + 10, kScreenWidth - 2 * imgView.left, 1)];
            lineView.backgroundColor = [UIColor cyanColor];
            [cell.contentView addSubview:lineView];
            //用户评价
            for (int i = 0; i < 2; i++) {
                //Name
                UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, lineView.bottom + 50 * i, 100, 20)];
                ShopReview *shopReview = _model.shopReviews[i];
                nameLabel.text = shopReview.userName;
                nameLabel.font = [UIFont systemFontOfSize:14];
                [cell.contentView addSubview:nameLabel];
                //time
                UILabel *timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(nameLabel.right + 10, nameLabel.top, 140, nameLabel.height)];
                timeLabel.text = shopReview.postTime;
                timeLabel.font = [UIFont systemFontOfSize:14];
                [cell.contentView addSubview:timeLabel];
                //rating
                StarView *starView = [[StarView alloc]initWithFrame:CGRectMake(timeLabel.right, timeLabel.top + 5, 50, 10)];
                starView.rating = [shopReview.score floatValue]/5;
                [cell addSubview:starView];
                
                //content
                UILabel *contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(10,nameLabel.bottom, kScreenWidth - 20, 50)];
                contentLabel.text = shopReview.content;
                contentLabel.font = [UIFont systemFontOfSize:14];
                contentLabel.textColor = [UIColor grayColor];
                [cell addSubview:contentLabel];
            }
            
            //查看全部评价
            UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [searchBtn setTitle:@"查看所有评价" forState:UIControlStateNormal];
            searchBtn.frame = CGRectMake(kScreenWidth - 150, 150, 100, 30);
            [searchBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            searchBtn.backgroundColor = [UIColor grayColor];
            searchBtn.titleLabel.font = [UIFont systemFontOfSize:14];
            [searchBtn addTarget:self action:@selector(searchBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            [cell addSubview:searchBtn];
            break;
        }
        case 4:
        {
            //签到留言
            UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 13 ,14 )];
            imgView.image = [UIImage imageNamed:@"ico-attend.png"];
            [cell.contentView addSubview:imgView];
            UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(imgView.right +10,imgView.top, 100, imgView.height)];
            titleLabel.text = @"签到留言";
            titleLabel.font = [UIFont systemFontOfSize:14];
            [cell.contentView addSubview:titleLabel];
            
            //分割线
            UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(imgView.left, imgView.bottom + 10, kScreenWidth - 2 * imgView.left, 1)];
            lineView.backgroundColor = [UIColor cyanColor];
            [cell.contentView addSubview:lineView];
            //用户留言
            for (int i = 0; i < 2; i++) {
                //Name
                UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, lineView.bottom + 50 * i, 100, 20)];
                ShopCheckin *shopCheckin = _model.shopCheckins[i];
                nameLabel.text = shopCheckin.userName;
                nameLabel.font = [UIFont systemFontOfSize:14];
                [cell.contentView addSubview:nameLabel];
                //time
                UILabel *timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(nameLabel.right + 10, nameLabel.top, 150, nameLabel.height)];
                timeLabel.text = shopCheckin.checkinTime;
                timeLabel.font = [UIFont systemFontOfSize:14];
                [cell.contentView addSubview:timeLabel];
                
                //content
                UILabel *contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(10,nameLabel.bottom, kScreenWidth - 20, 50)];
                contentLabel.text = shopCheckin.content;
                contentLabel.font = [UIFont systemFontOfSize:14];
                contentLabel.textColor = [UIColor grayColor];
                [cell addSubview:contentLabel];
            }
            
            //查看全部评价
            UIButton *commentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [commentBtn setTitle:@"查看所有评价" forState:UIControlStateNormal];
            commentBtn.frame = CGRectMake(kScreenWidth - 150, 150, 100, 30);
            [commentBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            commentBtn.backgroundColor = [UIColor orangeColor];
            commentBtn.titleLabel.font = [UIFont systemFontOfSize:14];
            [commentBtn addTarget:self action:@selector(commentBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            [cell addSubview:commentBtn];
            break;
        }
        default:
            break;
    }    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 2) {
        return 120 * 3;
    }else if(indexPath.row == 3 ||indexPath.row == 4)
    {
        return 200;
    }
    return 44;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSLog(@"row is %ld",indexPath.row);
    if (indexPath.row == 0) {
        //地图
        LocationViewController *locationVC = [[LocationViewController alloc]init];
        locationVC.title = self.model.name;
        locationVC.model = self.model;
        [self.viewController.navigationController pushViewController:locationVC animated:YES];
        
    }else if(indexPath.row == 1)
    {
        //电话
        

        NSString *phone = [NSString stringWithFormat:@"tel://%@",self.model.phone];
        NSURL *phoneUrl = [NSURL URLWithString:phone];
        if (!callWebView) {
            callWebView = [[UIWebView alloc] initWithFrame:CGRectZero];
        }
        [callWebView loadRequest:[NSURLRequest requestWithURL:phoneUrl]];
        [self addSubview:callWebView];

//        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"tel://10086"]];
        
        
//        NSURL *telURL =[NSURL URLWithString:@"tel:10086"];
//        [callWebview loadRequest:[NSURLRequest requestWithURL:telURL]];
//        //记得添加到view上
//        [self addSubview:callWebview];
    }
}

//查看所有评价
- (void)searchBtnClick:(UIButton *)btn
{
    SearchViewController *searchVC = [[SearchViewController alloc]init];
    [self.viewController.navigationController pushViewController:searchVC animated:YES];
}
//查看所有评论
- (void)commentBtnClick:(UIButton *)btn
{
    SearchViewController *searchVC = [[SearchViewController alloc]init];
    [self.viewController.navigationController pushViewController:searchVC animated:YES];
}
@end

//
//  TeamDetailTableViewController.m
//  GoSport
//
//  Created by imac on 15/10/7.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "TeamDetailTableViewController.h"

@interface TeamDetailTableViewController ()

@end

@implementation TeamDetailTableViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
    //返回按钮
    [self _initleftItem];
    
}
- (void)_initleftItem
{
    //左侧导航btn
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 15, 23);
    [backBtn setImage:[UIImage imageNamed:@"back_button.png"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
}
#pragma mark - backBtnClick
- (void)backBtnClick:(UIButton *)btn
{
    //返回上一级界面
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor whiteColor];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.row == 0) {
        //头像
        UIImageView *userImgView = (UIImageView *)[cell viewWithTag:700];
        userImgView.layer.masksToBounds = YES;
        userImgView.layer.cornerRadius = 40;
        if(self.teamModel.imgStr.length == 0)
        {
            userImgView.image = [UIImage imageNamed:@"default_team.png"];
        }else
        {
            [userImgView sd_setImageWithURL:[NSURL URLWithString:self.teamModel.imgStr]];
        }
        //title
        UILabel *titleLabel = (UILabel *)[cell viewWithTag:701];
        titleLabel.text = self.teamModel.name;
    }
    
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end

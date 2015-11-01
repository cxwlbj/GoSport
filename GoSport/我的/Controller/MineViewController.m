//
//  MineViewController.m
//  GoSport
//
//  Created by imac on 15/9/26.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "StarView.h"
#import "MineViewController.h"
#import "LoginViewController.h"

@interface MineViewController ()
{
    UIView *loginView;
    UIView *afterLoginView;
}
@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"会员中心";
    NSLog(@"%@",self);
    loginView = [[UIView alloc]initWithFrame:self.view.bounds];
    loginView.backgroundColor = [UIColor whiteColor];
    loginView.tag = 800;
    //登录后的界面
    afterLoginView = [self.view viewWithTag:820];
    
    NSString *accessToken = [[NSUserDefaults standardUserDefaults] objectForKey:kaccessToken];
    NSString *uid = [[NSUserDefaults standardUserDefaults] objectForKey:kUid];
    if (accessToken.length != 0 && uid.length != 0) {
        //
        [self.view addSubview:afterLoginView];
    }else
    {
        [self.view addSubview:loginView];
        [self _initLoginView];
        [self.view insertSubview:afterLoginView belowSubview:loginView];

    }
    //创建视图
    [self _initRightItem];
    [self _initAfterLoginView];
    
    

}
- (void)_initRightItem
{
    //rightItem
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 50, 30);
    [btn setTitle:@"设置" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(rightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = item;
}
- (void)_initLoginView
{
    
    //top
    UIImageView *topImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, 130)];
    topImgView.userInteractionEnabled = YES;
    topImgView.image = [UIImage imageNamed:@"usercenter_head.png"];
    [loginView addSubview:topImgView];
    
    //login
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.frame = CGRectMake((kScreenWidth - 113)/2, 30, 113, 40);
    [loginBtn setBackgroundImage:[UIImage imageNamed:@"btn_login.png"] forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(loginBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [topImgView addSubview:loginBtn];
    
    //tip
    UILabel *tipLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 80, kScreenWidth, 20)];
    tipLabel.text = @"登录去运动，享受更多精彩~";
    tipLabel.textColor = [UIColor colorWithRed:0 green:0.2 blue:0.3 alpha:1];
    tipLabel.font = [UIFont systemFontOfSize:14];
    tipLabel.textAlignment = NSTextAlignmentCenter;
    [topImgView addSubview:tipLabel];
    
    //bottom
    UIImageView *bottomImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, topImgView.bottom, kScreenWidth, kScreenWidth)];
    bottomImgView.image = [UIImage imageNamed:@"bg_login_bottom.png"];
    [loginView addSubview:bottomImgView];
    
}
- (void)_initAfterLoginView
{
    UILabel *label = (UILabel *)[afterLoginView viewWithTag:821];
    
    [[UMSocialDataService defaultDataService] requestSnsInformation:UMShareToSina completion:^(UMSocialResponseEntity *response) {
        NSLog(@"%@",response.data.allKeys);
        label.text = [response.data objectForKey:@"screen_name"];
    }];
    
}
- (void)rightBtnClick:(UIButton *)btn
{
    
}
//登录
- (void)loginBtnClick:(UIButton *)btn
{
    LoginViewController *loginVC = [[LoginViewController alloc]init];
    [self.navigationController pushViewController:loginVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

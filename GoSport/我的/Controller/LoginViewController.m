//
//  LoginViewController.m
//  GoSport
//
//  Created by imac on 15/10/9.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "LoginViewController.h"
#import "MineViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"登录";
}
- (IBAction)weixinLogin:(id)sender
{
    
    
    
    
}
- (IBAction)qqLogin:(id)sender {
}
- (IBAction)sinaWeiboLOgin:(id)sender {
    
    //出现登录界面
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToSina];
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
          if (response.responseCode == UMSResponseCodeSuccess) {
              //
              UMSocialAccountEntity *snsAcount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:UMShareToSina];
//              NSLog(@"%@,%@,%@,%@",snsAcount.userName,snsAcount.usid,snsAcount.accessToken,snsAcount.iconURL);
              [[NSUserDefaults standardUserDefaults]setObject:snsAcount.accessToken forKey:kaccessToken];
              [[NSUserDefaults standardUserDefaults] setObject:snsAcount.usid forKey:kUid];
              MineViewController *mineVC = (MineViewController *)self.navigationController.viewControllers[0];
//              NSLog(@"%@",mineVC);
              UIView *loginView = [mineVC.view viewWithTag:800];
              [loginView removeFromSuperview];
              
              [self.navigationController popViewControllerAnimated:YES];
          }
      });

    //在授权完成后调用获取用户信息的方法
//    [[UMSocialDataService defaultDataService] requestSnsInformation:UMShareToSina completion:^(UMSocialResponseEntity *response) {
//        //
////        NSLog(@"SnsInformation is %@",response.data);
//        AfterLoginViewController *afterLoginVC = [[AfterLoginViewController alloc]init];
//        afterLoginVC.data = response.data;
//        NSLog(@"%@",response.data.allKeys);
////        [self.navigationController pushViewController:afterLoginVC animated:YES];
////        [self.navigationController popViewControllerAnimated:YES];
//    }];
//    
    
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

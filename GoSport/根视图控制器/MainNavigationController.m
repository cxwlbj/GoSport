//
//  MainNavigationController.m
//  GoSport
//
//  Created by imac on 15/9/26.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "MainNavigationController.h"
#import "MainTabBarController.h"

@interface MainNavigationController ()

@end

@implementation MainNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.tintColor = [UIColor colorWithRed:0 green:0.7 blue:0.9 alpha:1];
    //设置导航栏的背景颜色
    self.navigationBar.barTintColor = [UIColor colorWithRed:0 green:0.7 blue:0.9 alpha:1];
    //设置标题的颜色
    self.navigationBar.titleTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:16],NSForegroundColorAttributeName:[UIColor whiteColor]};
    self.delegate = self;
    
}
#pragma mark - UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //push到二级界面是，隐藏tabbar
    MainTabBarController *mainTBC = (MainTabBarController *)self.tabBarController;
    if (self.viewControllers.count == 1) {
        mainTBC.tabBar.hidden = NO;
    }else if(self.viewControllers.count == 2)
    {
        mainTBC.tabBar.hidden = YES;
    }
    
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

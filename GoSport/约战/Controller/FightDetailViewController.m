//
//  FightDetailViewController.m
//  GoSport
//
//  Created by imac on 15/10/5.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "FightDetailViewController.h"

@interface FightDetailViewController ()

@end

@implementation FightDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self _initViews];
}
- (void)_initViews
{
    fightNameLabel.text = _model.title;
    UIImage *userImg =[UIImage imageNamed:@"default_team.png"];
    homeImgVIew.layer.cornerRadius = 40;
    homeImgVIew.layer.masksToBounds = YES;
    homeImgVIew.image = userImg;
    homeNameLabel.text = _model.homeUserName;
    guestImgView.layer.cornerRadius = 40;
    guestImgView.layer.masksToBounds = YES;
    guestImgView.image = userImg;
    if (_model.guestUserName.length == 0) {
        guestNameLabel.text = @"无应战战队";
        stateLabel.text = @"待应战";
        stateLabel.textColor = [UIColor orangeColor];
        bottomView.top = prizeView.top;
        prizeView.hidden = YES;
        scoreView.hidden = YES;
        fightBtn.hidden = NO;
    }else
    {
        stateLabel.text = _model.statusName;
        
        prizeView.hidden = NO;
        scoreView.hidden = NO;
        fightBtn.hidden = YES;
        guestNameLabel.text = _model.guestUserName;
        prizeNameLabel.text = _model.award;
        prizeTimeLabel.text = _model.outAwardTime;
        
        homeScoreLabel.text = _model.homeScore;
        guestScoreLabel.text = _model.guestScore;

    }
    winLabel.text = _model.resultName;


    locationLabel.text = _model.shopName;
    timeLabel.text = _model.warTime;
    countLabel.text = [NSString stringWithFormat:@"%@",_model.personNum];
    feeStyleLabel.text = _model.payModeName;
    
    feeLabel.text = [NSString stringWithFormat:@"%@",_model.sitefees];
    
        
    
    
}

- (IBAction)fightBtnClick:(UIButton *)sender {
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

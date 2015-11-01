//
//  FightDetailViewController.h
//  GoSport
//
//  Created by imac on 15/10/5.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "BaseViewController.h"
#import "FightModel.h"

@interface FightDetailViewController : BaseViewController
{
    
    __weak IBOutlet UIView *topView;
    __weak IBOutlet UIView *prizeView;
    __weak IBOutlet UIView *scoreView;
    __weak IBOutlet UIView *bottomView;
    __weak IBOutlet UIImageView *homeImgVIew;
    
    __weak IBOutlet UIImageView *guestImgView;
    
    __weak IBOutlet UIImageView *typeImgView;
    __weak IBOutlet UILabel *guestNameLabel;
    
    __weak IBOutlet UILabel *homeNameLabel;
    

    __weak IBOutlet UILabel *fightNameLabel;
    
    __weak IBOutlet UILabel *winLabel;
    
    
    __weak IBOutlet UILabel *stateLabel;
    
    __weak IBOutlet UILabel *prizeNameLabel;
    __weak IBOutlet UILabel *prizeTimeLabel;
    __weak IBOutlet UIImageView *isPrizeImgView;
    __weak IBOutlet UILabel *homeScoreLabel;
    __weak IBOutlet UILabel *guestScoreLabel;
    __weak IBOutlet UILabel *locationLabel;
    __weak IBOutlet UILabel *timeLabel;
    __weak IBOutlet UILabel *countLabel;
    __weak IBOutlet UILabel *feeLabel;
    __weak IBOutlet UILabel *feeStyleLabel;
    __weak IBOutlet UILabel *regulationLabel;
    
    
    __weak IBOutlet UIButton *fightBtn;
    
}
@property (nonatomic,strong)FightModel *model;

@end

//
//  DetailCollectionViewCell.h
//  GoSport
//
//  Created by imac on 15/9/30.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SupportItem.h"

@interface DetailCollectionViewCell : UICollectionViewCell
@property (nonatomic,strong)SupportItem *item;

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *leftLabel;

@property (weak, nonatomic) IBOutlet UILabel *freeLabel;
@property (weak, nonatomic) IBOutlet UILabel *huiLabel;





@end

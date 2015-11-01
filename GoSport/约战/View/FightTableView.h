//
//  FightTableView.h
//  GoSport
//
//  Created by imac on 15/10/4.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FightTableView : UITableView<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)NSArray *data;

@end

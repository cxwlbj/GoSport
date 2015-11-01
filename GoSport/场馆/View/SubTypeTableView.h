//
//  SubTypeTableView.h
//  GoSport
//
//  Created by imac on 15/9/29.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubTypeTableView : UITableView<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)NSArray *venueData;

@end

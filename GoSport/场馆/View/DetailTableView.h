//
//  DetailTableView.h
//  GoSport
//
//  Created by imac on 15/9/30.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VenueModel.h"

@interface DetailTableView : UITableView<UITableViewDataSource,UITableViewDelegate>
{
    UIWebView *callWebView;
}
@property (nonatomic,strong)VenueModel *model;

@end

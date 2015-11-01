//
//  VenueTableView.h
//  GoSport
//
//  Created by imac on 15/9/28.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VenueModel.h"

@interface VenueTableView : UITableView<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)NSArray *venueData;


@end

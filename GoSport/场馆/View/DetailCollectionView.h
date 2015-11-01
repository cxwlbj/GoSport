//
//  DetailCollectionView.h
//  GoSport
//
//  Created by imac on 15/9/30.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailCollectionView : UICollectionView<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
@property (nonatomic,strong)NSArray *data;

@end

//
//  DetailCollectionView.m
//  GoSport
//
//  Created by imac on 15/9/30.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "DetailCollectionView.h"
#import "DetailCollectionViewCell.h"

@implementation DetailCollectionView
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1];
        self.delegate = self;
        self.dataSource = self;
        self.contentInset = UIEdgeInsetsMake(0, 5, 0, 0);

        //注册单元格
        UINib *nib =[UINib nibWithNibName:@"DetailCollectionViewCell" bundle:nil] ;
        [self registerNib: nib forCellWithReuseIdentifier:@"DetailCollectionCell"];
    }
    return self;
}
- (void)setData:(NSArray *)data
{
    if (_data != data) {
        _data = data;
    }
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.data.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DetailCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DetailCollectionCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.item = self.data[indexPath.row];
    return cell;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

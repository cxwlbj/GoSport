//
//  RecommentCollectionView.m
//  GoSport
//
//  Created by imac on 15/10/4.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "RecommentCollectionView.h"
#import "RecommentCollectionViewCell.h"
#import "TeamDetailTableViewController.h"

@implementation RecommentCollectionView
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.backgroundColor = [UIColor clearColor];
        [self registerNib:[UINib nibWithNibName:@"RecommentCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"RecommentCell"];
    }
    return self;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.data.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    RecommentCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RecommentCell" forIndexPath:indexPath];
    cell.teamModel = self.data[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    TeamModel *teamModel = self.data[indexPath.row];
    UIStoryboard * storyboard =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    TeamDetailTableViewController *teamDetailVC = [storyboard instantiateViewControllerWithIdentifier:@"TeamTable"];
    
    teamDetailVC.teamModel = teamModel;
    [self.viewController.navigationController pushViewController:teamDetailVC animated:YES];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

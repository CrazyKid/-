//
//  BaseCollectionView.m
//  01
//
//  Created by Macx on 15/12/16.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import "BaseCollectionView.h"

@implementation BaseCollectionView

- (instancetype)initWithFrame:(CGRect)frame
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 0;
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        self.backgroundColor = [UIColor clearColor];
        //        self.decelerationRate = 1;
    }
    return self;
}

#pragma mark - collectionView datasoure
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _data.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(_pageWidth, CGRectGetHeight(self.frame));
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(0, (kScreenWidth - _pageWidth) / 2, 0,  (kScreenWidth - _pageWidth) / 2);
}
#pragma mark -scrollView delegate

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    int index = targetContentOffset->x / _pageWidth;
    
    //有问题,还需要改
    //    if (self.currentItem == index) {
    //        if (velocity.x > 2.5) {
    //            index ++;
    //        }
    //        else if (velocity.x < -2.5){
    //            index--;
    //        }
    //    }
    targetContentOffset->x = index * _pageWidth;
    self.currentItem = index;
}

@end

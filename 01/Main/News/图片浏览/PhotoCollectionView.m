//
//  PhotoCollectionView.m
//  01
//
//  Created by Macx on 15/12/14.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import "PhotoCollectionView.h"
#import "PhotoCollectionViewCell.h"
#import "PhotoScrollView.h"
@implementation PhotoCollectionView

- (instancetype)initWithFrame:(CGRect)frame
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.itemSize = CGSizeMake(kScreenWidth, kScreenHeight);
    layout.minimumLineSpacing = 0;

    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.pagingEnabled = YES;
        [self registerClass:[PhotoCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    }
    return self;
}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    PhotoCollectionViewCell *pCell = (PhotoCollectionViewCell *)cell;
    [pCell.scroll setZoomScale:1];

}
#pragma mark - collectionView datasoure
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.image = _images[indexPath.row];
    cell.backgroundColor = [UIColor yellowColor];
    return cell;
}

@end

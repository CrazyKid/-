
//
//  PostCollectionView.m
//  01
//
//  Created by Macx on 15/12/15.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import "PostCollectionView.h"
#import "PostCell.h"
@implementation PostCollectionView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self registerClass:[PostCell class] forCellWithReuseIdentifier:@"cell"];
//        self.decelerationRate = 0;
    }
    return self;
}

#pragma mark - collectionView datasoure


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    PostCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.movieModal = self.data[indexPath.row];

    return cell;
}
-(UICollectionViewCell *)dequeueReusableCellWithReuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath{
   PostCell *cell = [super dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.isBack = NO;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    PostCell *cell = (PostCell *)[collectionView cellForItemAtIndexPath:indexPath];
    if (self.currentItem == indexPath.row) {
        [UIView animateWithDuration:0.3 animations:^{
            [cell changeView];
        }];
    }
    else {
        if (cell.isBack == YES) {
            [UIView animateWithDuration:0.3 animations:^{
                [cell changeView];
            }];
        }
        [UIView animateWithDuration:0.5 animations:^{
            [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
            self.currentItem = (int)indexPath.row;
        }];
    }
}
@end

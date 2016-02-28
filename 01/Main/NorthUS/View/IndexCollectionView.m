//
//  IndexCollectionView.m
//  01
//
//  Created by Macx on 15/12/16.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import "IndexCollectionView.h"
#import "IndexCollectionViewCell.h"
#import "MovieModal.h"
@implementation IndexCollectionView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self registerClass:[IndexCollectionViewCell class] forCellWithReuseIdentifier:@"indexCell"];
    }
    return self;
}

#pragma mark - collectionView datasoure

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    IndexCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"indexCell" forIndexPath:indexPath];
    cell.url = [NSURL URLWithString:[((MovieModal *)self.data[indexPath.row]).images objectForKey:@"medium" ]];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    [UIView animateWithDuration:0.3 animations:^{
        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        self.currentItem = (int)indexPath.row;
    }];
}
@end

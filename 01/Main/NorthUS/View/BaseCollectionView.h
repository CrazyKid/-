//
//  BaseCollectionView.h
//  01
//
//  Created by Macx on 15/12/16.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseCollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,assign)CGFloat pageWidth;
@property (nonatomic,strong)NSArray *data;
@property (nonatomic,assign)NSInteger currentItem;

@end

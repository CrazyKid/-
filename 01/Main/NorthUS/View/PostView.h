//
//  PostView.h
//  01
//
//  Created by Macx on 15/12/15.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PostCollectionView;
@class IndexCollectionView;
@interface PostView : UIView
@property (nonatomic,strong)UIView *topView;
@property (nonatomic,strong)UIControl *allScreen;//点击头视图弹出的半透明control
@property (nonatomic,strong)PostCollectionView *postCollectionView;
@property (nonatomic,strong)NSArray *data;
@property (nonatomic,strong)IndexCollectionView *indexCollectionView;
@property (nonatomic,strong)UILabel *label;
@end

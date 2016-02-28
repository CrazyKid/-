//
//  PostView.m
//  01
//
//  Created by Macx on 15/12/15.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import "PostView.h"
#import "PostCollectionView.h"
#import "IndexCollectionView.h"
#import "MovieModal.h"
@implementation PostView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _createTopView];
        [self _createCollectionView];
        [self _createIndexCollectionView];
        [self _createFootView];
        [_postCollectionView addObserver:self forKeyPath:@"currentItem" options:NSKeyValueObservingOptionNew context:NULL];
        [_indexCollectionView addObserver:self forKeyPath:@"currentItem" options:(NSKeyValueObservingOptionNew) context:NULL];
    }
    return self;
}
#pragma mark -观察者
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{

    if ([keyPath isEqualToString:@"currentItem"]) {
        NSInteger item = [[change objectForKey:@"new"]intValue];
        if (object == _postCollectionView && _indexCollectionView.currentItem != item) {
            _indexCollectionView.currentItem = item;
            [_indexCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:_indexCollectionView.currentItem inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        }
        else if (object == _indexCollectionView && _postCollectionView.currentItem != item){
            _postCollectionView.currentItem = item;
            [_postCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:_postCollectionView.currentItem inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        }
        _label.text = ((MovieModal *)_data[item]).title;
    }
}

#pragma mark - create
- (void)_createFootView{
    _label = [[UILabel alloc]initWithFrame:CGRectMake(0, kScreenHeight - 49 - 35, kScreenWidth, 35)];
    _label.textColor = [UIColor whiteColor];
    _label.textAlignment = NSTextAlignmentCenter;
    
    [self addSubview:_label];
}
- (void)_createIndexCollectionView{
    _indexCollectionView  = [[IndexCollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 100)];
    _indexCollectionView.pageWidth = 75;
    [_topView addSubview:_indexCollectionView];
}
- (void)_createTopView{

    _topView = [[UIView alloc]initWithFrame:CGRectMake(0, 64 - 100, kScreenWidth, 130)];
    [self addSubview:_topView];
    
    UIImage *image = [UIImage imageNamed:@"indexBG_home"];
    image = [image stretchableImageWithLeftCapWidth:0 topCapHeight:2];
    UIImageView *topBGView = [[UIImageView alloc]initWithFrame:_topView.bounds];
    topBGView.image = image;
    [_topView addSubview:topBGView];
    
    UIButton *change = [UIButton buttonWithType:UIButtonTypeCustom];
    change.frame = CGRectMake((kScreenWidth - 15) / 2, _topView.height - 20, 15, 15);
    change.tag = 100;
    [change setImage:[UIImage imageNamed:@"up_home"] forState:UIControlStateSelected];
    [change setImage:[UIImage imageNamed:@"down_home"] forState:UIControlStateNormal];
    [change addTarget:self action:@selector(changeAction:) forControlEvents:UIControlEventTouchUpInside];
    [_topView addSubview:change];
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeAction:)];
    swipe.direction = UISwipeGestureRecognizerDirectionDown;
    [self addGestureRecognizer:swipe];
}
- (void)_createCollectionView{
    _postCollectionView = [[PostCollectionView alloc]initWithFrame:CGRectMake(0, 64 + 30, kScreenWidth, kScreenHeight - 64 - 30 - 49 -30)];
    _postCollectionView.pageWidth = 220;
    [self insertSubview:_postCollectionView belowSubview:_topView];
}
- (void)setData:(NSArray *)data{
    _data = data;
    _postCollectionView.data = _data;
    _indexCollectionView.data = _data;
    _label.text = ((MovieModal *)_data[0]).title;
    
}
- (void)_hideHeadView{
    [UIView animateWithDuration:0.3 animations:^{
        _topView.transform = CGAffineTransformIdentity;
    }];
    UIButton *button = [_topView viewWithTag:100];
    button.selected = NO;
    _allScreen.hidden = YES;
}
- (void)_showHeadView{
    [UIView animateWithDuration:0.3 animations:^{
        _topView.transform = CGAffineTransformMakeTranslation(0, 100);
    }];
    UIButton *button = [_topView viewWithTag:100];
    button.selected = YES;
    if (_allScreen == nil) {
        _allScreen = [[UIControl alloc]initWithFrame:self.bounds];
        _allScreen.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
        [self insertSubview:_allScreen belowSubview:_topView];
        _allScreen.hidden = YES;
        [_allScreen addTarget:self action:@selector(controlAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    _allScreen.hidden = NO;
}

#pragma mark - Action
- (void)controlAction:(UIControl *)control{

    [self _hideHeadView];
}
- (void)swipeAction:(UISwipeGestureRecognizer *)swipe{
    
    [self _showHeadView];
}

- (void)changeAction:(UIButton *)button{

    if (button.selected) {
        [self _hideHeadView];
    }
    else{
        [self _showHeadView];
    }
}
@end

//
//  PostCell.m
//  01
//
//  Created by Macx on 15/12/15.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import "PostCell.h"
#import "MovieModal.h"
#import "BackPostView.h"
@implementation PostCell
- (void)setMovieModal:(MovieModal *)movieModal{
    _movieModal = movieModal;
    if (_post == nil) {
        _post = [[UIImageView alloc]initWithFrame:self.bounds];
        _post.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:_post];
        _backPost = [[BackPostView alloc]initWithFrame:self.bounds];
        _backPost = [[[NSBundle mainBundle]loadNibNamed:@"BackPostView" owner:self options:nil]lastObject];
        [self.contentView insertSubview:_backPost belowSubview:_post];
    }
    _post.hidden = _isBack;
    _backPost.hidden = !_isBack;
    [_post sd_setImageWithURL:[NSURL URLWithString:[movieModal.images valueForKey:@"large"]]];
    
    _post.transform = CGAffineTransformMakeScale(0.95, 0.95);
    _backPost.transform = CGAffineTransformMakeScale(0.95, 0.95);    
    _backPost.movieModal = movieModal;
}
-(void)changeView{

    NSInteger index1 = [self.contentView.subviews indexOfObject:_post];
    NSInteger index2 = [self.contentView.subviews indexOfObject:_backPost];
    
    UIViewAnimationOptions style = _post.hidden ? UIViewAnimationOptionTransitionFlipFromLeft : UIViewAnimationOptionTransitionFlipFromRight;
    
    [UIView transitionWithView:self.contentView duration:0.5 options:(style) animations:^{
        [self.contentView exchangeSubviewAtIndex:index1 withSubviewAtIndex:index2];
    } completion:NULL];
    _post.hidden = !_post.hidden;
    _backPost.hidden = !_backPost.hidden;
}
@end

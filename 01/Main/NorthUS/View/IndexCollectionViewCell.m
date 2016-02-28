//
//  IndexCollectionViewCell.m
//  01
//
//  Created by Macx on 15/12/16.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import "IndexCollectionViewCell.h"

@implementation IndexCollectionViewCell
- (void)setUrl:(NSURL *)url{
    _url = url;
    if (_post == nil) {
        _post = [[UIImageView alloc]initWithFrame:self.bounds];
        _post.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:_post];
    }
    [_post sd_setImageWithURL:url];
    _post.transform = CGAffineTransformMakeScale(0.9, 0.9);
}

@end

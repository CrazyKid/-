//
//  PhotoCollectionViewCell.m
//  01
//
//  Created by Macx on 15/12/14.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import "PhotoCollectionViewCell.h"
#import "PhotoScrollView.h"
@implementation PhotoCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _scroll = [[PhotoScrollView alloc]initWithFrame:self.bounds];

        [self.contentView addSubview:_scroll];
    }
    return self;
}

-(void)setImage:(NSString *)image{
    _image = image;
    _scroll.image = image;
}


@end

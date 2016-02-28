//
//  PhotoScrollView.m
//  01
//
//  Created by Macx on 15/12/14.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import "PhotoScrollView.h"

@implementation PhotoScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        imageView = [[UIImageView alloc]initWithFrame:self.bounds];
        [self addSubview:imageView];
        self.minimumZoomScale = 1.0;
        self.maximumZoomScale = 3.0;
        self.delegate = self;
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap2:)];
        tap2.numberOfTapsRequired = 2;
        [self addGestureRecognizer:tap2];
        UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap1:)];
        [self addGestureRecognizer:tap1];
        [tap1 requireGestureRecognizerToFail:tap2];
    }
    return self;
}
-(void)setImage:(NSString *)image{
        _image = image;
        [imageView sd_setImageWithURL:[NSURL URLWithString:_image]];
    
}
- (void)tap1:(UITapGestureRecognizer *)tap1{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"noti" object:self];
}
- (void)tap2:(UITapGestureRecognizer *)tap{

    if (self.zoomScale == 1) {
        [self setZoomScale:3 animated:YES];
    }
    else{
        [self setZoomScale:1 animated:YES];
    }
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return imageView;
}

@end

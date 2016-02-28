//
//  BackPostView.m
//  01
//
//  Created by Macx on 15/12/16.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import "BackPostView.h"
#import "StarView.h"
#import "MovieModal.h"
@implementation BackPostView
-(void)setMovieModal:(MovieModal *)movieModal{
    _movieModal = movieModal;
    [_imageView sd_setImageWithURL:[NSURL URLWithString:[movieModal.images objectForKey:@"medium"]]];
    _title.text = movieModal.title;
    _ori_title.text = [NSString stringWithFormat:@"原名:%@",movieModal.original_title];
    _year.text = [NSString stringWithFormat:@"年份:%@",movieModal.year];
    _starView.average = movieModal.average;
    _average.text = [NSString stringWithFormat:@"%.1f",[movieModal.average floatValue]];
}
@end

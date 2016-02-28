//
//  MovieCell.m
//  01
//
//  Created by Macx on 15/12/9.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import "MovieCell.h"
#import "MovieModal.h"
#import "UIImageView+WebCache.h"
#import "StarView.h"
@implementation MovieCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setMovie:(MovieModal *)movie{

    _movie = movie;
    _titleLable.text = movie.title;
    _numberLable.text = [NSString stringWithFormat:@"%.1f",[movie.average floatValue]];
    _yearLable.text = [NSString stringWithFormat:@"年份:%@",movie.year];
    
    NSString *str = [movie.images objectForKey:@"medium"];
    NSURL *url = [NSURL URLWithString:str];
    [_movieImages sd_setImageWithURL:url];
    _starView.average = movie.average;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

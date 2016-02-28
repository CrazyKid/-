//
//  SencondTableViewCell.m
//  01
//
//  Created by Macx on 15/12/14.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import "SencondTableViewCell.h"
#import "InsideMovieModel.h"
@implementation SencondTableViewCell

- (void)awakeFromNib {
    // Initialization code
}


- (void)setModel:(InsideMovieModel *)model{

    _model = model;
    _im1 = [self.contentView viewWithTag:104];
    _im2 = [self.contentView viewWithTag:105];
    _im3 = [self.contentView viewWithTag:106];
    _im4 = [self.contentView viewWithTag:107];

    NSArray *arr = model.images;
    [_im1 sd_setImageWithURL:[NSURL URLWithString:arr[0]]];
    [_im2 sd_setImageWithURL:[NSURL URLWithString:arr[1]]];
    [_im3 sd_setImageWithURL:[NSURL URLWithString:arr[2]]];
    [_im4 sd_setImageWithURL:[NSURL URLWithString:arr[3]]];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

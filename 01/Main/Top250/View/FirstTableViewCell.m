//
//  FirstTableViewCell.m
//  01
//
//  Created by Macx on 15/12/14.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import "FirstTableViewCell.h"
#import "InsideMovieModel.h"
@implementation FirstTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setModel:(InsideMovieModel *)model{
    _model = model;
    _view = [self.contentView viewWithTag:100];
    _titleC = [self.contentView viewWithTag:101];
    _titleE = [self.contentView viewWithTag:102];
    _textView = [self.contentView viewWithTag:103];
    
    [_view sd_setImageWithURL:[NSURL URLWithString:model.image]];
    _titleC.text = model.titleCn;
    _titleE.text = model.titleEn;
    _titleE.numberOfLines = 0;
    CGSize size = [model.titleEn boundingRectWithSize:CGSizeMake(190, 40) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} context:nil].size;
    _titleE.height = size.height;
    _textView.text = model.content;
    _textView.backgroundColor = [UIColor clearColor];
    _textView.editable = NO;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

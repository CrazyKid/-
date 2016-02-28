//
//  OtherTableViewCell.m
//  01
//
//  Created by Macx on 15/12/14.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import "OtherTableViewCell.h"
#import "TalkModel.h"

#define kLabelHeight 22


@implementation OtherTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setModel:(TalkModel *)model{
    _model = model;
    _iV = [self.contentView viewWithTag:100];
    _name = [self.contentView viewWithTag:101];
    _average = [self.contentView viewWithTag:102];
    _content = [self.contentView viewWithTag:103];
    [_iV sd_setImageWithURL:[NSURL URLWithString:model.userImage]];
    _name.text = model.nickname;
    _average.text = model.rating;
    if (self.height == 80) {
        _content.height = kLabelHeight;
    }
    else{
        _content.height = self.height - 80 + kLabelHeight;
    }
    _content.text = model.content;
    _content.numberOfLines = 0;
//    _content.backgroundColor = [UIColor grayColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

//
//  NewsTableViewCell.m
//  01
//
//  Created by Macx on 15/12/11.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import "NewsTableViewCell.h"
#import "NewsModel.h"
@implementation NewsTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
//g *image;
//@property (nonatomic,strong)NSNumber *newsID;
//@property (nonatomic,copy)NSString *title;
//@property (nonatomic,copy)NSString *summary;
//@property (nonatomic,strong)NSNumber *type;

-(void)setModel:(NewsModel *)model{

    _model = model;
    [_image sd_setImageWithURL:[NSURL URLWithString:model.image]];
    _title.text = model.title;
    _summary.text = model.summary;
    _smallImage.backgroundColor = [UIColor clearColor];
    if ([model.type integerValue] == 0) {
        _smallImage.hidden = YES;
        _summary.left = _image.right + 5;
    }
    else if ([model.type integerValue] == 1){
        _smallImage.hidden = NO;
        _smallImage.image = [UIImage imageNamed:@"sctpxw"];
        _summary.left = _smallImage.right + 5;
    }
    else{
        _smallImage.hidden = NO;
        _smallImage.image = [UIImage imageNamed:@"scspxw"];
        _summary.left = _smallImage.right + 5;

    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

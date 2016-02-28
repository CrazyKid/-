//
//  CinameTableViewCell.m
//  01
//
//  Created by Macx on 15/12/17.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import "CinameTableViewCell.h"
#import "CinameModel.h"
@implementation CinameTableViewCell

- (void)awakeFromNib {
    // Initialization code
}


- (void)setCinameModel:(CinameModel *)cinameModel{
    if (cinameModel != nil) {
        _cinameModel = cinameModel;
        _ciname.text = cinameModel.name;
        //根据里面文字计算label的宽度
        CGSize size = [cinameModel.name boundingRectWithSize:CGSizeMake(220, 20) options: NSStringDrawingTruncatesLastVisibleLine attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15]} context:nil].size;
        _ciname.width = size.width;
        if ([cinameModel.grade floatValue] == 0) {
            _average.text = @"暂无";
            _average1.text = nil;
        }
        else{
            int a = [cinameModel.grade intValue];
            float b = [cinameModel.grade floatValue] - a;
            float c = [[NSString stringWithFormat:@"%.1f",b] floatValue] * 10;
            int d = c;
            _average.text = [NSString stringWithFormat:@"%d.",a];
            _average1.text = [NSString stringWithFormat:@"%d分",d];
        }
        CGSize size1 = [_average.text boundingRectWithSize:CGSizeMake(220, 20) options: NSStringDrawingTruncatesLastVisibleLine attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} context:nil].size;
        _average.width = size1.width;
        _average.left = _ciname.right + 10;
        _average1.left = _average.right;
        if (cinameModel.lowPrice == [NSNull null]) {
            _price.text = @"暂无";
        }
        else{
            
            _price.text = [NSString stringWithFormat:@"￥%.0f",[cinameModel.lowPrice floatValue]];
        }
        if (cinameModel.circleName == [NSNull null]) {
            _place.text = @"暂无";
        }
        else{
            
            _place.text = cinameModel.circleName;
        }
        _seat.left = 20;
        _group.left = 45;
        _seat.hidden = NO;
        _group.hidden = NO;
        if ([cinameModel.isSeatSupport boolValue]) {//在左边的//是否要判断在无座情况下显示团购图标>?
            
            _seat.hidden = YES;
            _group.left = 20;
        }
        if ([cinameModel.isGroupBuySupport boolValue]) {
            _group.hidden = YES;
        }
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

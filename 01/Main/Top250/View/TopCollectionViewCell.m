//
//  TopCollectionViewCell.m
//  01
//
//  Created by Macx on 15/12/12.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import "TopCollectionViewCell.h"
#import "StarView.h"
#import "TopModel.h"
@implementation TopCollectionViewCell

-(void)setTopModel:(TopModel *)topModel{

    _topModel = topModel;
    [_image sd_setImageWithURL:[NSURL URLWithString:topModel.images[@"medium"]]];
    _title.text = topModel.title;
    _title.textAlignment = NSTextAlignmentCenter;
    _title.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
    _average.text = [NSString stringWithFormat:@"%.1f",[topModel.average floatValue]];

    _star.average = topModel.average;
}

@end

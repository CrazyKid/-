//
//  StarView.m
//  01
//
//  Created by Macx on 15/12/9.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import "StarView.h"
#import "UIView+ext.h"

@implementation StarView

-(void)awakeFromNib{
        [self _createStarView];
}

- (void)_createStarView{

    UIImage *yellowStar = [UIImage imageNamed:@"yellow"];
    UIImage *grayStar = [UIImage imageNamed:@"gray"];
    //创建黄色和灰色星星
    _yellowView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, yellowStar.size.width * 5, yellowStar.size.height)];
    _grayView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, grayStar.size.width * 5, grayStar.size.height)];
    
    _yellowView.backgroundColor = [UIColor colorWithPatternImage:yellowStar];
    _grayView.backgroundColor = [UIColor colorWithPatternImage:grayStar];
    //把xib中存放星星的背景修改
    self.width = self.height * _yellowView.width / _yellowView.height;
    //给星星根据尺寸放大
    CGFloat scale = self.height / _yellowView.height;
    _yellowView.transform = CGAffineTransformMakeScale(scale, scale);
    _grayView.transform = CGAffineTransformMakeScale(scale, scale);
    
    _yellowView.origin = CGPointZero;
    _grayView.origin = CGPointZero;
    
    [self addSubview:_grayView];
    [self addSubview:_yellowView];

}
//给评分用点语法赋值时,调用函数改变黄星的长度;
- (void)setAverage:(NSNumber *)average{

    _average = average;
    
    CGFloat s = (CGFloat)[average floatValue] / 10.0;
    
    _yellowView.width = self.width * s;

}
@end

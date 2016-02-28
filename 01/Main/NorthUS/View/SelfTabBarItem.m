//
//  SelfTabBarItem.m
//  01
//
//  Created by Macx on 15/12/8.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import "SelfTabBarItem.h"

@implementation SelfTabBarItem

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame imageName:(NSString *)imageName title:(NSString *)title
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake((frame.size.width - 20) / 2, 5, 20, 20)];
        imageView.image = [UIImage imageNamed:imageName];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:imageView];
        
        CGFloat maxY = CGRectGetMaxY(imageView.frame);
        
        UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0, maxY, frame.size.width, 20)];
        lable.text = title;
        lable.textAlignment = NSTextAlignmentCenter;
        lable.textColor = [UIColor whiteColor];
        lable.font = [UIFont systemFontOfSize:11];
        
        [self addSubview:lable];
    }
    return self;
}
@end

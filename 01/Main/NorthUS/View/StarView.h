//
//  StarView.h
//  01
//
//  Created by Macx on 15/12/9.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StarView : UIView
{
    UIView *_grayView;
    UIView *_yellowView;
}
@property (nonatomic,strong)NSNumber *average;//评分
@end

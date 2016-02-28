//
//  OtherTableViewCell.h
//  01
//
//  Created by Macx on 15/12/14.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TalkModel;
@interface OtherTableViewCell : UITableViewCell
@property (nonatomic,strong)UIImageView *iV;
@property (nonatomic,strong)UILabel *name;
@property (nonatomic,strong)UILabel *average;
@property (nonatomic,strong)UILabel *content;
@property (nonatomic,strong)TalkModel *model;
@end

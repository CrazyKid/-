//
//  FirstTableViewCell.h
//  01
//
//  Created by Macx on 15/12/14.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import <UIKit/UIKit.h>
@class InsideMovieModel;
@interface FirstTableViewCell : UITableViewCell
@property (nonatomic,strong)UIImageView *view;
@property (nonatomic,strong)UILabel *titleC;
@property (nonatomic,strong)UILabel *titleE;
@property (nonatomic,strong)UITextView *textView;
@property (nonatomic,strong)InsideMovieModel *model;
@end

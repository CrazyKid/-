//
//  BackPostView.h
//  01
//
//  Created by Macx on 15/12/16.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import <UIKit/UIKit.h>
@class StarView;
@class MovieModal;
@interface BackPostView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *ori_title;
@property (weak, nonatomic) IBOutlet UILabel *year;
@property (weak, nonatomic) IBOutlet StarView *starView;
@property (weak, nonatomic) IBOutlet UILabel *average;
@property (nonatomic,strong)MovieModal *movieModal;
@end

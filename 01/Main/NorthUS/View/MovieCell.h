//
//  MovieCell.h
//  01
//
//  Created by Macx on 15/12/9.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MovieModal;
@class StarView;
@interface MovieCell : UITableViewCell
{

    __weak IBOutlet StarView *_starView;
    __weak IBOutlet UIImageView *_movieImages;
    __weak IBOutlet UILabel *_titleLable;

    __weak IBOutlet UILabel *_yearLable;
    __weak IBOutlet UILabel *_numberLable;
}
@property (nonatomic,strong)MovieModal *movie;
@end

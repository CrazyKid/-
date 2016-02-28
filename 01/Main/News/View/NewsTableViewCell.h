//
//  NewsTableViewCell.h
//  01
//
//  Created by Macx on 15/12/11.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NewsModel;
@interface NewsTableViewCell : UITableViewCell
{
    __weak IBOutlet UILabel *_title;

    __weak IBOutlet UILabel *_summary;
    __weak IBOutlet UIImageView *_image;

    __weak IBOutlet UIImageView *_smallImage;
}
@property (nonatomic,strong)NewsModel *model;
@end


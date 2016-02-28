//
//  TopCollectionViewCell.h
//  01
//
//  Created by Macx on 15/12/12.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import <UIKit/UIKit.h>
@class StarView;
@class TopModel;
@interface TopCollectionViewCell : UICollectionViewCell
{

    __weak IBOutlet UIImageView *_image;
    __weak IBOutlet UILabel *_title;

    __weak IBOutlet UILabel *_average;
    __weak IBOutlet StarView *_star;

}
@property (nonatomic,strong)TopModel *topModel;
@end

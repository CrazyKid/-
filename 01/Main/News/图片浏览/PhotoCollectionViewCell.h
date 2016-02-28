//
//  PhotoCollectionViewCell.h
//  01
//
//  Created by Macx on 15/12/14.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PhotoScrollView;
@interface PhotoCollectionViewCell : UICollectionViewCell
{
//    PhotoScrollView *scroll ;
}
@property (nonatomic,strong)PhotoScrollView *scroll;
@property (nonatomic,copy)NSString *image;
@end

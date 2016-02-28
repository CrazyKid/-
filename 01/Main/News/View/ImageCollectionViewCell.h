//
//  ImageCollectionViewCell.h
//  01
//
//  Created by Macx on 15/12/13.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface ImageCollectionViewCell : UICollectionViewCell
{

    __weak IBOutlet UIImageView *_imageView;
}
@property (nonatomic,copy)NSString *image;
@end

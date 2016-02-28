//
//  ImageCollectionViewCell.m
//  01
//
//  Created by Macx on 15/12/13.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import "ImageCollectionViewCell.h"
#import "MovieModal.h"
@implementation ImageCollectionViewCell
-(void)setImage:(NSString *)image{
    _image = image;
    [_imageView sd_setImageWithURL:[NSURL URLWithString:image]];

}
@end

//
//  PhotoScrollView.h
//  01
//
//  Created by Macx on 15/12/14.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoScrollView : UIScrollView<UIScrollViewDelegate>
{
    UIImageView *imageView;
}
@property (nonatomic,strong)NSString *image;
@end

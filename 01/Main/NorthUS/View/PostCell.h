//
//  PostCell.h
//  01
//
//  Created by Macx on 15/12/15.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MovieModal;
@class BackPostView;
@interface PostCell : UICollectionViewCell
@property (nonatomic,strong)MovieModal *movieModal;
@property (nonatomic,strong)UIImageView *post;
@property (nonatomic,strong)BackPostView *backPost;
@property (nonatomic,assign)BOOL isBack;
- (void)changeView;
@end

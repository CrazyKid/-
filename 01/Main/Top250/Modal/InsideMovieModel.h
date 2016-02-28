//
//  InsideMovieModel.h
//  01
//
//  Created by Macx on 15/12/14.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InsideMovieModel : NSObject
@property (nonatomic,copy)NSString *image;
@property (nonatomic,copy)NSString *titleCn;
@property (nonatomic,copy)NSString *titleEn;
@property (nonatomic,copy)NSString *content;
@property (nonatomic,strong)NSArray *images;
@end

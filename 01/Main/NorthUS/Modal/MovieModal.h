//
//  MovieModal.h
//  01
//
//  Created by Macx on 15/12/9.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieModal : NSObject
@property (nonatomic,strong) NSNumber *average;//评分
@property (nonatomic,copy)NSString *title;//标题
@property (nonatomic,copy)NSString *original_title;//原标题
@property (nonatomic,copy)NSString *subtype;//种类
@property (nonatomic,copy)NSString *year;//年份
@property (nonatomic,strong)NSNumber *collect_count;//收藏人数
@property (nonatomic,copy)NSDictionary *images;//图片
@property (nonatomic,copy)NSString *movieID;//电影id
@end

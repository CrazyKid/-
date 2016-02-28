//
//  NewsModel.h
//  01
//
//  Created by Macx on 15/12/11.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModel : NSObject

@property (nonatomic,copy)NSString *image;
@property (nonatomic,strong)NSNumber *newsID;
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *summary;
@property (nonatomic,strong)NSNumber *type;

@end

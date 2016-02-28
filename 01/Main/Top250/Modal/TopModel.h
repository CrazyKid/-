//
//  TopModel.h
//  01
//
//  Created by Macx on 15/12/12.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TopModel : NSObject
@property (nonatomic,strong)NSNumber *average;
@property (nonatomic,strong)NSNumber *collect_count;
@property (nonatomic,copy)NSDictionary *images;
@property (nonatomic,copy)NSString *title;
@end

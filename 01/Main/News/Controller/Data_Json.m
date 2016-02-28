//
//  Data_Json.m
//  01
//
//  Created by Macx on 15/12/11.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import "Data_Json.h"

@implementation Data_Json
+(id)create_json:(NSString *)path{
    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:path ofType:nil]];
    id JsonDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:NULL];
    return JsonDic;
}
@end

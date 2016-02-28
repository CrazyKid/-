//
//  NorthUSViewController.h
//  01
//
//  Created by Macx on 15/12/8.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import "BaseViewController.h"
@class PostView;
@interface NorthUSViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    PostView *_BGPostView;
    NSMutableArray *_data;
}
- (void)change:(UIView *)view flag:(BOOL)flag;
@end

//
//  CinameViewController.h
//  01
//
//  Created by Macx on 15/12/8.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import "BaseViewController.h"

@interface CinameViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
{
    BOOL _flag[100];        //默认为0
}
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *data;
@property (nonatomic,strong)NSMutableArray *disData;
@end

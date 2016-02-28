//
//  NewsViewController.h
//  01
//
//  Created by Macx on 15/12/8.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import "BaseViewController.h"
@interface NewsViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
{

    __weak IBOutlet UITableView *_tableView;
    NSMutableArray *_data;
    
}

@end

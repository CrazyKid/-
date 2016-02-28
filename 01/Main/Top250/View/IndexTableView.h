//
//  IndexTableView.h
//  01
//
//  Created by Macx on 15/12/17.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IndexTableView : UITableView<UITableViewDataSource,UITableViewDelegate>
{
    BOOL flag[1000];
    NSMutableArray *_insideData;
    NSMutableArray *_talkData;
}
@end

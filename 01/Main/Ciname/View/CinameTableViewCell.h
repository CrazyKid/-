//
//  CinameTableViewCell.h
//  01
//
//  Created by Macx on 15/12/17.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CinameModel;
@interface CinameTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *average1;
@property (weak, nonatomic) IBOutlet UILabel *ciname;
@property (weak, nonatomic) IBOutlet UILabel *average;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *place;
@property (weak, nonatomic) IBOutlet UILabel *seat;
@property (weak, nonatomic) IBOutlet UILabel *group;

@property (nonatomic,strong)CinameModel *cinameModel;
@end

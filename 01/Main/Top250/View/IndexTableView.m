//
//  IndexTableView.m
//  01
//
//  Created by Macx on 15/12/17.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import "IndexTableView.h"
#import "InsideMovieModel.h"
#import "TalkModel.h"
#import "FirstTableViewCell.h"
#import "SencondTableViewCell.h"
#import "OtherTableViewCell.h"

#define kLabelHeight 22
NSInteger x = 0;
CGFloat heightCell = 0;
NSInteger pre_x = 0;
@implementation IndexTableView

//这里由于会被tarbar遮挡,tableview高度设置成kscreenheight - 64 - 49;即减掉tarbar和navigationbar的高度

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self _createTableData];
        [self _createTalkData];
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
        self.separatorColor = [UIColor darkGrayColor];
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}
#pragma mark -create
- (void)_createTableData{
    _insideData = [NSMutableArray array];
    NSDictionary *dic = [Data_Json create_json:movie_detail];
    InsideMovieModel *model = [[InsideMovieModel alloc]init];
    model.image = dic[@"image"];
    model.titleCn = dic[@"titleCn"];
    model.titleEn = dic[@"titleEn"];
    model.content = dic[@"content"];
    model.images = dic[@"images"];
    [_insideData addObject:model];
}
- (void)_createTalkData{
    _talkData = [NSMutableArray array];
    NSDictionary *dic = [Data_Json create_json:movie_comment];
    NSArray *arr = dic[@"list"];
    for (NSDictionary *dic1 in arr) {
        
        TalkModel *model = [[TalkModel alloc]init];
        model.userImage = dic1[@"userImage"];
        model.nickname = dic1[@"nickname"];
        model.rating = dic1[@"rating"];
        model.content = dic1[@"content"];
        [_talkData addObject:model];
    }
}
#pragma mark - tableView datasoure
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _talkData.count + 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.row == 0) {
        FirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"first" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor clearColor];
        cell.model = _insideData[0];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else if (indexPath.row == 1){
        SencondTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"second" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor clearColor];
        cell.model = _insideData[0];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    OtherTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"other" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    cell.model = _talkData[indexPath.row - 2];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        return 170;
    }
    if (flag[indexPath.row]) {
        return heightCell;
    }
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row > 1) {
        //单元格放大
        NSString *s = ((TalkModel *)_talkData[indexPath.row - 2]).content;
        
        CGSize size = [s boundingRectWithSize:CGSizeMake(190, 200) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15]} context:NULL].size;
        
        if (size.height < kLabelHeight) {
            heightCell = 80;
        }
        else{
            heightCell = 80 + size.height ;
        }

        x = indexPath.row;
        
        if (pre_x != x) {
            flag[pre_x] = NO;
            flag[x] = YES;
        }
        else{
            flag[x] = !flag[x];
        }
    }
    NSIndexPath *p1 = [NSIndexPath indexPathForRow:x inSection:0];
    NSIndexPath *p2 = [NSIndexPath indexPathForRow:pre_x inSection:0];
    [tableView reloadRowsAtIndexPaths:@[p1,p2] withRowAnimation:UITableViewRowAnimationFade];
    
    pre_x = x;
}


@end

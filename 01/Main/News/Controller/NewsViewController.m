//
//  NewsViewController.m
//  01
//
//  Created by Macx on 15/12/8.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsModel.h"
#import "NewsTableViewCell.h"
#import "TextViewController.h"
#import "ImageViewController.h"
#import "VideoViewController.h"

CGFloat headBGImageHeight = 150;


@interface NewsViewController ()
{
    UIImageView *headBGImage;
    UILabel *headLable;
}
@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.separatorColor = [UIColor darkGrayColor];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    [self _createJson];
    [self _createHeadBGImage];
}

- (void)_createHeadBGImage{

    headBGImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, headBGImageHeight)];
    [self.view insertSubview:headBGImage belowSubview:_tableView];
    
    headLable = [[UILabel alloc]initWithFrame:CGRectMake(0, headBGImageHeight - 30, kScreenWidth, 30)];
    headLable.textColor = [UIColor whiteColor];
    headLable.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
    [self.view insertSubview:headLable belowSubview:_tableView];
    [self _loadHeadBGImageData];
}

- (void)_loadHeadBGImageData{
    if (_data.count > 0) {
        [headBGImage sd_setImageWithURL:[NSURL URLWithString:((NewsModel *)_data[0]).image]];
        headLable.text = ((NewsModel *)_data[0]).title;
    }
}
- (void)_createJson{
    
    _data = [NSMutableArray array];
    NSArray *arr = [Data_Json create_json:news_list];

    for (NSDictionary *dic in arr) {
        NewsModel *model = [[NewsModel alloc]init];
        model.image = dic[@"image"];
        model.newsID = dic[@"id"];
        model.title = dic[@"title"];
        model.summary = dic[@"summary"];
        model.type = dic[@"type"];
        
        [_data addObject:model];
    }
    [_tableView reloadData];
}
#pragma mark - uiscrollview delegate
/**
 *  自己的方法实现向下拉动图片放大,但是做不到向上滑的时候首单元格图片缓慢上滑
 */
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    
//    UITableViewCell *cell = _tableView.visibleCells[0];
//    UITableViewCell *cell1 = _tableView.visibleCells[1];
//    CGFloat y = _tableView.contentOffset.y ;
//    if (y < 0) {
//        CGFloat t = -1 * y * 0.008 + 1;//保证放大倍数在1~1.8之间
//        UILabel *l1 = [cell.contentView viewWithTag:101];
//        l1.transform = CGAffineTransformMakeScale(1 / t, 1 / t);
//        cell.transform = CGAffineTransformMakeScale(t, 1-y/150);
//        //拉伸后cell[0]的底部是150-y,而原先cell[0]高度150乘以1-y/150正好等于现在的单元格高度
//        l1.bottom = cell1.top;
//        cell.bottom = cell1.top;
//    }
//    else if (y < 150){
//    }
//}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

    CGFloat y = _tableView.contentOffset.y;
    if (y > 0) {        //向上滑的时候实现头视图慢慢画上去
        headBGImage.top = -y * 0.5;
    }
    else{
        CGFloat height = headBGImageHeight - y;
        CGFloat width = kScreenWidth / headBGImageHeight * height;
        CGRect frame = CGRectMake(-(width - kScreenWidth) / 2, 0, width, height);
        headBGImage.frame = frame;
    }
    headLable.bottom = headBGImage.bottom;
}
#pragma mark - tableView datasoure
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _data.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.row == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"bigCell" forIndexPath:indexPath];

        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"smallCell" forIndexPath:indexPath];
    cell.model = _data[indexPath.row];
    cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    return cell;
}
#pragma mark - tableView dalegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 150;
    }
    return 60;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NewsModel *newsModel = [[NewsModel alloc]init];
    newsModel = _data[indexPath.row];
    NSInteger type = [newsModel.type integerValue];
    
    if (type == 0) {
        TextViewController *textVC = [self.storyboard instantiateViewControllerWithIdentifier:@"TextViewController"];
        [self.navigationController pushViewController:textVC animated:YES];
    }
    else if (type == 1){
        ImageViewController *imageVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ImageViewController"];
        [self.navigationController pushViewController:imageVC animated:YES];
    }
    else if (type == 2){
        VideoViewController *videoVC = [self.storyboard instantiateViewControllerWithIdentifier:@"VideoViewController"];
        [self.navigationController pushViewController:videoVC animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

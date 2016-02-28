//
//  TopViewController.m
//  01
//
//  Created by Macx on 15/12/8.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import "TopViewController.h"
#import "TopModel.h"
#import "TopCollectionViewCell.h"
#import "IndexTableView.h"

@interface TopViewController ()

@end

@implementation TopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _creataJson];
    _collectionView.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    _collectionView.showsVerticalScrollIndicator = YES;
}
- (void)_creataJson{
    _data = [NSMutableArray array];
    
    NSDictionary *dicJson = [Data_Json create_json:top250];
    NSArray *arr = dicJson[@"subjects"];
    for (NSDictionary *dic in arr) {
        TopModel *_topModel = [[TopModel alloc]init];
        _topModel.average = [[dic valueForKey:@"rating"]valueForKey:@"average"];
        _topModel.collect_count = dic[@"collect_count"];
        _topModel.images = dic[@"images"];
        _topModel.title = dic[@"title"];
        [_data addObject:_topModel];
    }
    [_collectionView reloadData];
}

#pragma mark - collectionView datasoure
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _data.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    TopCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.topModel = _data[indexPath.row];
    
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *topTableVC = [self.storyboard instantiateViewControllerWithIdentifier:@"TViewController"];

    topTableVC.view.backgroundColor = [UIColor clearColor];

    [self.navigationController pushViewController:topTableVC animated:YES];
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

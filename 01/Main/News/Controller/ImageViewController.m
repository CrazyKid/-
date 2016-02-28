//
//  ImageViewController.m
//  01
//
//  Created by Macx on 15/12/12.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import "ImageViewController.h"
#import "ImageCollectionViewCell.h"
#import "PushPhotoViewController.h"

@interface ImageViewController ()

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    _collectionView.backgroundColor = [UIColor clearColor];
    [self _createJson];

}

- (void)_createJson{
    _data = [NSMutableArray array];
    NSArray *arr = [Data_Json create_json:image_list];
    for (NSDictionary *dic in arr) {
        NSString *str = dic[@"image"];
        [_data addObject:str];
    }
    [_collectionView reloadData];
}
#pragma mark - collectionView datasoure
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _data.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"imageCell" forIndexPath:indexPath];
    cell.image = _data[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i < _data.count; i++) {
        [arr addObject:_data[i]];
    }

    PushPhotoViewController *push = [[PushPhotoViewController alloc] init];
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:push];
    [self presentViewController:navi animated:YES completion:NULL];
    push.images = arr;
    push.indexpath = indexPath;
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

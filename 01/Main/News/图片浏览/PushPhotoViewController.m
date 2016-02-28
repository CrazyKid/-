//
//  PushPhotoViewController.m
//  01
//
//  Created by Macx on 15/12/14.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import "PushPhotoViewController.h"
#import "PhotoCollectionView.h"
@interface PushPhotoViewController ()

@end

@implementation PushPhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
    self.navigationController.navigationBar.translucent = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    PhotoCollectionView *photoCV = [[PhotoCollectionView alloc]initWithFrame:self.view.frame];
    photoCV.images = _images;
    [self.view addSubview:photoCV];
    [photoCV scrollToItemAtIndexPath:_indexpath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
    _isHide = NO;
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(tap1:) name:@"noti" object:nil];

}

- (void)tap1:(NSNotification *)notification {

    _isHide = !_isHide;
    self.navigationController.navigationBarHidden = _isHide;

}

- (void)backAction{

    [self dismissViewControllerAnimated:YES completion:NULL];
}
- (BOOL)prefersStatusBarHidden{
    return _isHide;
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
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

//
//  MoreViewController.m
//  01
//
//  Created by Macx on 15/12/18.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import "MoreViewController.h"

@interface MoreViewController ()

@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
//    NSLog(@"%@",NSHomeDirectory());
//    NSString *path = @"/Library/Caches/com.hackemist.SDWebImageCache.default";
//    NSString *fullPath = [NSHomeDirectory() stringByAppendingString:path];
//    NSLog(@"%@",fullPath);
    
}
- (void)_countSize{

    _countSize.text = [NSString stringWithFormat:@"%.1fM",[[SDImageCache sharedImageCache]getSize] / 1024 / 1024.0];

}

- (void)viewWillAppear:(BOOL)animated{
    [self _countSize];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"清除缓存" message:@"确定清除缓存吗?" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }]];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [[SDImageCache sharedImageCache]clearDisk];
            [self _countSize];
        }]];
        [self presentViewController:alert animated:YES completion:nil];

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

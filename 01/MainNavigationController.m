//
//  MainNavigationController.m
//  01
//
//  Created by Macx on 15/12/8.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import "MainNavigationController.h"

@interface MainNavigationController ()

@end

@implementation MainNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];

    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"nav_bg_all-64"] forBarMetrics:UIBarMetricsDefault];
    
    NSDictionary *dic = @{
                          NSForegroundColorAttributeName : [UIColor whiteColor],
                          
                          };
    
    self.navigationBar.titleTextAttributes = dic;
    
//    self.navigationBar.translucent = NO;
    
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    UIStatusBarStyle style = [self.topViewController preferredStatusBarStyle];
    return style;
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

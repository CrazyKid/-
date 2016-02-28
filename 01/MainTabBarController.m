//
//  MainTabBarController.m
//  01
//
//  Created by Macx on 15/12/8.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import "MainTabBarController.h"
#import "SelfTabBarItem.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)_createTabBar{

    for (UIView *view in self.tabBar.subviews) {
        Class cla = NSClassFromString(@"UITabBarButton");
        if ([view isKindOfClass:cla]) {
            [view removeFromSuperview];
        }
    }
    
    NSArray *imageName = @[@"movie_home.png",
                          @"msg_new.png",
                          @"start_top250.png",
                           @"icon_cinema.png",
                          @"more_setting.png"];
    NSArray *titleName = @[@"电影",@"新闻",@"top",@"影院",@"更多"];
    
    CGFloat width =  kScreenWidth / imageName.count;
    CGFloat hight = CGRectGetHeight(self.tabBar.frame);

    for (int i = 0; i < imageName.count; i++) {
        NSString *pic = imageName[i];
        NSString *title = titleName[i];
        
        SelfTabBarItem *barItem = [[SelfTabBarItem alloc]initWithFrame:CGRectMake(i * width, 0, width, hight) imageName:pic title:title];
        
        barItem.tag = 100 + i;
        [barItem addTarget:self action:@selector(barItemAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.tabBar addSubview:barItem];

        if (bgView == nil) {
            bgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 50, 45)];
            bgView.image = [UIImage imageNamed:@"selectTabBar_bg_all1"];
            bgView.center = barItem.center;
            [self.tabBar insertSubview:bgView atIndex:0];
        }
    }
    NSLog(@"%@",self.tabBar.subviews);
    NSLog(@"--%@",[self.tabBar viewWithTag:100].subviews);

}

- (void)barItemAction:(SelfTabBarItem *)barItem{

    self.selectedIndex = barItem.tag - 100;
    [UIView animateWithDuration:0.1 animations:^{
        
        bgView.center = barItem.center;
    }];
}

-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    [self _createTabBar];
//    self.tabBar.translucent = NO;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tab_bg_all"]];
    // Do any additional setup after loading the view.
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

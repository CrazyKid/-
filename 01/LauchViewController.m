//
//  LauchViewController.m
//  01
//
//  Created by Macx on 15/12/18.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import "LauchViewController.h"

NSInteger count = 0;
@interface LauchViewController ()
{
    NSMutableArray *images;
}
@end
@implementation LauchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageNamed:@"lauchBackImage.jpg"];
    [self.view addSubview:imageView];
    [self _loadImage];
    [self _startAnimation];
}
- (void)_startAnimation{
    if (count >= images.count) {
        [self _showMain];
        return;
    }
    [UIView animateWithDuration:0.1 animations:^{
        ((UIImageView *)images[count]).alpha = 1;
    }];
    [self performSelector:@selector(_startAnimation) withObject:nil afterDelay:0.1];
    count ++;
}
- (void)_showMain{
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIWindow *window = self.view.window;
    window.rootViewController = [story instantiateInitialViewController];
}
- (void)_loadImage{
    images = [NSMutableArray array];
    float width = kScreenWidth / 4;
    float height = kScreenHeight / 6;
    int x = 0, y = 0;
    for (int i = 0; i < 16; i++) {
        UIImageView *imV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, width, height)];
        imV.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",i + 1]];
        imV.alpha = 0;
        if (i < 4) {
            y = 0;
            x = width * i;
        }
        else if (i < 8){
            x = width * 3;
            y = height * (i - 3);
        }
        else if (i < 12){
            y = height * 5;
            x = width * (11 - i);
        }
        else{
            x = 0;
            y = height * (16 - i);
        }
        imV.origin = CGPointMake(x, y);
        [images addObject:imV];
        [self.view addSubview:imV];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UIStatusBarStyle)preferredStatusBarStyle{

    return UIStatusBarStyleLightContent;
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

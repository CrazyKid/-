//
//  TextViewController.m
//  01
//
//  Created by Macx on 15/12/12.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import "TextViewController.h"

@interface TextViewController ()

@end

@implementation TextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    //加载网址
//    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.youku.com"]]];
//    [self.view addSubview:webView];

    //加载保存的html文件
//    NSString *path = [[NSBundle mainBundle]pathForResource:@"haha" ofType:@"html"];
//    NSString *s = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
//    [webView loadHTMLString:s baseURL:nil];
    
    
    [self.view addSubview:_webView];
    [self _loadData];
}

- (void)_loadData{
    NSDictionary *dic = [Data_Json create_json:news_detail];
    NSString *title = dic[@"title"];
    NSString *content = dic[@"content"];
    NSString *time = dic[@"time"];
    NSString *source = dic[@"source"];
    NSString *author = dic[@"author"];
    
    NSString *html = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"news.html" ofType:nil] encoding:NSUTF8StringEncoding error:nil];
    
    NSString *subTitle = [NSString stringWithFormat:@"%@ %@",source,time];
    
    NSString *at = [NSString stringWithFormat:@"(编辑:%@)",author];
    
    NSString *htmlString = [NSString stringWithFormat:html,title,subTitle,content,at];
    
    [_webView loadHTMLString:htmlString baseURL:nil];
    _webView.delegate = self;
    _webView.scalesPageToFit = YES;
    
    _activityView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [_activityView stopAnimating];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:_activityView];
}

#pragma mark - webView delegata
- (void)webViewDidStartLoad:(UIWebView *)webView{
    [_activityView startAnimating];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [_activityView stopAnimating];
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

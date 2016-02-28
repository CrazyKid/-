//
//  NorthUSViewController.m
//  01
//
//  Created by Macx on 15/12/8.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import "NorthUSViewController.h"
#import "MovieModal.h"
#import "MovieCell.h"
#import "PostView.h"
@interface NorthUSViewController ()

@end

@implementation NorthUSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /**
     *  这里注意一个问题,如果把tableview的创建和其余uiview的创建位置互换,会出现tableView被导航栏或者tabbar遮盖的问题
     */
    
    [self _createButton];
    [self _createTableView];
    [self _createBGPostView];
    [self _createJson];
}

- (void)_createButton{

    UIView *buttonView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.frame = buttonView.frame;
    button1.tag = 100;
    button1.hidden = YES;
    [button1 setBackgroundImage: [UIImage imageNamed:@"exchange_bg_home"] forState:UIControlStateNormal];
    [button1 setImage:[UIImage imageNamed:@"list_home"] forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame = buttonView.frame;
    button2.tag = 101;
    button2.hidden = NO;
    [button2 setBackgroundImage: [UIImage imageNamed:@"exchange_bg_home"] forState:UIControlStateNormal];
    [button2 setImage:[UIImage imageNamed:@"poster_home"] forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];

    [buttonView addSubview:button1];
    [buttonView addSubview:button2];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:buttonView];
    
}

- (void)buttonAction:(UIButton *)button{
    
    UIView *buttonView = self.navigationItem.rightBarButtonItem.customView;
    
    UIButton *button1 = (UIButton *)[buttonView viewWithTag:100];
    UIButton *button2 = (UIButton *)[buttonView viewWithTag:101];
    
    button1.hidden = !button1.hidden;
    button2.hidden = !button2.hidden;
    _BGPostView.hidden = !_BGPostView.hidden;
    _tableView.hidden = !_tableView.hidden;
    
    [self change:buttonView flag:button1.hidden];
    [self change:self.view flag:button1.hidden];
}

-(void)change:(UIView *)view flag:(BOOL)flag{
    UIViewAnimationOptions style = flag ? UIViewAnimationOptionTransitionFlipFromLeft :UIViewAnimationOptionTransitionFlipFromRight;
    
    [UIView transitionWithView:view duration:0.5 options:(style) animations:^{
        [view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    } completion:NULL];
}

- (void)_createTableView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.hidden = YES;
    _tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    
    _tableView.separatorColor = [UIColor darkGrayColor];
    [_tableView registerNib:[UINib nibWithNibName:@"MovieCell" bundle:nil] forCellReuseIdentifier:@"movieCell"];
    [self.view addSubview:_tableView];
    
}

- (void)_createBGPostView{

    _BGPostView = [[PostView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    _BGPostView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    _BGPostView.hidden = NO;
    [self.view addSubview:_BGPostView];
    
}

- (void)_createJson{

    NSDictionary *JsonDic = [Data_Json create_json:us_box];
    NSArray *dataArray = [JsonDic valueForKey:@"subjects"];

    _data = [NSMutableArray array];
    for (NSDictionary *dic in dataArray) {
        NSDictionary *subdic = [dic valueForKey:@"subject"];
        MovieModal *modal = [[MovieModal alloc]init];
        modal.average = [[subdic valueForKey:@"rating"]valueForKey:@"average"];
        modal.collect_count = subdic[@"collect_count"];
        modal.images = subdic[@"images"];
        modal.movieID = subdic[@"id"];
        modal.original_title = subdic[@"original_title"];
        modal.year = subdic[@"year"];
        modal.subtype = subdic[@"subtype"];
        modal.title = subdic[@"title"];
        
        [_data addObject:modal];
    }
    [_tableView reloadData];
    _BGPostView.data = _data;
}

#pragma mark - UITableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"movieCell";
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];

    cell.movie = _data[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
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

- (IBAction)button1:(id)sender {
}

- (IBAction)button2:(id)sender {
}
@end

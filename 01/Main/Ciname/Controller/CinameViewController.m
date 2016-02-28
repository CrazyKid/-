//
//  CinameViewController.m
//  01
//
//  Created by Macx on 15/12/8.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import "CinameViewController.h"
#import "CinameModel.h"
#import "DistrictModel.h"
#import "CinameTableViewCell.h"
@interface CinameViewController ()

@end

@implementation CinameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    [self _loadJson];
    [self _createTableView];
    [self _createRightBarButtonItem];
}
#pragma mark -create
- (void)_createRightBarButtonItem{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, 35, 35);
    button.tag = 1000;
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
}
- (void)_loadJson{
    _data = [NSMutableArray array];
    _disData = [NSMutableArray array];
    //读完district_list中的数据
    NSDictionary *dic1 = [Data_Json create_json:district_list];
    NSArray *arr1 = dic1[@"districtList"];
    for (NSDictionary *dicd in arr1) {
        DistrictModel *disModel = [[DistrictModel alloc]init];
        disModel.district_name = dicd[@"name"];
        disModel.districtId = dicd[@"id"];
        [_disData addObject:disModel];
    }
    //根据以上数据找cinema_list中的数据
    NSDictionary *dic2 = [Data_Json create_json:cinema_list];
    NSArray *arr2 = dic2[@"cinemaList"];
    for (int i = 0; i < _disData.count; i++) {
        NSString *s = ((DistrictModel *)_disData[i]).districtId;//取得地区代号id
        NSString *place = ((DistrictModel *)_disData[i]).district_name;
        NSMutableArray *axx = [NSMutableArray array];
        for (NSDictionary *dicc in arr2) {
            CinameModel *model = [[CinameModel alloc]init];
            model.districtId = dicc[@"districtId"];
            if ([s isEqualToString:model.districtId]) {
                model.district_name = place;
                model.name = dicc[@"name"];
                model.circleName = dicc[@"circleName"];
                model.lowPrice = dicc[@"lowPrice"];
                model.grade = dicc[@"grade"];
                model.isGroupBuySupport = dicc[@"isGroupBuySupport"];
                model.isSeatSupport = dicc[@"isSeatSupport"];
                [axx addObject:model];
            }
        }

        NSDictionary *ddd = @{place:axx};
        [_data addObject:ddd];
    }
}
- (void)_createTableView{
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor clearColor];
    [_tableView registerNib:[UINib nibWithNibName:@"CinameTableViewCell" bundle:nil] forCellReuseIdentifier:@"cinameCell"];
    [self.view addSubview:_tableView];
}

#pragma mark - tableView datasource,delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return _data.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    if (_flag[section]) {
        NSArray *arr = [_data[section] objectForKey:((DistrictModel *)_disData[section]).district_name];
        return arr.count;
    }
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 80;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 35;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CinameTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cinameCell" forIndexPath:indexPath];
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSArray *arr = [_data[indexPath.section] objectForKey:((DistrictModel *)_disData[indexPath.section]).district_name];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.cinameModel = arr[indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    UIView *vi = [[UIView alloc]init];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    NSString *s = ((DistrictModel *)_disData[section]).district_name;
    [button setTitle:s forState:UIControlStateNormal];
    //更改button的字体和字体颜色,以及左对齐
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    button.contentHorizontalAlignment=UIControlContentHorizontalAlignmentLeft;
    button.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    button.tag = section + 100;
    button.backgroundColor = [UIColor darkGrayColor];
    button.frame = CGRectMake(0, 0, kScreenWidth, 40);
//    [vi addSubview:button];
    return button;
}
#pragma mark - action
- (void)buttonAction:(UIButton *)button{
    if (button.tag == 1000) {
        
    }
    else{
        _flag[button.tag - 100] = !_flag[button.tag - 100];
        //[_tableView reloadData];换成下面这两行代码会出现点开分组的动画效果.
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:button.tag - 100];
        [_tableView reloadSections:indexSet
                  withRowAnimation:UITableViewRowAnimationFade];
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

//
//  XQQMeViewController.m
//  XQQThinkProj
//
//  Created by XQQ on 16/9/22.
//  Copyright © 2016年 UIP. All rights reserved.
//

#import "XQQMeViewController.h"
#import "XQQSetViewController.h"
#import "XQQMeFootView.h"
#import "XQQMeCell.h"
#import "XQQWebViewController.h"

#define cellId  @"me"
@interface XQQMeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSArray * dataArr;
@property(nonatomic, strong)  UITableView  *  myTabelView;
@property(nonatomic, strong)  XQQMeFootView  *  footView;
@end

@implementation XQQMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //UI
    [self initUI];
    
    
}
/**UI*/
- (void)initUI{
    self.navigationItem.title = @"我的关注";
    self.view.backgroundColor = XQQBGColor;
    //右上角按钮
    self.navigationItem.rightBarButtonItems = @[[UIBarButtonItem itemWithImage:@"mine-setting-icon" hightImage:@"mine-setting-icon-click" target:self action:@selector(rightItemClicked)],[UIBarButtonItem itemWithImage:@"mine-moon-icon" hightImage:@"mine-moon-icon-click" target:self action:@selector(leftItemClicked)]];
    _dataArr = @[@[@"登录/注册"],
                 @[@"离线下载"],
                 ];
    _myTabelView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, iphoneWidth, iphoneHeight) style:UITableViewStyleGrouped];
    _myTabelView.delegate = self;
    _myTabelView.dataSource = self;
    _myTabelView.contentInset = UIEdgeInsetsMake(XQQMargin - 35, 0, 0, 0);
    _myTabelView.sectionHeaderHeight = 0;
    _myTabelView.sectionFooterHeight = XQQMargin;
    //设置footView
    _myTabelView.tableFooterView = [[XQQMeFootView alloc]init];
    //注册cell
    [self.myTabelView registerClass:[XQQMeCell class] forCellReuseIdentifier:cellId];
    [self.view addSubview:_myTabelView];
}

#pragma mark - UITabelViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _dataArr.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_dataArr[section] count];
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    XQQMeCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    cell.textLabel.text = _dataArr[indexPath.section][indexPath.row];
    //设置数据
    if (indexPath.section == 0) {
        cell.imageView.image = [UIImage imageNamed:@"publish-audio"];
    }else{
        cell.imageView.image = nil;
    }
    return cell;
}

#pragma mark - activity
- (void)rightItemClicked{
    XQQSetViewController * setVC = [[XQQSetViewController alloc]init];
    [self.navigationController pushViewController:setVC animated:YES];
}
- (void)leftItemClicked{
    XQQLogFunc
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

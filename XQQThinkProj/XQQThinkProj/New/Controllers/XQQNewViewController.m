//
//  XQQNewViewController.m
//  XQQThinkProj
//
//  Created by XQQ on 16/9/22.
//  Copyright © 2016年 UIP. All rights reserved.
//

#import "XQQNewViewController.h"

@interface XQQNewViewController ()

@end

@implementation XQQNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置UI
    [self setUpTitleView];
}
/**设置UI*/
- (void)setUpTitleView{
    self.view.backgroundColor = XQQBGColor;
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    //左边按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" hightImage:@"MainTagSubIconClick" target:self action:@selector(leftItemClicked)];
}
#pragma mark - activity
- (void)leftItemClicked{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

//
//  XQQRecommendViewController.m
//  XQQThinkProj
//
//  Created by XQQ on 16/9/26.
//  Copyright © 2016年 UIP. All rights reserved.
//

#import "XQQRecommendViewController.h"

@interface XQQRecommendViewController ()

@end

@implementation XQQRecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //UI
    [self initUI];
   
}
/**UI*/
- (void)initUI{
    self.navigationItem.title = @"推荐关注";
    
}
#pragma mark - activity
- (void)backItemClicked{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end

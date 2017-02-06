//
//  XQQEssenceSixViewController.m
//  XQQThinkProj
//
//  Created by XQQ on 16/10/14.
//  Copyright © 2016年 UIP. All rights reserved.
//

#import "XQQEssenceSixViewController.h"

@interface XQQEssenceSixViewController ()

@end

@implementation XQQEssenceSixViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = XQQRandomColor;
    self.type = @"1";
}
//1为全部 10为图片 29为段子 31为音频 41为视频

//- (void)loadRequestWithMaxtime:(NSString *)maxtime type:(NSString *)type{
//    [super loadRequestWithMaxtime:@"" type:@"1"];
//}
//- (void)loadMoreDataWithMxTime:(NSString*)maxtime
//                          type:(NSString*)type{
//    [super loadMoreDataWithMxTime:maxtime type:@"1"];
//}
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

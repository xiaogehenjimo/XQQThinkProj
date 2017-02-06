//
//  XQQFollowViewController.m
//  XQQThinkProj
//
//  Created by XQQ on 16/9/22.
//  Copyright © 2016年 UIP. All rights reserved.
//

#import "XQQFollowViewController.h"
#import "XQQRecommendViewController.h"
#import "XQQRegistViewController.h"
@interface XQQFollowViewController ()

@end

@implementation XQQFollowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置UI
    [self setUpTitleView];
    
}

/**设置UI*/
- (void)setUpTitleView{
    self.view.backgroundColor = XQQBGColor;
    //左边按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"friendsRecommentIcon" hightImage:@"friendsRecommentIcon-click" target:self action:@selector(leftItemClicked)];
    //中间的label
    CGFloat centerLabelW = iphoneWidth * 0.7;
    CGFloat centerLabelH = 80;
    CGFloat centerLabelX = (iphoneWidth - centerLabelW) /2;
    CGFloat centerLabelY = (iphoneHeight - centerLabelH)/2;
    UILabel * centerLabel = [[UILabel alloc]initWithFrame:CGRectMake(centerLabelX, centerLabelY, centerLabelW, centerLabelH)];
    centerLabel.numberOfLines = 0;
    centerLabel.textAlignment = NSTextAlignmentCenter;
    centerLabel.font = [UIFont systemFontOfSize:16];
    centerLabel.text = @"快快登录吧,关注百思最in牛人\n好友动态让你过把瘾儿~\n欧耶~~~!";
    [self.view addSubview:centerLabel];
    //imageView
    CGFloat centerImageW = 40;
    CGFloat centerImageH = centerImageW;
    CGFloat centerImageX = (iphoneWidth - centerImageW) * 0.5;
    CGFloat centerImageY = centerLabelY - 30 - centerImageH;
    UIImageView * centerImage = [[UIImageView alloc]initWithFrame:CGRectMake(centerImageX, centerImageY, centerImageW, centerImageH)];
    centerImage.image = [UIImage imageNamed:@"header_cry_icon"];
    [self.view addSubview:centerImage];
    //下方按钮
    UIButton * bottomButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    [bottomButton setBackgroundImage:[UIImage imageNamed:@"friendsTrend_login"] forState:UIControlStateNormal];
    [bottomButton setBackgroundImage:[UIImage imageNamed:@"friendsTrend_login_click"] forState:UIControlStateHighlighted];
    [bottomButton setTitle:@"立即登录注册" forState:UIControlStateNormal];
    [bottomButton setTitle:@"立即登录注册" forState:UIControlStateHighlighted];
    [bottomButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [bottomButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [bottomButton sizeToFit];
    bottomButton.center = CGPointMake(self.view.center.x, CGRectGetMaxY(centerLabel.frame) + centerImageH + 20);
    [bottomButton addTarget:self action:@selector(bottomBtnDidPress) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bottomButton];
}
#pragma mark - activity
//立即登录注册点击
- (void)bottomBtnDidPress{
    //弹出登录页面
    XQQRegistViewController * registVC = [[XQQRegistViewController alloc]init];
    [self presentViewController:registVC animated:YES completion:nil];
}
- (void)leftItemClicked{
    XQQRecommendViewController * recomendVC = [[XQQRecommendViewController alloc]init];
    [self.navigationController pushViewController:recomendVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end

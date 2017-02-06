//
//  XQQNavgationController.m
//  XQQThinkProj
//
//  Created by XQQ on 16/9/22.
//  Copyright © 2016年 UIP. All rights reserved.
//

#import "XQQNavgationController.h"

@interface XQQNavgationController ()<UIGestureRecognizerDelegate>

@end

@implementation XQQNavgationController

- (void)viewDidLoad {
    [super viewDidLoad];
    //右划退出
    self.interactivePopGestureRecognizer.delegate = self;
    //配置导航条
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count > 0) {
        //设置左上角的按钮
        UIButton * backItem = [[UIButton alloc]init];
        [backItem setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [backItem setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        [backItem setTitle:@"返回" forState:UIControlStateNormal];
        [backItem setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [backItem setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [backItem sizeToFit];
        backItem.imageEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
        backItem.titleEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
        [backItem addTarget:self action:@selector(backItemClicked) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backItem];
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    return self.viewControllers.count > 1;
}
- (void)backItemClicked{
    [self popViewControllerAnimated:YES];
}

@end

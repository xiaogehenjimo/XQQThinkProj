//
//  XQQTabBarController.m
//  XQQThinkProj
//
//  Created by XQQ on 16/9/22.
//  Copyright © 2016年 UIP. All rights reserved.
//

#import "XQQTabBarController.h"
#import "XQQCommentViewController.h"
#import "XQQMeViewController.h"
#import "XQQFollowViewController.h"
#import "XQQNewViewController.h"
#import "XQQEssenceViewController.h"
#import "XQQTabBar.h"
#import "XQQNavgationController.h"
@interface XQQTabBarController ()

@end

@implementation XQQTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置所有的tabbarItem的文字属性
    [self setUpTabBarItems];
    //设置子控制器
    [self addViewControllers];
    //更换tabBar
    [self changeTabBar];
}
/**更换tabBar*/
- (void)changeTabBar{
    XQQTabBar * tabBar = [[XQQTabBar alloc]init];
    tabBar.didPress = ^(){
        XQQCommentViewController * commentVC = [[XQQCommentViewController alloc]init];
        [self presentViewController:commentVC animated:YES completion:nil];
    };
    [self setValue:tabBar forKey:@"tabBar"];
}
/**设置子控制器*/
- (void)addViewControllers{
    NSArray * controllersName = @[@"XQQEssenceViewController",@"XQQNewViewController",@"XQQFollowViewController",@"XQQMeViewController"];
    NSArray * normalImageArr = @[@"tabBar_essence_icon",@"tabBar_new_icon",@"tabBar_friendTrends_icon",@"tabBar_me_icon"];
    NSArray * titleArr = @[@"精华",@"新帖",@"关注",@"我的"];
    NSArray * seletedImageArr = @[@"tabBar_essence_click_icon",@"tabBar_new_click_icon",@"tabBar_friendTrends_click_icon",@"tabBar_me_click_icon"];
    for (NSInteger i = 0; i < controllersName.count; i ++) {
        Class class = NSClassFromString(controllersName[i]);
        UIViewController * vc = [[class alloc]init];
        vc.title = titleArr[i];
        vc.tabBarItem.title = titleArr[i];
        vc.tabBarItem.image = [UIImage imageNamed:normalImageArr[i]];
        vc.tabBarItem.selectedImage = [UIImage imageNamed:seletedImageArr[i]];
        XQQNavgationController * nav = [[XQQNavgationController alloc]initWithRootViewController:vc];
        [self addChildViewController:nav];
    }
}
/**设置所有的tabbarItem的文字属性*/
- (void)setUpTabBarItems{
    UITabBarItem * item = [UITabBarItem appearance];
    //普通状态下的文字属性
    NSMutableDictionary * normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    [item setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    //选中状态下的
    NSMutableDictionary * seletedAttrs = [NSMutableDictionary dictionary];
    seletedAttrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    [item setTitleTextAttributes:seletedAttrs forState:UIControlStateSelected];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

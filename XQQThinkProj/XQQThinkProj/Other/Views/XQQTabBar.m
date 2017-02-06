//
//  XQQTabBar.m
//  XQQThinkProj
//
//  Created by XQQ on 16/9/22.
//  Copyright © 2016年 UIP. All rights reserved.
//

#import "XQQTabBar.h"

@interface XQQTabBar ()
/**中间的按钮*/
@property (nonatomic ,strong)UIButton * centerBtn;
@end

@implementation XQQTabBar

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundImage = [UIImage imageNamed:@"tabbar-light"];
        UIButton * button = [[UIButton alloc]init];
        [button setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(centerBtnDidPress) forControlEvents:UIControlEventTouchUpInside];
        _centerBtn = button;
        [self addSubview:button];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.centerBtn.centerX = self.width * 0.5;
    self.centerBtn.centerY = self.height * 0.5;
    //设置其他tabBarItem的frame
    CGFloat tabBarBtnW = self.width / 5 ;
    CGFloat tabBarBtnIndex = 0;
    for (UIView * child in self.subviews) {
        Class class = NSClassFromString(@"UITabBarButton");
        if ([child isKindOfClass:class]) {
            //设置X
            child.x = tabBarBtnIndex * tabBarBtnW;
            child.width = tabBarBtnW;
            //增加索引
            tabBarBtnIndex ++;
            if (tabBarBtnIndex == 2) {
                tabBarBtnIndex ++;
            }
        }
    }
    //设置中间的按钮frame
    self.centerBtn.width = tabBarBtnW;
    self.centerBtn.height = self.height;
    self.centerBtn.centerX = self.width * 0.5;
    self.centerBtn.centerY = self.height * 0.5;
}
- (void)centerBtnDidPress{
    _didPress();
}
@end

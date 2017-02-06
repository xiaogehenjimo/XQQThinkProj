//
//  XQQRefreshNormalHeader.m
//  XQQThinkProj
//
//  Created by XQQ on 16/10/17.
//  Copyright © 2016年 UIP. All rights reserved.
//

#import "XQQRefreshNormalHeader.h"

@implementation XQQRefreshNormalHeader

- (void)prepare{
    [super prepare];
    self.automaticallyChangeAlpha = YES;
//    self.lastUpdatedTimeLabel.textColor = [UIColor orangeColor];
//    self.stateLabel.textColor = [UIColor orangeColor];
    [self setTitle:@"下拉就能刷新" forState:MJRefreshStateIdle];
    [self setTitle:@"麻溜的松开手" forState:MJRefreshStatePulling];
    [self setTitle:@"爷们正在刷新..." forState:MJRefreshStateRefreshing];
}

@end

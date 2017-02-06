//
//  XQQMeFootView.m
//  XQQThinkProj
//
//  Created by XQQ on 16/10/10.
//  Copyright © 2016年 UIP. All rights reserved.
//

#import "XQQMeFootView.h"
#import "XQQMeSquare.h"
#import "XQQMeSqureBtn.h"
#import "XQQWebViewController.h"
@interface XQQMeFootView ()

@end

@implementation XQQMeFootView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [[XQQAPIClient sharedAPIClient] getMeListWithMethod:@"GET" success:^(id respondObject) {
            NSArray * squareList = respondObject[@"square_list"];
            if (squareList.count) {
                NSMutableArray * modelArr = @[].mutableCopy;
                for (NSDictionary * infoDic in squareList) {
                    XQQMeSquare * squre = [[XQQMeSquare alloc]init];
                    [squre setValuesForKeysWithDictionary:infoDic];
                    [modelArr addObject:squre];
                }
                //创建对应的控件
                [self createSqureWithArr:modelArr];
            }
        } failure:^(NSError *error) {
            XQQLog(@"请求失败");
        }];
    }
    return self;
}
/**创建对应的控件*/
- (void)createSqureWithArr:(NSArray*)squreArr{
    //方块的个数
    NSUInteger count = squreArr.count;
    //方块的尺寸
    NSUInteger maxColCount = 4;
    CGFloat buttonW = iphoneWidth / maxColCount;
    CGFloat buttonH = buttonW;
    
    //创建所有的方块
    for (NSInteger i = 0; i < count; i ++) {
        XQQMeSqureBtn * button = [XQQMeSqureBtn buttonWithType:UIButtonTypeCustom];
        [button addTarget:self action:@selector(buttonDidClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        //设置frame
        button.x = (i % maxColCount) * buttonW;
        button.y = (i / maxColCount) * buttonH;
        button.width = buttonW;
        button.height = buttonH;
        //设置数据
        button.model = squreArr[i];
        //设置footView的高度
        self.height = self.subviews.lastObject.bottom;
        //设置tabelView的contentSize
        UITableView * tabelView = (UITableView*)self.superview;
        tabelView.tableFooterView = self;
        [tabelView reloadData];
    }
}

/**按钮点击*/
- (void)buttonDidClicked:(XQQMeSqureBtn *)button{
    NSString * url = button.model.url;
    if ([url hasPrefix:@"http"]) {//是网址
        XQQWebViewController * webView = [[XQQWebViewController alloc]init];
        webView.url = url;
        webView.navigationItem.title = button.currentTitle;
        //找到导航栏控制器
        UITabBarController * tabBarController = (UITabBarController*)self.window.rootViewController;
        UINavigationController * navGationController = tabBarController.selectedViewController;
        [navGationController pushViewController:webView animated:YES];
    }else if ([url hasPrefix:@"mod"]){//另行处理
        if ([url hasSuffix:@"BDJ_To_Check"]) {
            XQQLog(@"跳转到[审帖]界面");
        } else if ([url hasSuffix:@"BDJ_To_RecentHot"]) {
            XQQLog(@"跳转到[每日排行]界面");
        } else {
            XQQLog(@"跳转到其他界面");
        }
    }else{
        XQQLog(@"不是http或者mod协议");
    }
    
}
@end

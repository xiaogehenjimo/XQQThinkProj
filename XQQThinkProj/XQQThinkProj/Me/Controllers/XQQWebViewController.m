//
//  XQQWebViewController.m
//  XQQThinkProj
//
//  Created by XQQ on 16/10/11.
//  Copyright © 2016年 UIP. All rights reserved.
//

#import "XQQWebViewController.h"
@interface XQQWebViewController ()<UIWebViewDelegate>
@property(nonatomic,strong) UIWebView * webView;
/**toolbar*/
@property(nonatomic, strong)  UIToolbar  *  toolBar;
/**返回*/
@property(nonatomic, strong)  UIBarButtonItem  *  backItem;
/**刷新*/
@property(nonatomic, strong)  UIBarButtonItem  *  refreshItem;
/**前进*/
@property(nonatomic, strong)  UIBarButtonItem  *  forwordItem;
@end

@implementation XQQWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //UI
    _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, iphoneWidth, iphoneHeight)];
    _webView.delegate = self;
    [self.view addSubview:self.webView];
    NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:_url]];
    [_webView loadRequest:request];
    [self initUI];
}
/**UI*/
- (void)initUI{
    //添加items
    NSMutableArray * tmpArr = @[].mutableCopy;
    _backItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(backClicked)];
     _refreshItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refreshItemClicked)];
     _forwordItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(forwordItemClicked)];
    NSArray * arr = @[_backItem,_refreshItem,_forwordItem];
    //创建木棍
    [tmpArr addObject:[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil]];
    for (NSInteger i = 0; i < arr.count; i ++) {
        [tmpArr addObject:arr[i]];
        //添加弹簧
        [tmpArr addObject:[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil]];
    }
    [tmpArr removeLastObject];
    [tmpArr addObject:[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil]];
    self.toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, iphoneHeight - 49, iphoneWidth, 49)];
    [self.toolBar setBarStyle:UIBarStyleDefault];
    self.toolBar.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    [self.toolBar setItems:tmpArr];
    [self.view addSubview:self.toolBar];
}

- (void)backClicked{
    [self.webView goBack];
}
- (void)refreshItemClicked{
    [self.webView reload];
}
- (void)forwordItemClicked{
    [self.webView goForward];
}
#pragma mark - <UIWebViewDelegate>
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    self.backItem.enabled = webView.canGoBack;
    self.forwordItem.enabled = webView.canGoForward;
}
@end

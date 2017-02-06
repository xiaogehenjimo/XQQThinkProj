//
//  XQQRegistViewController.m
//  XQQThinkProj
//
//  Created by XQQ on 16/9/28.
//  Copyright © 2016年 UIP. All rights reserved.
//

#import "XQQRegistViewController.h"

@interface XQQRegistViewController ()
@property (strong, nonatomic) IBOutlet UIButton *loginBtn;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *leftmargen;

@end

@implementation XQQRegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}
/**退出按钮*/
- (IBAction)outBtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
/**登录或者注册按钮*/
- (IBAction)loginOrRegist:(UIButton*)button {
    //退出键盘
    [self.view endEditing:YES];
    //约束界面
    if (self.leftmargen.constant) {
        self.leftmargen.constant = 0;
        [button setTitle:@"注册账号" forState:UIControlStateNormal];
    }else{
        self.leftmargen.constant = -self.view.width;
        [button setTitle:@"已有账号?" forState:UIControlStateNormal];
    }
    [UIView animateWithDuration:.2f animations:^{
        [self.view layoutIfNeeded];
    }];
}
/**改变状态栏的颜色*/
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //退出键盘
    [self.view endEditing:YES];
}
@end

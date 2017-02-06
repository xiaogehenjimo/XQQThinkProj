//
//  XQQLoginTextField.m
//  XQQThinkProj
//
//  Created by XQQ on 16/9/29.
//  Copyright © 2016年 UIP. All rights reserved.
//

#import "XQQLoginTextField.h"
#import <objc/runtime.h>
static NSString * const placeholderKey = @"placeholderLabel.textColor";
@implementation XQQLoginTextField

- (void)awakeFromNib{
    [super awakeFromNib];
    self.tintColor = [UIColor whiteColor];
//    NSDictionary * attrDict = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
//    NSAttributedString * str = [[NSAttributedString alloc]initWithString:self.placeholder attributes:attrDict];
//    self.attributedPlaceholder = str;
    /**打印出这个类的所有属性*/
    //[XQQRuntimeTool logAllPropertyWithClass:[UITextField class]];
    //改变颜色
   id observer = [[NSNotificationCenter defaultCenter] addObserverForName:UITextFieldTextDidBeginEditingNotification object:self queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
       [self setValue:[UIColor whiteColor] forKeyPath:placeholderKey];
       //一次性通知
       [[NSNotificationCenter defaultCenter] removeObserver:observer];
    }];
    id endObserver = [[NSNotificationCenter defaultCenter] addObserverForName:UITextFieldTextDidEndEditingNotification object:self queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        [self setValue:[UIColor grayColor] forKeyPath:placeholderKey];
        //一次性通知
        [[NSNotificationCenter defaultCenter] removeObserver:endObserver];
    }];
}



@end

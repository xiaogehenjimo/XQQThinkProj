//
//  XQQFactory.m
//  XQQThinkProj
//
//  Created by XQQ on 16/9/26.
//  Copyright © 2016年 UIP. All rights reserved.
//

#import "XQQFactory.h"
#define TitleBtnColor [UIColor blueColor]
@implementation XQQFactory
/**UIBarButtonItem*/
+ (UIBarButtonItem*)itemWithImage:(NSString*)image
                       hightImage:(NSString*)heightImage
                           target:(id)target
                           action:(SEL)action{
    UIButton * item = [[UIButton alloc]init];
    [item setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [item setImage:[UIImage imageNamed:heightImage] forState:UIControlStateHighlighted];
    [item addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [item sizeToFit];
    return [[UIBarButtonItem alloc]initWithCustomView:item];
}
/**titleBtn*/
+ (UIButton*)buttonWithFrame:(CGRect)frame
                       title:(NSString*)title
                      target:(id)target
                      action:(SEL)action{
    UIButton * button = [[UIButton alloc]initWithFrame:frame];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateHighlighted];
    [button setTitleColor:TitleBtnColor forState:UIControlStateNormal];
    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}
/**imageBtn*/
+ (UIButton*)buttonWithFrame:(CGRect)frame
                       image:(NSString*)image
                  hightImage:(NSString*)hightImage
                      target:(id)target
                      action:(SEL)action{
    UIButton * button = [[UIButton alloc]initWithFrame:frame];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:hightImage] forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

/**UITextField*/
+ (UITextField*)textFieldWithFrame:(CGRect)frame
                          delegate:(id)delegate{
    UITextField * textField = [[UITextField alloc]initWithFrame:frame];
    textField.delegate = delegate;
    return textField;
}

@end

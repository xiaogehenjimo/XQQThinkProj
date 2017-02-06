//
//  UIBarButtonItem+XQQExtension.m
//  XQQThinkProj
//
//  Created by XQQ on 16/9/26.
//  Copyright © 2016年 UIP. All rights reserved.
//

#import "UIBarButtonItem+XQQExtension.h"

@implementation UIBarButtonItem (XQQExtension)
/**UIBarButtonItem*/
+ (instancetype)itemWithImage:(NSString*)image
                       hightImage:(NSString*)heightImage
                           target:(id)target
                           action:(SEL)action{
    UIButton * item = [[UIButton alloc]init];
    [item setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [item setImage:[UIImage imageNamed:heightImage] forState:UIControlStateHighlighted];
    [item addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [item sizeToFit];
    return [[self alloc]initWithCustomView:item];
}

@end

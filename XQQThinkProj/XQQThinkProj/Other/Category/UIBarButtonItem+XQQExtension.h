//
//  UIBarButtonItem+XQQExtension.h
//  XQQThinkProj
//
//  Created by XQQ on 16/9/26.
//  Copyright © 2016年 UIP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (XQQExtension)
/**UIBarButtonItem*/
+ (instancetype)itemWithImage:(NSString*)image
                       hightImage:(NSString*)heightImage
                           target:(id)target
                           action:(SEL)action;
@end

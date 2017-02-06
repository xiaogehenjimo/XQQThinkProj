//
//  XQQFactory.h
//  XQQThinkProj
//
//  Created by XQQ on 16/9/26.
//  Copyright © 2016年 UIP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface XQQFactory : NSObject
/**UIBarButtonItem*/
+ (UIBarButtonItem*)itemWithImage:(NSString*)image
                       hightImage:(NSString*)heightImage
                           target:(id)target
                           action:(SEL)action;
/**titleBtn*/
+ (UIButton*)buttonWithFrame:(CGRect)frame
                       title:(NSString*)title
                      target:(id)target
                      action:(SEL)action;
/**imageBtn*/
+ (UIButton*)buttonWithFrame:(CGRect)frame
                       image:(NSString*)image
                  hightImage:(NSString*)hightImage
                      target:(id)target
                      action:(SEL)action;
/**UITextField*/
+ (UITextField*)textFieldWithFrame:(CGRect)frame
                          delegate:(id)delegate;
@end

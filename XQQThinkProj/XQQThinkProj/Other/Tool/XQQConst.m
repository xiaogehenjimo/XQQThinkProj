//
//  XQQConst.m
//  XQQThinkProj
//
//  Created by XQQ on 16/10/10.
//  Copyright © 2016年 UIP. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 通用的间距值 */
CGFloat const XQQMargin = 10;
/** 通用的小间距值 */
CGFloat const XQQSmallMargin = XQQMargin * 0.5;

/** 公共的URL */
NSString * const XQQCommonURL = @"http://api.budejie.com/api/api_open.php";

/** XQQUser - sex - male */
NSString * const XQQUserSexMale = @"m";

/** XQQUser - sex - female */
NSString * const XQQUserSexFemale = @"f";

/*** 通知 ***/
/** TabBar按钮被重复点击的通知 */
NSString * const XQQTabBarButtonDidRepeatClickNotification = @"XQQTabBarButtonDidRepeatClickNotification";
/** 标题按钮被重复点击的通知 */
NSString * const XQQTitleButtonDidRepeatClickNotification = @"XQQTitleButtonDidRepeatClickNotification";

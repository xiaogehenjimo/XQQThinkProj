//
//  XQQTabBar.h
//  XQQThinkProj
//
//  Created by XQQ on 16/9/22.
//  Copyright © 2016年 UIP. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^centerBtnDidPress)();
@interface XQQTabBar : UITabBar
@property (nonatomic, copy)  centerBtnDidPress didPress;
@end

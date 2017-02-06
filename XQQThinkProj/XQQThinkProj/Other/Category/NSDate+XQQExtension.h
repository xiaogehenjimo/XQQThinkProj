//
//  NSDate+XQQExtension.h
//  XQQThinkProj
//
//  Created by XQQ on 16/10/18.
//  Copyright © 2016年 UIP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (XQQExtension)
/**是否为今年*/
- (BOOL)isThisYear_XQQadd;
/**是否为今天*/
- (BOOL)isToday_XQQadd;
/**是否为昨天*/
- (BOOL)isYesterday_XQQadd;
/**是否为明天*/
- (BOOL)isTomorrow_XQQadd;
@end

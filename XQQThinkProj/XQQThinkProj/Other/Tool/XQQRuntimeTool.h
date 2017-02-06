//
//  XQQRuntimeTool.h
//  XQQThinkProj
//
//  Created by XQQ on 16/9/29.
//  Copyright © 2016年 UIP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
@interface XQQRuntimeTool : NSObject
+ (void)logAllPropertyWithClass:(Class)class;
@end

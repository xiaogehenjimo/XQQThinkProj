//
//  XQQRuntimeTool.m
//  XQQThinkProj
//
//  Created by XQQ on 16/9/29.
//  Copyright © 2016年 UIP. All rights reserved.
//

#import "XQQRuntimeTool.h"

@implementation XQQRuntimeTool

+ (void)logAllPropertyWithClass:(Class)class{
    unsigned int count;
    Ivar *ivarList = class_copyIvarList(class, &count);
    for (int i = 0; i < count; i ++) {
        Ivar ivar = ivarList[i];
        NSLog(@"%s",ivar_getName(ivar));
    }
    free(ivarList);
}
@end

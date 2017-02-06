//
//  XQQMeSquare.m
//  XQQThinkProj
//
//  Created by XQQ on 16/10/10.
//  Copyright © 2016年 UIP. All rights reserved.
//

#import "XQQMeSquare.h"

@implementation XQQMeSquare
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        _ID = value;
    }
}
- (id)valueForUndefinedKey:(NSString *)key{
    return nil;
}
@end

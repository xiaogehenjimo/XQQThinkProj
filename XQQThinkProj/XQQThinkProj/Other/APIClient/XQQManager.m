//
//  XQQManager.m
//  XQQThinkProj
//
//  Created by XQQ on 16/10/14.
//  Copyright © 2016年 UIP. All rights reserved.
//

#import "XQQManager.h"

@interface XQQManager ()
/**精华部分的时间信息字典*/
//@property(nonatomic, strong)  NSMutableDictionary  *  essenceDict;
@end


@implementation XQQManager

static NSMutableDictionary * _essenceDict;

+ (instancetype)sharedManager{
    static XQQManager * manager = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        manager = [[XQQManager alloc]init];
        _essenceDict = [[NSMutableDictionary alloc]init];
    });
    return manager;
}

#pragma mark - setter&getter
/**获取maxtime*/
- (NSString*)getMaxtimeWithKey:(NSString*)key{
    
    return [_essenceDict objectForKey:key];;
}
/**更新字典*/
- (void)updateInfoDict:(NSDictionary*)infoDict
                   key:(NSString*)key{
    [_essenceDict setValue:infoDict[@"maxtime"] forKey:key];
}


@end

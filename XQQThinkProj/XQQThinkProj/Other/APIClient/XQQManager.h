//
//  XQQManager.h
//  XQQThinkProj
//
//  Created by XQQ on 16/10/14.
//  Copyright © 2016年 UIP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XQQManager : NSObject
/** 播放器正在播放的indexPath */
@property(nonatomic, strong)  NSIndexPath  *  playingIndexPath;
/**获取实例*/
+ (instancetype)sharedManager;

/**获取maxtime*/
- (NSString*)getMaxtimeWithKey:(NSString*)key;
/**更新字典*/
- (void)updateInfoDict:(NSDictionary*)infoDict
                   key:(NSString*)key;
@end

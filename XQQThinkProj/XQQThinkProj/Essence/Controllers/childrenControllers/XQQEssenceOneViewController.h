//
//  XQQEssenceOneViewController.h
//  XQQThinkProj
//
//  Created by XQQ on 16/10/14.
//  Copyright © 2016年 UIP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XQQEssenceOneViewController : UIViewController
/** 类型 */
@property (nonatomic, copy)  NSString  *  type;
/**请求数据*/
- (void)loadRequestWithMaxtime:(NSString*)maxtime
                          type:(NSString*)type;
/**请求更多数据*/
- (void)loadMoreDataWithMxTime:(NSString*)maxtime
                          type:(NSString*)type;
@end

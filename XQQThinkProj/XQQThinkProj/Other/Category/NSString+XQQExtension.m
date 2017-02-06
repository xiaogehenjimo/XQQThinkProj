//
//  NSString+XQQExtension.m
//  XQQThinkProj
//
//  Created by XQQ on 16/10/12.
//  Copyright © 2016年 UIP. All rights reserved.
//

#import "NSString+XQQExtension.h"

@implementation NSString (XQQExtension)
- (unsigned long long)fileSize{
    //总大小
    unsigned long long size = 0;
    //com.hackemist.SDWebImageCache.default
    //找到caches文件夹
    //NSString * cachesPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
    //拼接其他的文件夹
    //default
   // NSString * dirPath = [cachesPath stringByAppendingPathComponent:@"default/com.hackemist.SDWebImageCache.default"];
    //文件管理者
    NSFileManager * fileManager = [NSFileManager defaultManager];
    NSDictionary * attrs = [fileManager attributesOfItemAtPath:self error:nil];
    if ([attrs.fileType isEqualToString:NSFileTypeDirectory]) {//文件夹
        //获得文件夹的大小
        NSDirectoryEnumerator * enumerator = [fileManager enumeratorAtPath:self];
        // NSArray * arr = [fileManager subpathsAtPath:dirPath];
        for (NSString * subPath in enumerator) {
            //拼接全路径
            NSString * fullPath = [self stringByAppendingPathComponent:subPath];
            //计算文件大小
            NSDictionary * attrs = [fileManager attributesOfItemAtPath:fullPath error:nil];
            size += attrs.fileSize;
        }
    }else{//文件
        size = attrs.fileSize;
    }
    return size;
}
@end

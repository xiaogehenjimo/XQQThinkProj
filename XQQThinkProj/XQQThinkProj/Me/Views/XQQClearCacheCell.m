//
//  XQQClearCacheCell.m
//  XQQThinkProj
//
//  Created by XQQ on 16/10/12.
//  Copyright © 2016年 UIP. All rights reserved.
//

#import "XQQClearCacheCell.h"
#import <SDImageCache.h>
#define cachePath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"default/com.hackemist.SDWebImageCache.default"]
#define cachePath1 @"/Users/gl/Desktop/项目源码"
@implementation XQQClearCacheCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        UIActivityIndicatorView * loadingView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [loadingView setHidesWhenStopped:YES];
        [loadingView startAnimating];
        self.accessoryView = loadingView;
        self.textLabel.text = @"正在计算缓存大小...";
        self.userInteractionEnabled = NO;
        __weak typeof(self)weakSelf = self;
        //子线程
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            unsigned long long size = cachePath1.fileSize;
            //换算大小
            NSString * sizeText = nil;
            if (size >= pow(10, 9)) {//size >= 1GB
                sizeText = [NSString stringWithFormat:@"%.2fGB",size/pow(10, 9)];
            }else if (size >= pow(10, 6)){//1MB 1GB >= size >= 1MB
                sizeText = [NSString stringWithFormat:@"%.2fMB",size/pow(10, 6)];
            }else if(size >= pow(10, 3)){//1KB 1MB >= size >= 1KB
                sizeText = [NSString stringWithFormat:@"%.2fKB",size/pow(10, 3)];
            }else{//1KB >= size
                sizeText = [NSString stringWithFormat:@"%zdB",size];
            }
            NSString * text = [NSString stringWithFormat:@"清除缓存(%@)",sizeText];
            //回到主线程
            dispatch_async(dispatch_get_main_queue(), ^{
                weakSelf.accessoryView = nil;
                weakSelf.textLabel.text = text;
                weakSelf.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                [weakSelf setSelected:YES];
            });
            [self addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clearCache)]];
            self.userInteractionEnabled = YES;
        });
    }
    return self;
}

/**清除缓存*/
- (void)clearCache{
    [SVProgressHUD showWithStatus:@"清除中..."];
    [[SDImageCache sharedImageCache] clearDiskOnCompletion:^{
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSFileManager * fileManager = [NSFileManager defaultManager];
            sleep(2);
            [fileManager createDirectoryAtPath:cachePath withIntermediateDirectories:YES attributes:nil error:nil];
            dispatch_async(dispatch_get_main_queue(), ^{
                [SVProgressHUD dismiss];
                self.textLabel.text = @"清除缓存(0B)";
            });
        });
    }];
}

//右面菊花
- (void)layoutSubviews{
    [super layoutSubviews];
    UIActivityIndicatorView * loadingView = (UIActivityIndicatorView*)self.accessoryView;
    [loadingView startAnimating];
}
@end

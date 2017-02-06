//
//  XQQSetViewController.m
//  XQQThinkProj
//
//  Created by XQQ on 16/9/26.
//  Copyright © 2016年 UIP. All rights reserved.
//

#import "XQQSetViewController.h"
#import "XQQClearCacheCell.h"
static NSString * const clearCacheCellID = @"XQQClearCacheCell";
@interface XQQSetViewController ()

@end

@implementation XQQSetViewController

- (instancetype)init{
    return [self initWithStyle:UITableViewStyleGrouped];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //UI
    [self initUI];
    //清除缓存
    //[self clearCache];
    XQQLog(@"%zd",@"default/com.hackemist.SDWebImageCache.default".fileSize);
}

- (void)clearCache{
   // NSLog(@"%@",NSHomeDirectory());
    unsigned long long size = 0;
    //com.hackemist.SDWebImageCache.default
    //找到caches文件夹
    NSString * cachesPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
    //拼接其他的文件夹
    //default
    NSString * dirPath = [cachesPath stringByAppendingPathComponent:@"default/com.hackemist.SDWebImageCache.default"];
    //文件管理者
    NSFileManager * fileManager = [NSFileManager defaultManager];
    //获得文件夹的大小
    NSArray * arr = [fileManager subpathsAtPath:dirPath];
    for (NSString * subPath in arr) {
        //拼接全路径
        NSString * fullPath = [dirPath stringByAppendingPathComponent:subPath];
        //计算文件大小
      NSDictionary * attrs = [fileManager attributesOfItemAtPath:fullPath error:nil];
        size += attrs.fileSize;
    }
    //XQQLog(@"%zd",size/1000/1000);
}
- (void)clearCache2{
    
    NSLog(@"%@",NSHomeDirectory());
    unsigned long long size = 0;
    
    //com.hackemist.SDWebImageCache.default
    //找到caches文件夹
    NSString * cachesPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
    //拼接其他的文件夹
    //default
    NSString * dirPath = [cachesPath stringByAppendingPathComponent:@"default/com.hackemist.SDWebImageCache.default"];
    //文件管理者
    NSFileManager * fileManager = [NSFileManager defaultManager];
    //获得文件夹的大小
    NSDirectoryEnumerator * enumerator = [fileManager enumeratorAtPath:dirPath];
   // NSArray * arr = [fileManager subpathsAtPath:dirPath];
    for (NSString * subPath in enumerator) {
        //拼接全路径
        NSString * fullPath = [dirPath stringByAppendingPathComponent:subPath];
        //计算文件大小
        NSDictionary * attrs = [fileManager attributesOfItemAtPath:fullPath error:nil];
        size += attrs.fileSize;
    }
    XQQLog(@"%zd",size/1024/1024);
}

/**UI*/
- (void)initUI{
    self.navigationItem.title = @"设置";
    self.view.backgroundColor = XQQRandomColor;
    [self.tableView registerClass:[XQQClearCacheCell class] forCellReuseIdentifier:clearCacheCellID];
}

#pragma mark - UITabelViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 80;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        XQQClearCacheCell * cell = [tableView dequeueReusableCellWithIdentifier:clearCacheCellID forIndexPath:indexPath];
        return cell;
    }else{
        return [[UITableViewCell alloc]init];
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end

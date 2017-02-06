//
//  XQQFastLoginBtn.m
//  XQQThinkProj
//
//  Created by XQQ on 16/9/28.
//  Copyright © 2016年 UIP. All rights reserved.
//

#import "XQQFastLoginBtn.h"

@implementation XQQFastLoginBtn

- (void)awakeFromNib{
    [super awakeFromNib];
//    self.imageView.backgroundColor = [UIColor redColor];
//    self.titleLabel.backgroundColor = [UIColor yellowColor];
//    self.backgroundColor = [UIColor blueColor];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.centerX = self.width/2;
    self.imageView.y = 0;
    self.titleLabel.x = 0;
    self.titleLabel.width = self.width;
    self.titleLabel.y = CGRectGetMaxY(self.imageView.frame);
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.height = self.height - self.imageView.height;
}
@end

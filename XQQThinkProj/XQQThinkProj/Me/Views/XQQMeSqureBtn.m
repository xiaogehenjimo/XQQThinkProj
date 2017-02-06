//
//  XQQMeSqureBtn.m
//  XQQThinkProj
//
//  Created by XQQ on 16/10/11.
//  Copyright © 2016年 UIP. All rights reserved.
//

#import "XQQMeSqureBtn.h"
#import <UIButton+WebCache.h>
@implementation XQQMeSqureBtn
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage imageNamed:@"mainCellBackground"] forState:UIControlStateNormal];
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.y = self.height * 0.15;
    self.imageView.height = self.height * 0.5;
    self.imageView.width = self.imageView.height;
    self.imageView.centerX = self.width * 0.5;
    self.titleLabel.x = 0;
    self.titleLabel.y = self.imageView.bottom;
    self.titleLabel.width = self.width;
    self.titleLabel.height = self.height - self.titleLabel.y;
}
- (void)setModel:(XQQMeSquare *)model{
    _model = model;
    [self setTitle:model.name forState:UIControlStateNormal];
    [self sd_setImageWithURL:[NSURL URLWithString:model.icon] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"setup-head-default"]];
}

@end

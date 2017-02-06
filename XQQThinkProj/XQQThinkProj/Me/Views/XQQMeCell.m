//
//  XQQMeCell.m
//  XQQThinkProj
//
//  Created by XQQ on 16/10/11.
//  Copyright © 2016年 UIP. All rights reserved.
//

#import "XQQMeCell.h"

@implementation XQQMeCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.textLabel.textColor = [UIColor darkGrayColor];
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainCellBackground"]];
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.y = XQQMargin * 0.5;
    self.imageView.height = self.contentView.height - 2 * XQQSmallMargin;
    self.imageView.width = self.imageView.height;
    //label
    self.textLabel.x = self.imageView.right + XQQMargin;
}

@end

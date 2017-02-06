//
//  XQQEssenceVideoView.h
//  XQQThinkProj
//
//  Created by XQQ on 16/10/19.
//  Copyright © 2016年 UIP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XQQEssenceFrameModel.h"
#import "XQQEssenceModel.h"

typedef void(^videoImageViewDidPress)(UIView * view);
@interface XQQEssenceVideoView : UIView
/** 视频按钮 */
@property(nonatomic, strong)  UIImageView  *  videoImageView;
/** 数据模型 */
@property(nonatomic, strong)  XQQEssenceModel  *  essenceModel;
/** 音频点击 */
@property (nonatomic, copy)  videoImageViewDidPress  videoDidPress;


@end

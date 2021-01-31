//
//  UIButton+ButtonHelper.h
//  MyProject
//
//  Created by 互娱盘古 on 2020/6/29.
//  Copyright © 2020 小小程序员. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+FrameHelper.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (ButtonHelper)

@property(nonatomic,assign)CGFloat wSpace;//外扩宽度
@property(nonatomic,assign)CGRect txtRect;//文字坐标
@property(nonatomic,assign)CGRect imgRect;//图片坐标

@end

NS_ASSUME_NONNULL_END

//
//  UIView+FrameHelper.h
//  RoomProject
//
//  Created by 赵凯 on 2019/11/5.
//  Copyright © 2019 赵凯. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+ColorHelper.h"

NS_ASSUME_NONNULL_BEGIN

//CGPoint CGRectGetCenter(CGRect rect);
CGRect  CGRectMoveToCenter(CGRect rect, CGPoint center);

@interface UIView (FrameHelper)

@property CGPoint origin;
@property CGSize size;

@property (readonly) CGPoint bottomLeft;
@property (readonly) CGPoint bottomRight;
@property (readonly) CGPoint topRight;


@property CGFloat x;
@property CGFloat y;

@property CGFloat height;
@property CGFloat width;

@property CGFloat top;
@property CGFloat left;

@property CGFloat bottom;
@property CGFloat right;

@property CGFloat centerX;

@property CGFloat centerY;

- (void) moveBy: (CGPoint) delta;
- (void) scaleBy: (CGFloat) scaleFactor;
- (void) fitInSize: (CGSize) aSize;

/// 设置圆角
/// @param radius 角度
-(void)setCornerRadius:(CGFloat)radius;

/// 设置圆角和边框
/// @param color 颜色
/// @param radius 角度
-(void)setBorderColor:(UIColor *)color cornerRadius:(CGFloat)radius;

/// 设置卡片效果
-(void)setCardShadow:(CGFloat)radius;

@end

NS_ASSUME_NONNULL_END

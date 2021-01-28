//
//  UIColor+ColorHelper.h
//  RoomProject
//
//  Created by 赵凯 on 2019/11/5.
//  Copyright © 2019 赵凯. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (ColorHelper)

/// 16进制颜色码
/// @param color <#color description#>
+ (UIColor *)colorWithHexString:(NSString *)color;
+ (UIColor *)colorWithHexString:(NSString *)color withAlpha:(CGFloat)alpha;

/// 三原色值
/// @param red <#red description#>
/// @param green <#green description#>
/// @param blue <#blue description#>
+ (UIColor *)colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;
+ (UIColor *)colorWithR:(CGFloat)red g:(CGFloat)green b:(CGFloat)blue a:(CGFloat)alpha;

/// 设置 明亮色和暗黑色
/// @param lightColor <#lightColor description#>
/// @param darkColor <#darkColor description#>
+ (UIColor *)setColor:(UIColor *)lightColor darkColor:(UIColor *)darkColor;

/// 根据颜色生成图片
/// @param color <#color description#>
+ (UIImage*)imageWithColor:(UIColor*)color;

@end

NS_ASSUME_NONNULL_END

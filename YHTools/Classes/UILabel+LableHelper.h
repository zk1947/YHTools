//
//  UILabel+LableHelper.h
//  RoomProject
//
//  Created by 赵凯 on 2019/11/8.
//  Copyright © 2019 赵凯. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (LableHelper)

/** *  改变文本行间距 */
+ (void)changeLineSpaceForLabel:(UILabel *)label WithSpace:(float)space;

/** *  改变文本中所有数字的字号 */
+(void)changeAllNumberFont:(UILabel *)lab withFont:(UIFont *)font;

/** *  改变文本中所有数字的字号和字色 */
+(void)changeAllNumberFont:(UILabel *)lab withFont:(UIFont *)font withColor:(UIColor *)color;

/** * 判断文本是否是数字 */
+(BOOL)isNum:(NSString *)string;

/** *  改变冒号后的所有文本的字色 */
+(void)changeSymbolBehindTxtColor:(UILabel *)lab withFont:(UIFont *)font withColor:(UIColor *)color;

/** *  改变部分文字颜色 */
+ (void)changePartTxtColor:(UILabel *)label withRange:(NSRange)range withColor:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END

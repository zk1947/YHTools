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
- (void)changeLineSpace:(float)space;

/** *  改变文本中所有数字的字号 */
-(void)changeAllNumberFont:(UIFont *)font;

/** *  改变文本中所有数字的字号和字色 */
-(void)changeAllNumberFont:(UIFont *)font color:(UIColor *)color;

/** * 判断文本是否是数字 */
-(BOOL)isNum:(NSString *)string;

/** *  改变冒号后的所有文本的字号字色 */
-(void)changeSymbolBehindTxtColor:(UIFont *)font color:(UIColor *)color;

/** *  改变指定部分文字字号 */
- (void)changePartTxtFont:(UIFont *)font range:(NSRange)range;

/** *  改变指定部分文字颜色 */
- (void)changePartTxtColor:(UIColor *)color range:(NSRange)range;

/** *  改变指定部分文字字号和字色 */
- (void)changePartTxtFont:(UIFont *)font color:(UIColor *)color range:(NSRange)range;

/** *  部分文本添加删除线 */
-(void)addDeleteLine:(NSRange)range;


@end

NS_ASSUME_NONNULL_END

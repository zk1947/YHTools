//
//  NSString+StringHelper.h
//  YHTools_Example
//
//  Created by 刘昕 on 2021/1/28.
//  Copyright © 2021 zk1947@163.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (StringHelper)

/// 空串判断
-(BOOL)isNotBlank;

/// 字符串转字典
-(NSDictionary *)changeToDictionary;

/// 时间戳转换成日期形式
-(NSString *)changeToDateFormat;

/// 获取文本宽度
-(CGFloat)getTextWidth:(UIFont *)font;

/// 获取文本高度(系统行间距)
-(CGFloat)getTextHeight:(UIFont *)font width:(CGFloat)width;

/// 获取文本高度(自定义行间距)
-(CGFloat)getTextHeight:(UIFont *)font width:(CGFloat)width space:(CGFloat)space;


@end

NS_ASSUME_NONNULL_END

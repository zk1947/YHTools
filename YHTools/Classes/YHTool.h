//
//  YHTool.h
//  MyProject
//
//  Created by 赵凯 on 2020/9/11.
//  Copyright © 2020 小小程序员. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YHToolsHeader.h"

NS_ASSUME_NONNULL_BEGIN

@interface YHTool : NSObject

/************* 字符串API ************/
+(BOOL)isNotBlank:(NSString *)string;   /** 空串判断 */
+(NSDictionary *)strToDic:(NSString *)string;   /** 字符串转字典 */
+(NSString *)strChangeToDate:(NSString *)timeStr;/** 时间戳转换日期 */
+(CGFloat)getTextWidth:(NSString *)string font:(UIFont *)font;  /** 获取文本宽度 */
+(CGFloat)getTextHeight:(NSString *)string font:(UIFont *)font width:(CGFloat)width;   /** 获取文本高度 */
+(CGFloat)getTextHeight:(NSString *)string font:(UIFont *)font width:(CGFloat)width space:(CGFloat)space; /** 获取文本高度带行间距 */
/************* 字典API ************/
+(void)logProperty:(NSDictionary *)dic;  /** 属性打印 */
+(id)safeGetValue:(NSDictionary *)dic key:(NSString *)key;  /** 获取字典中value防空处理 */
+(NSString *)dicToStr:(NSDictionary *)dic;  /** 字典转json字符串 */

+(NSString *)arrayToJSONString:(NSArray *)arr;/** 数组转json */

/************* Data API ************/
+(NSDictionary *)dataToDic:(NSData *)data;  /** Data转字典 */

/************* 本地数据存储API ************/
+(NSMutableDictionary *)getLocalResource;   /** 获取本地数据源 */
+(void)saveDataToLocal:(id)value withKey:(NSString *)key;   /** 保存数据到本地 */
+(id)getLocalData:(NSString *)key;  /** 获取本地数据 */
+(void)removeAllLocalData;  /** 清空本地数据 */


/** UILabel */
+(UILabel *)creatLableWithFont:(UIFont *)font color:(UIColor *)color txt:(NSString *)txt;
+(UILabel *)creatLableWithFont:(UIFont *)font color:(UIColor *)color txt:(NSString *)txt alignment:(NSTextAlignment)alignment;
+(UILabel *)creatLableWithFrame:(CGRect)frame font:(UIFont *)font color:(UIColor *)color txt:(NSString *)txt;
+(UILabel *)creatLableWithFrame:(CGRect)frame font:(UIFont *)font color:(UIColor *)color txt:(NSString *)txt alignment:(NSTextAlignment)alignment;

/** UIButton */
+(UIButton *)createTxtBtn:(NSString *)tit titColor:(UIColor *)titColor titFont:(UIFont *)font addTarget:(nullable id)target action:(SEL)action;
+(UIButton *)createTxtBtn:(CGRect)frame Tit:(NSString *)tit titColor:(UIColor *)titColor titFont:(UIFont *)font addTarget:(nullable id)target action:(SEL)action;
+(UIButton *)createImgBtn:(NSString *)img addTarget:(nullable id)target action:(SEL)action;
+(UIButton *)createImgBtn:(CGRect)frame Img:(NSString *)img addTarget:(nullable id)target action:(SEL)action;
+(UIButton *)createMixBtn:(NSString *)tit titColor:(UIColor *)titColor titFont:(UIFont *)font Img:(NSString *)img addTarget:(nullable id)target action:(SEL)action;
+(UIButton *)createMixBtn:(CGRect)frame Tit:(NSString *)tit titColor:(UIColor *)titColor titFont:(UIFont *)font Img:(NSString *)img addTarget:(nullable id)target action:(SEL)action;
+(UIButton *)createSubmitBtn:(CGRect)frame Tit:(NSString *)tit titColor:(UIColor *)titColor titFont:(UIFont *)font backColor:(UIColor *)backColor addTarget:(nullable id)target action:(SEL)action;


/** UIImageView */
+(UIImageView *)creatImageViewWithFrame:(CGRect)frame imgName:(NSString *)imgName;

/** UITextField */
+(UITextField *)creatTextFieldWithFrame:(CGRect)frame placeHolder:(NSString *)placeHolder font:(UIFont *)font color:(UIColor *)color;

/** Alert */
+(UIViewController *)getCurrentVC;
+(NSMutableAttributedString *)changeMsgFontAndColor:(NSString *)msg;// 改变文本字号和字号
+(void)showMsg:(NSString *)msg;//无事件弹窗
+(void)showMsg:(NSString *)msg withEvent:(void(^)(void))touchEvent;//有事件弹窗（单按钮）
+(void)showMsg:(NSString *)msg withChooseEvent:(void(^)(BOOL isTrue))touchEvent;//有事件弹窗（双按钮）
+(void)showMsg:(NSString *)msg withTit:(NSString *)tit withChooseEvent:(void(^)(BOOL isTrue))touchEvent;//带标题弹窗
+(void)showMsg:(NSString *)msg withLeftTit:(NSString *)leftTit withRightTit:(NSString *)rightTit withEvent:(void(^)(BOOL isTrue))touchTowEvent;//自定义弹窗 （双事件）
+(void)showSheet:(void(^)(NSInteger index))touchSheetEvent;//sheet

/** 获取底部安全距离 */
+ (CGFloat)safeAreaHeight;

/** 全面屏机型判断 */
+(BOOL)isFullScreenIphone;

/** 用手机浏览器打开页面 */
+(void)openPageInWeb:(NSString *)url;

@end

NS_ASSUME_NONNULL_END

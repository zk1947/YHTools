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

/************* 本地数据存储API ************/
+(NSMutableDictionary *)getLocalResource;                   /** 获取本地数据源 */
+(void)saveDataToLocal:(id)value withKey:(NSString *)key;   /** 保存数据到本地 */
+(id)getLocalData:(NSString *)key;                          /** 获取本地数据 */
+(void)removeLocalData:(NSString *)key;                     /** 删除本地数据 */
+(void)removeAllLocalData;                                  /** 清空本地数据 */
+(id)getMyProjectConfigMessage:(NSString *)key;             /** 获取项目配置信息 */

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

/** Data转字典 */
+(NSDictionary *)dataToDic:(NSData *)data;

/** 获取底部安全距离 */
+ (CGFloat)safeAreaHeight;

/** 全面屏机型判断 */
+(BOOL)isFullScreenIphone;

/** 跳转手机浏览器打开页面 */
+(void)openPageInWeb:(NSString *)url;

@end

NS_ASSUME_NONNULL_END

//
//  YHToolsHeader.h
//  YHTools
//
//  Created by 赵凯 on 2021/1/27.
//  Copyright © 2021 小小程序员. All rights reserved.
//

#ifndef YHToolsHeader_h
#define YHToolsHeader_h

//基础工具类
#import "YHTool.h"
#import "NSString+StringHelper.h"
#import "NSDictionary+DicHelper.h"
#import "NSArray+ArrayHelper.h"
#import "UIColor+ColorHelper.h"
#import "UIView+FrameHelper.h"
#import "UILabel+LableHelper.h"
#import "UIButton+ButtonHelper.h"
#import "YXHUDProgressView.h"
//常用API
#define KTITLE(name) self.navigationItem.title = name
#define KPUSH(pushVC) [self.navigationController pushViewController:pushVC animated:YES]
#define KFONT(font)  [UIFont systemFontOfSize:font]
#define KBFONT(font) [UIFont fontWithName:@"Helvetica-Bold" size:font]
#define KNFONT(font) [UIFont fontWithName:@"DIN Alternate" size:font]
#define KIMAGE(name) [UIImage imageNamed:name]
#define KCOLOR_RGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define KCOLOR_RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define KCOLOR_CODE(codeName) [UIColor colorWithHexString:codeName]

//常用尺寸
#define KSCR_W [UIScreen mainScreen].bounds.size.width      //屏幕宽度
#define KSCR_H [UIScreen mainScreen].bounds.size.height     //屏幕高度
#define KSTA_H  [[UIApplication sharedApplication] statusBarFrame].size.height    //状态栏高度
#define KNAV_H  (KSTA_H + 44)    //导航高度
#define KTAB_H  ([YHTool safeAreaHeight] + 49)    //标签高度
#define KX(v) (MIN([[UIScreen mainScreen] bounds].size.width,[[UIScreen mainScreen] bounds].size.height)/375.f * v)//缩放比例
#define KY(v) (MAX([[UIScreen mainScreen] bounds].size.width,[[UIScreen mainScreen] bounds].size.height)/667.f * v)//缩放比例
#define KSPA_1  KX(1)     //间距
#define KSPA_5  KX(5)     //间距
#define KSPA_8  KX(8)     //间距
#define KSPA_10 KX(10)    //间距
#define KSPA_12 KX(12)    //间距
#define KSPA_15 KX(15)    //间距
#define KSPA_20 KX(20)    //间距
#define KSPA_24 KX(24)    //间距
#define KSPA_30 KX(30)    //间距
#define KSPA_40 KX(40)    //间距
#define KSPA_44 KX(44)    //间距
#define KSPA_50 KX(50)    //间距

//常用字号
#define KFONT_8     KFONT(KX(8))
#define KFONT_10    KFONT(KX(10))
#define KFONT_12    KFONT(KX(12))
#define KFONT_14    KFONT(KX(14))
#define KFONT_16    KFONT(KX(16))
#define KFONT_17    KFONT(KX(17))
#define KFONT_20    KFONT(KX(20))
#define KFONT_24    KFONT(KX(24))

//常用颜色
#define KCOLOR_ZT  [UIColor colorWithHexString:[YHTool getMyProjectThemeColor:@"themeColor"]] //主题色
#define KCOLOR_FF  [UIColor colorWithHexString:@"#FFFFFF"]              //白色
#define KCOLOR_00  [UIColor colorWithHexString:@"#000000"]              //黑色
#define KCOLOR_F0  [UIColor colorWithHexString:@"#FF0000"]              //红色
#define KCOLOR_F1  [UIColor colorWithHexString:@"#F1F1F1"]              //分割线灰色
#define KCOLOR_1   [UIColor colorWithHexString:@"#111111"]              //文本深色
#define KCOLOR_3   [UIColor colorWithHexString:@"#333333"]              //文本次深色
#define KCOLOR_6   [UIColor colorWithHexString:@"#666666"]              //文本中色
#define KCOLOR_9   [UIColor colorWithHexString:@"#999999"]              //文本浅色

//打印位置
#ifdef DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"%s中%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],[[[NSString stringWithUTF8String:__FUNCTION__] lastPathComponent] UTF8String] ,__LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif

#endif /* YHToolsHeader_h */

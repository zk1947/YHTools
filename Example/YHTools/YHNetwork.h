//
//  YHNetwork.h
//  NNProject
//
//  Created by 刘昕 on 2021/2/2.
//

#import <Foundation/Foundation.h>
#import "YHNetManage.h"

NS_ASSUME_NONNULL_BEGIN

@interface YHNetwork : NSObject

/// get请求
/// @param url <#url description#>
/// @param param <#param description#>
/// @param succeed <#succeed description#>
+(void)getInterFace:(NSString *)url param:(id __nullable)param succeed:(void (^)(id data))succeed;

/// post请求数据（loading可控、自动处理code、msg）
/// @param url <#url description#>
/// @param param <#param description#>
/// @param loading <#loading description#>
/// @param succeed <#succeed description#>
+(void)postDataInterFace:(NSString *)url param:(id __nullable)param loading:(BOOL)loading succeed:(void (^)(id data))succeed;

/// post表单提交（必带loading、自动处理code、msg）
/// @param url <#url description#>
/// @param param <#param description#>
/// @param succeed <#succeed description#>
+(void)postFormInterFace:(NSString *)url param:(id __nullable)param succeed:(void (^)(id data))succeed;

/// post请求（完全手动）
/// @param url <#url description#>
/// @param param <#param description#>
/// @param loading <#loading description#>
/// @param succeed <#succeed description#>
+(void)postNomalInterFace:(NSString *)url param:(id __nullable)param loading:(BOOL)loading succeed:(void (^)(id data))succeed failure:(void (^)(NSError *error))failure;

/// post请求 上传图片
/// @param url <#url description#>
/// @param param <#param description#>
/// @param imgsArr <#imgsArr description#>
/// @param succeed <#succeed description#>
+(void)postImageInterFace:(NSString *)url param:(id __nullable)param withImgs:(NSMutableArray *)imgsArr succeed:(void (^)(id data))succeed;

@end

NS_ASSUME_NONNULL_END

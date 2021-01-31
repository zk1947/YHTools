//
//  YHNetManage.h
//  YHTools
//
//  Created by 赵凯 on 2021/1/31.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

NS_ASSUME_NONNULL_BEGIN

@interface YHNetManage : NSObject

/** 单例请求对象 */
+ (AFHTTPSessionManager *)sharedManager;

/** get请求 */
+(void)getNetData:(NSString *)url param:(id __nullable)param succeed:(void (^)(id data))succeed failure:(void (^)(NSError *error))failure;

/** post请求 */
+(void)postNetData:(NSString *)url param:(id __nullable)param succeed:(void (^)(id data))succeed failure:(void (^)(NSError *error))failure;

/** post请求 上传图片 */
+(void)postImgNetData:(NSString *)url param:(id __nullable)param withImgs:(NSMutableArray *)imgsArr succeed:(void (^)(id data))succeed failure:(void (^)(NSError *error))failure;

@end

NS_ASSUME_NONNULL_END

//
//  YHNetManage.m
//  YHTools
//
//  Created by 赵凯 on 2021/1/31.
//

#import "YHNetManage.h"

static AFHTTPSessionManager *manager;

@implementation YHNetManage

#pragma mark -- 单例对象
+ (AFHTTPSessionManager *)sharedManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager]; // 初始化请求管理类
        manager.requestSerializer.timeoutInterval = 30.0;// 配置请求时长
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];// 配置响应数据格式
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain",nil];//设置响应内容类型        
    });
    return manager;
}
#pragma mark -get请求
+(void)getNetData:(NSString *)url param:(id __nullable)param succeed:(void (^)(id data))succeed failure:(void (^)(NSError *error))failure{
    AFHTTPSessionManager *manager = [YHNetManage sharedManager];
    [manager GET:url parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        succeed(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}
#pragma mark -post请求
+(void)postNetData:(NSString *)url param:(id __nullable)param succeed:(void (^)(id data))succeed failure:(void (^)(NSError *error))failure{
    AFHTTPSessionManager *manager = [YHNetManage sharedManager];
    [manager POST:url parameters:param headers:nil progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
         succeed(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}
#pragma mark -post请求 上传图片
+(void)postImgNetData:(NSString *)url param:(id __nullable)param withImgs:(NSMutableArray *)imgsArr succeed:(void (^)(id data))succeed failure:(void (^)(NSError *error))failure{
    AFHTTPSessionManager *manager = [YHNetManage sharedManager];
    [manager POST:url parameters:param headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (NSInteger index = 0; index < imgsArr.count; index ++) {
            NSString *valueStr = [NSString stringWithFormat:@"img%ld.png",index+1] ;
            [formData appendPartWithFileData:imgsArr[index] name:@"file" fileName:valueStr mimeType:@"image/jpeg"];
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        succeed(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

@end

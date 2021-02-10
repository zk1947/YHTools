//
//  YHNetwork.m
//  NNProject
//
//  Created by 刘昕 on 2021/2/2.
//

#import "YHNetwork.h"

@implementation YHNetwork

+(void)getInterFace:(NSString *)url param:(id __nullable)param succeed:(void (^)(id data))succeed{
    //1.loading显示
    ShowDefaultLoadingView(@"加载中..");
    //2.非全路径进行路径拼接
    if (![url containsString:@"http"]) {
        url = [NSString stringWithFormat:@"%@%@",KBASEURL,url];
    }
    //3.入参处理（加密、添加基本参数如token等）
    
    [YHNetManage getNetData:url param:param succeed:^(id  _Nonnull data) {
        //4.loading收回
        DismissDefaultHud();
        //5.出参数据处理（解密、数据格式转换、code判断等）
        
        //6.传递出参
        succeed(data);
    } failure:^(NSError * _Nonnull error) {
        //4.loading收回
        DismissDefaultHud();
        //7.错误日志打印
        NSLog(@"接口%@==报错:%@",url,error);
    }];
}

+(void)postDataInterFace:(NSString *)url param:(id __nullable)param loading:(BOOL)loading succeed:(void (^)(id data))succeed{
    //1.loading显示
    if (loading) {
        ShowDefaultLoadingView(@"加载中..");
    }
    //2.非全路径进行路径拼接
    if (![url containsString:@"http"]) {
        url = [NSString stringWithFormat:@"%@%@",KBASEURL,url];
    }
    //3.入参处理（加密、添加基本参数如token等）
    
    [YHNetManage postNetData:url param:param succeed:^(id  _Nonnull data) {
        //4.loading收回
        DismissDefaultHud();
        //5.出参数据处理（解密、数据格式转换、code判断等）
        
        //6.传递出参
        succeed(data);
    } failure:^(NSError * _Nonnull error) {
        //4.loading收回
        DismissDefaultHud();
        //7.错误日志打印
        NSLog(@"接口%@==报错:%@",url,error);
    }];
}

+(void)postFormInterFace:(NSString *)url param:(id __nullable)param succeed:(void (^)(id data))succeed{
    //1.loading显示
    ShowDefaultLoadingView(@"加载中..");
    //2.非全路径进行路径拼接
    if (![url containsString:@"http"]) {
        url = [NSString stringWithFormat:@"%@%@",KBASEURL,url];
    }
    //3.入参处理（加密、添加基本参数如token等）
    
    [YHNetManage postNetData:url param:param succeed:^(id  _Nonnull data) {
        //4.loading收回
        DismissDefaultHud();
        //5.出参数据处理（解密、数据格式转换、code判断等）
        
        //6.传递出参
        succeed(data);
    } failure:^(NSError * _Nonnull error) {
        //4.loading收回
        DismissDefaultHud();
        //7.错误日志打印
        NSLog(@"接口%@==报错:%@",url,error);
    }];
}

+(void)postNomalInterFace:(NSString *)url param:(id __nullable)param loading:(BOOL)loading succeed:(void (^)(id data))succeed failure:(void (^)(NSError *error))failure{
    //1.loading显示
    if (loading) {
        ShowDefaultLoadingView(@"加载中..");
    }
    //2.非全路径进行路径拼接
    if (![url containsString:@"http"]) {
        url = [NSString stringWithFormat:@"%@%@",KBASEURL,url];
    }
    //3.入参处理（加密、添加基本参数如token等）
    
    [YHNetManage postNetData:url param:param succeed:^(id  _Nonnull data) {
        //4.loading收回
        DismissDefaultHud();
        //5.出参数据处理（解密、数据格式转换）
        
        //6.传递出参
        NSDictionary *resultDic = [YHTool dataToDic:data];
        succeed(resultDic);
    } failure:^(NSError * _Nonnull error) {
        //4.loading收回
        DismissDefaultHud();
        //7.错误回调
        failure(error);
    }];
}

+(void)postImageInterFace:(NSString *)url param:(id __nullable)param withImgs:(NSMutableArray *)imgsArr succeed:(void (^)(id data))succeed{
    //1.loading显示
    ShowDefaultLoadingView(@"加载中..");
    //2.非全路径进行路径拼接
    if (![url containsString:@"http"]) {
        url = [NSString stringWithFormat:@"%@%@",KBASEURL,url];
    }
    //3.入参处理（加密、添加基本参数如token等）
    
    [YHNetManage postImgNetData:url param:param withImgs:imgsArr succeed:^(id  _Nonnull data) {
        //4.loading收回
        DismissDefaultHud();
        //5.出参数据处理（解密、数据格式转换、code判断等）
        
        //6.传递出参
        NSDictionary *resultDic = [YHTool dataToDic:data];
        succeed(resultDic);
    } failure:^(NSError * _Nonnull error) {
        //4.loading收回
        DismissDefaultHud();
        //7.错误日志打印
        NSLog(@"接口%@==报错:%@",url,error);
    }];
}

@end

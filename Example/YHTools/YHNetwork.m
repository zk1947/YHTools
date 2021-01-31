//
//  YHNetwork.m
//  YHTools_Example
//
//  Created by 赵凯 on 2021/1/31.
//  Copyright © 2021 zk1947@163.com. All rights reserved.
//

#import "YHNetwork.h"

@implementation YHNetwork

#pragma mark -post请求二次封装（处理路径拼接、加解密、loading、refresh等）
+(void)postNetInterFace:(NSString *)url param:(id __nullable)param succeed:(void (^)(id data))succeed{
    
    //加密解密
    
    [YHNetManage postNetData:@"" param:param succeed:^(id  _Nonnull data) {
        
        
        
    } failure:^(NSError * _Nonnull error) {
        
        
        
    }];
    
}

@end

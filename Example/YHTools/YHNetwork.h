//
//  YHNetwork.h
//  YHTools_Example
//
//  Created by 赵凯 on 2021/1/31.
//  Copyright © 2021 zk1947@163.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YHNetManage.h"

NS_ASSUME_NONNULL_BEGIN

@interface YHNetwork : NSObject

+(void)postNetInterFace:(NSString *)url param:(id __nullable)param succeed:(void (^)(id data))succeed;

@end

NS_ASSUME_NONNULL_END

//
//  NSDictionary+DicHelper.h
//  RoomProject
//
//  Created by 赵凯 on 2019/11/5.
//  Copyright © 2019 赵凯. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (DicHelper)

/// 属性打印
-(void)logProperty;

/// 获取字典中value防空处理
-(id)getSafeValue:(NSString *)key;

/// 字典转json字符串
-(NSString *)changeToJsonStr;


@end

NS_ASSUME_NONNULL_END

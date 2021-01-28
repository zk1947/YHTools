//
//  NSDictionary+DicHelper.m
//  RoomProject
//
//  Created by 赵凯 on 2019/11/5.
//  Copyright © 2019 赵凯. All rights reserved.
//

#import "NSDictionary+DicHelper.h"

@implementation NSDictionary (DicHelper)

#pragma mark - 控制台打印汉字方法复写
- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *strM = [NSMutableString stringWithString:@"{\n"];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [strM appendFormat:@"\t%@ = %@;\n", key, obj];
    }];
    
    [strM appendString:@"}\n"];
    
    return strM;
}


@end

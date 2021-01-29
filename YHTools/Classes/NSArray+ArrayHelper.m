//
//  NSArray+ArrayHelper.m
//  RoomProject
//
//  Created by 赵凯 on 2019/11/5.
//  Copyright © 2019 赵凯. All rights reserved.
//

#import "NSArray+ArrayHelper.h"

@implementation NSArray (ArrayHelper)

#pragma mark - 控制台打印汉字方法复写
- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *strM = [NSMutableString stringWithString:@"(\n"];
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [strM appendFormat:@"\t%@,\n", obj];
    }];
    
    [strM appendString:@")"];
    
    return strM;
}
#pragma mark -数组转json字符串
-(NSString *)changeToJsonStr{
    NSData *data = [NSJSONSerialization dataWithJSONObject:self
                                                   options:NSJSONReadingMutableLeaves | NSJSONReadingAllowFragments
                                                     error:nil];
     
    if (data == nil) {
        return nil;
    }
     
    NSString *string = [[NSString alloc] initWithData:data
                                             encoding:NSUTF8StringEncoding];
    return string;
}

@end

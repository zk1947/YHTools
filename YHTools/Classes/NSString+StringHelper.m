//
//  NSString+StringHelper.m
//  YHTools_Example
//
//  Created by 刘昕 on 2021/1/28.
//  Copyright © 2021 zk1947@163.com. All rights reserved.
//

#import "NSString+StringHelper.h"

@implementation NSString (StringHelper)

#pragma mark -空串判断
-(BOOL)isNotBlank{
    if (!self) {
        return NO;
    }
    if ([self isKindOfClass:[NSNull class]]) {
        return NO;
    }
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmedStr = [[self mutableCopy] stringByTrimmingCharactersInSet:set];
    if (!trimmedStr.length) {
        return NO;
    }
    return YES;
}
#pragma mark -字符串转字典
-(NSDictionary *)changeToDictionary{
    if (self == nil){
        return nil;
    }
    
    NSData *jsonData = [[self mutableCopy] dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&err];
    if(err)
    {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}
#pragma mark -时间戳转换成日期形式
-(NSString *)changeToDateFormat{
    long long time=[[self mutableCopy] longLongValue];
    //    如果服务器返回的是13位字符串，需要除以1000，否则显示不正确(13位其实代表的是毫秒，需要除以1000)
    //    long long time=[timeStr longLongValue] / 1000;
    NSDate *date = [[NSDate alloc]initWithTimeIntervalSince1970:time];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString*timeString=[formatter stringFromDate:date];
    return timeString;
}
#pragma mark -获取文本宽度
-(CGFloat)getTextWidth:(UIFont *)font{
    CGSize size = [[self mutableCopy] boundingRectWithSize:CGSizeMake(1000, 15) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
    return size.width;
}
#pragma mark -获取文本高度(系统行间距)
-(CGFloat)getTextHeight:(UIFont *)font width:(CGFloat)width{
//    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
//    ,NSParagraphStyleAttributeName:paragraphStyle
    CGSize size = [[self mutableCopy] boundingRectWithSize:CGSizeMake(width, 10000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
    return size.height;
}
#pragma mark -获取文本高度(自定义行间距)
-(CGFloat)getTextHeight:(UIFont *)font width:(CGFloat)width space:(CGFloat)space{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];
    CGSize size = [[self mutableCopy] boundingRectWithSize:CGSizeMake(width, 10000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font,NSParagraphStyleAttributeName:paragraphStyle} context:nil].size;
    return size.height;
}


@end

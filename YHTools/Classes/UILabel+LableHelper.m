//
//  UILabel+LableHelper.m
//  RoomProject
//
//  Created by 赵凯 on 2019/11/8.
//  Copyright © 2019 赵凯. All rights reserved.
//

#import "UILabel+LableHelper.h"

@implementation UILabel (LableHelper)

#pragma mark -- 改变文本行间距
+ (void)changeLineSpaceForLabel:(UILabel *)label WithSpace:(float)space {
    NSString *labelText = label.text;
    if (labelText.length < 1 || labelText == nil) {
        return;
    }
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];    [paragraphStyle setLineSpacing:space];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
}
#pragma mark -- 改变文本中所有数字的字号
+(void)changeAllNumberFont:(UILabel *)lab withFont:(UIFont *)font{
    if (lab.text == nil) {
        return;
    }
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:lab.text];
    NSString *temp = nil;
    for(int i =0; i < [attributedString length]; i++) {
        temp = [lab.text substringWithRange:NSMakeRange(i, 1)];
        if ([self isNum:temp]||[temp isEqualToString:@"."]||[temp isEqualToString:@","]||[temp isEqualToString:@"，"]) {
            [attributedString addAttribute:NSFontAttributeName value:font range:NSMakeRange(i, 1)];
        }
    }
    lab.attributedText = attributedString;
}
+(void)changeAllNumberFont:(UILabel *)lab withFont:(UIFont *)font withColor:(UIColor *)color{
    if (lab.text == nil) {
        return;
    }
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:lab.text];
    NSString *temp = nil;
    for(int i =0; i < [attributedString length]; i++) {
        temp = [lab.text substringWithRange:NSMakeRange(i, 1)];
        if ([self isNum:temp]||[temp isEqualToString:@"."]||[temp isEqualToString:@","]||[temp isEqualToString:@"，"]) {
            [attributedString addAttribute:NSFontAttributeName value:font range:NSMakeRange(i, 1)];
           [attributedString addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(i, 1)];
        }
    }
    lab.attributedText = attributedString;
}
+(BOOL)isNum:(NSString *)string{
    NSScanner *scan = [NSScanner scannerWithString:string];
    int value;
    return [scan scanInt:&value] && [scan isAtEnd];
}
+(void)changeSymbolBehindTxtColor:(UILabel *)lab withFont:(UIFont *)font withColor:(UIColor *)color{
    if (lab.text == nil) {
        return;
    }
    NSString *labTxtStr = lab.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labTxtStr];
    //字符串截取
//    NSString *symbolStr1 = @":";
    NSString *symbolStr2 = @"：";
//    NSRange startRange = [labTxtStr rangeOfString:symbolStr1];
    NSRange startRange2 = [labTxtStr rangeOfString:symbolStr2];
    NSRange changeRange;
//    if (startRange.location != NSNotFound) {
//         changeRange = NSMakeRange(startRange.location, labTxtStr.length-startRange.location);
//    }
    if (startRange2.location != NSNotFound) {
         changeRange = NSMakeRange(startRange2.location, labTxtStr.length-startRange2.location);
    }
    if (changeRange.location != NSNotFound) {
        [attributedString addAttribute:NSFontAttributeName value:font range:changeRange];
        [attributedString addAttribute:NSForegroundColorAttributeName value:color range:changeRange];
        lab.attributedText = attributedString;
    }
}
+ (void)changePartTxtColor:(UILabel *)label withRange:(NSRange)range withColor:(UIColor *)color{
    NSString *labelText = label.text;
    if (labelText.length < 1 || labelText == nil) {
        return;
    }
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc]initWithString:labelText];
//    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
//    [paragraphStyle setLineSpacing:KSPACE_8];
//    [attributeString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    NSRange contentRange = range;
    [attributeString addAttribute:NSForegroundColorAttributeName value:color range:contentRange];
    label.attributedText = attributeString;
}

@end

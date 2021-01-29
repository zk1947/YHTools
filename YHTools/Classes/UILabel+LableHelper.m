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
- (void)changeLineSpace:(float)space{
    NSString *labelText = self.text;
    if (labelText.length < 1 || labelText == nil) {
        return;
    }
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    self.attributedText = attributedString;
//    [label sizeToFit];
}

#pragma mark -- 改变文本中所有数字的字号
-(void)changeAllNumberFont:(UIFont *)font;{
    NSString *labelText = self.text;
    if (labelText.length < 1 || labelText == nil) {
        return;
    }
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    NSString *temp = nil;
    for(int i =0; i < [attributedString length]; i++) {
        temp = [labelText substringWithRange:NSMakeRange(i, 1)];
        if ([self isNum:temp]||[temp isEqualToString:@"."]||[temp isEqualToString:@","]||[temp isEqualToString:@"，"]) {
            [attributedString addAttribute:NSFontAttributeName value:font range:NSMakeRange(i, 1)];
        }
    }
    self.attributedText = attributedString;
}
#pragma mark -改变文本中所有数字的字号和字色
-(void)changeAllNumberFont:(UIFont *)font color:(UIColor *)color;{
    NSString *labelText = self.text;
    if (labelText.length < 1 || labelText == nil) {
        return;
    }
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    NSString *temp = nil;
    for(int i =0; i < [attributedString length]; i++) {
        temp = [labelText substringWithRange:NSMakeRange(i, 1)];
        if ([self isNum:temp]||[temp isEqualToString:@"."]||[temp isEqualToString:@","]||[temp isEqualToString:@"，"]) {
            [attributedString addAttribute:NSFontAttributeName value:font range:NSMakeRange(i, 1)];
           [attributedString addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(i, 1)];
        }
    }
    self.attributedText = attributedString;
}
-(BOOL)isNum:(NSString *)string{
    NSScanner *scan = [NSScanner scannerWithString:string];
    int value;
    return [scan scanInt:&value] && [scan isAtEnd];
}
#pragma mark -改变冒号后的所有文本的字号字色
-(void)changeSymbolBehindTxtColor:(UIFont *)font color:(UIColor *)color{
    NSString *labelText = self.text;
    if (labelText.length < 1 || labelText == nil) {
        return;
    }
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    //字符串截取
    NSString *symbolStr1 = @":";
    NSString *symbolStr2 = @"：";
    NSRange startRange = [labelText rangeOfString:symbolStr1];
    NSRange startRange2 = [labelText rangeOfString:symbolStr2];
    NSRange changeRange;
    if (startRange.location != NSNotFound) {
         changeRange = NSMakeRange(startRange.location, labelText.length-startRange.location);
    }
    if (startRange2.location != NSNotFound) {
         changeRange = NSMakeRange(startRange2.location, labelText.length-startRange2.location);
    }
    if (changeRange.location != NSNotFound) {
        [attributedString addAttribute:NSFontAttributeName value:font range:changeRange];
        [attributedString addAttribute:NSForegroundColorAttributeName value:color range:changeRange];
        self.attributedText = attributedString;
    }
}
#pragma mark -改变指定部分文字字号
- (void)changePartTxtFont:(UIFont *)font range:(NSRange)range{
    NSString *labelText = self.text;
    if (labelText.length < 1 || labelText == nil) {
        return;
    }
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc]initWithString:labelText];
    [attributeString addAttribute:NSFontAttributeName value:font range:range];
    self.attributedText = attributeString;
}
#pragma mark -改变指定部分文字颜色
- (void)changePartTxtColor:(UIColor *)color range:(NSRange)range{
    NSString *labelText = self.text;
    if (labelText.length < 1 || labelText == nil) {
        return;
    }
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc]initWithString:labelText];
    [attributeString addAttribute:NSForegroundColorAttributeName value:color range:range];
    self.attributedText = attributeString;
}
#pragma mark -改变指定部分文字字号和字色
- (void)changePartTxtFont:(UIFont *)font color:(UIColor *)color range:(NSRange)range{
    NSString *labelText = self.text;
    if (labelText.length < 1 || labelText == nil) {
        return;
    }
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc]initWithString:labelText];
    [attributeString addAttribute:NSFontAttributeName value:font range:range];
    [attributeString addAttribute:NSForegroundColorAttributeName value:color range:range];
    self.attributedText = attributeString;
}
#pragma mark -部分文本添加删除线
-(void)addDeleteLine:(NSRange)range{
    NSString *labelText = self.text;
    if (labelText.length < 1 || labelText == nil) {
        return;
    }
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    [attributedString addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:range];
    self.attributedText = attributedString;
}

@end

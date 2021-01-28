//
//  YHTool.m
//  MyProject
//
//  Created by 赵凯 on 2020/9/11.
//  Copyright © 2020 小小程序员. All rights reserved.
//

#import "YHTool.h"

#define KPath [NSHomeDirectory() stringByAppendingString:@"/Documents/UserMsg.plist"]

@implementation YHTool

+(void)test{
    NSLog(@"qq");
}

#pragma mark -空串判断
+(BOOL)isNotBlank:(NSString *)string{
    if (!string) {
        return NO;
    }
    if ([self isKindOfClass:[NSNull class]]) {
        return NO;
    }
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmedStr = [string stringByTrimmingCharactersInSet:set];
    if (!trimmedStr.length) {
        return NO;
    }
    return YES;
}
#pragma mark -字符串转字典
+(NSDictionary *)strToDic:(NSString *)string{
    if (string == nil){
        return nil;
    }
    NSData *jsonData = [string dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&err];
    if(err)
    {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}
#pragma mark -时间戳转换日期
+(NSString *)strChangeToDate:(NSString *)timeStr{
    long long time=[timeStr longLongValue];
    //    如果服务器返回的是13位字符串，需要除以1000，否则显示不正确(13位其实代表的是毫秒，需要除以1000)
    //    long long time=[timeStr longLongValue] / 1000;
    NSDate *date = [[NSDate alloc]initWithTimeIntervalSince1970:time];

    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];

    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];

    NSString*timeString=[formatter stringFromDate:date];

    return timeString;
}
#pragma mark -获取文本宽度
+(CGFloat)getTextWidth:(NSString *)string font:(UIFont *)font{
    CGSize size = [string boundingRectWithSize:CGSizeMake(1000, 15) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
    return size.width;
}
#pragma mark -获取文本高度
+(CGFloat)getTextHeight:(NSString *)string font:(UIFont *)font width:(CGFloat)width{
    //设置行间距
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    CGSize size = [string boundingRectWithSize:CGSizeMake(width, 10000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font,NSParagraphStyleAttributeName:paragraphStyle} context:nil].size;
    return size.height;
}
+(CGFloat)getTextHeight:(NSString *)string font:(UIFont *)font width:(CGFloat)width space:(CGFloat)space{
    //设置行间距
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];
    CGSize size = [string boundingRectWithSize:CGSizeMake(width, 10000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font,NSParagraphStyleAttributeName:paragraphStyle} context:nil].size;
    return size.height;
}
#pragma mark -属性打印
+(void)logProperty:(NSDictionary *)dic{
    NSMutableString *proprety = [[NSMutableString alloc] init];
    //遍历数组 生成声明属性的代码，例如 @property (nonatomic, copy) NSString str
    //打印出来后 command+c command+v
    [dic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSString *str;
        //        NSLog(@"%@",[obj class]);
        //判断的数据类型，生成相应的属性
        if ([obj isKindOfClass:NSClassFromString(@"__NSCFString")] || [obj isKindOfClass:NSClassFromString(@"NSTaggedPointerString")] || [obj isKindOfClass:NSClassFromString(@"__NSCFConstantString")]) {
            str = [NSString stringWithFormat:@"@property (nonatomic, copy) NSString *%@;",key];
        }
        if ([obj isKindOfClass:NSClassFromString(@"__NSCFNumber")]) {
            str = [NSString stringWithFormat:@"@property (nonatomic, assign) int %@;",key];
        }
        if ([obj isKindOfClass:NSClassFromString(@"__NSCFArray")] || [obj isKindOfClass:[NSArray class]]) {
            str = [NSString stringWithFormat:@"@property (nonatomic, strong) NSArray *%@;",key];
        }
        
        if ([obj isKindOfClass:NSClassFromString(@"__NSCFDictionary")] || [obj isKindOfClass:[NSDictionary class]]) {
            str = [NSString stringWithFormat:@"@property (nonatomic, strong) NSDictionary *%@;",key];
        }
        if ([obj isKindOfClass:NSClassFromString(@"__NSCFBoolean")]) {
            str = [NSString stringWithFormat:@"@property (nonatomic, assign) BOOL %@;",key];
        }
        [proprety appendFormat:@"\n%@\n",str];
    }];
    NSLog(@"%@",proprety);
}
#pragma mark -获取字典中value防空处理
+(id)safeGetValue:(NSDictionary *)dic key:(NSString *)key{
    id object = [dic objectForKey:key];
    if ([object isKindOfClass:[NSNull class]]) {
        object = nil;
    }
    return object;
}
#pragma mark -字典转json字符串
+(NSString *)dicToStr:(NSDictionary *)dic{
    NSError *error;

    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&error];

    NSString *jsonString;

    if (!jsonData) {

        NSLog(@"%@",error);

    }else{

        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];

    }

    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];

    NSRange range = {0,jsonString.length};

    //去掉字符串中的空格

    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];

    NSRange range2 = {0,mutStr.length};

    //去掉字符串中的换行符

    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];

    return mutStr;
}

+(NSString *)arrayToJSONString:(NSArray *)arr{
    NSData *data = [NSJSONSerialization dataWithJSONObject:arr
                                                   options:NSJSONReadingMutableLeaves | NSJSONReadingAllowFragments
                                                     error:nil];
     
    if (data == nil) {
        return nil;
    }
     
    NSString *string = [[NSString alloc] initWithData:data
                                             encoding:NSUTF8StringEncoding];
    return string;
}


#pragma mark -data转dic
+(NSDictionary *)dataToDic:(NSData *)data{
    NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSData *JSONdata = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *responseJSON = [NSJSONSerialization JSONObjectWithData:JSONdata options:NSJSONReadingMutableContainers error:&err];
    if (err) {
        NSLog(@"json解析失败：%@",err);
    }
    return responseJSON;
}

#pragma mark -获取本地数据源
+(NSMutableDictionary *)getLocalResource{
    NSMutableDictionary *userMsgDic=[NSMutableDictionary dictionaryWithContentsOfFile:KPath];
    if (!userMsgDic) {
        userMsgDic = [NSMutableDictionary dictionary];
    }
    return userMsgDic;
}
#pragma mark -存数据
+(void)saveDataToLocal:(id)value withKey:(NSString *)key{
    if (!value) {
        value = @"";
    }
    NSMutableDictionary *userMsgDic = [self getLocalResource];
    [userMsgDic setObject:value forKey:key];
    [userMsgDic writeToFile:KPath atomically:YES];
}
#pragma mark -查数据
+(id)getLocalData:(NSString *)key{
    NSMutableDictionary *userMsgDic = [self getLocalResource];
    id obj = [userMsgDic objectForKey:key];
    return obj ? obj:@"";
}
#pragma mark -清空本地数据
+(void)removeAllLocalData{
    NSMutableDictionary *userMsgDic = [self getLocalResource];
    [userMsgDic removeAllObjects];
    [userMsgDic writeToFile:KPath atomically:YES];
}

#pragma mark - Lable
+(UILabel *)creatLableWithFont:(UIFont *)font color:(UIColor *)color txt:(NSString *)txt{
    UILabel *label = [[UILabel alloc] init];
    label.font = font;
    label.textColor = color;
    label.text = txt;
    return label;
}

+(UILabel *)creatLableWithFont:(UIFont *)font color:(UIColor *)color txt:(NSString *)txt alignment:(NSTextAlignment)alignment{
    UILabel *label = [[UILabel alloc] init];
    label.font = font;
    label.textColor = color;
    label.text = txt;
    label.textAlignment = alignment;
    return label;
}

+(UILabel *)creatLableWithFrame:(CGRect)frame font:(UIFont *)font color:(UIColor *)color txt:(NSString *)txt{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.font = font;
    label.textColor = color;
    label.text = txt;
    return label;
}

+(UILabel *)creatLableWithFrame:(CGRect)frame font:(UIFont *)font color:(UIColor *)color txt:(NSString *)txt alignment:(NSTextAlignment)alignment{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.font = font;
    label.textColor = color;
    label.text = txt;
    label.textAlignment = alignment;
    return label;
}

#pragma mark - UIButton
+(UIButton *)createTxtBtn:(NSString *)tit titColor:(UIColor *)titColor titFont:(UIFont *)font addTarget:(nullable id)target action:(SEL)action{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:tit forState:UIControlStateNormal];
    [btn setTitleColor:titColor forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

+(UIButton *)createTxtBtn:(CGRect)frame Tit:(NSString *)tit titColor:(UIColor *)titColor titFont:(UIFont *)font addTarget:(nullable id)target action:(SEL)action{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    [btn setTitle:tit forState:UIControlStateNormal];
    [btn setTitleColor:titColor forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

+(UIButton *)createImgBtn:(NSString *)img addTarget:(nullable id)target action:(SEL)action{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:img] forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

+(UIButton *)createImgBtn:(CGRect)frame Img:(NSString *)img addTarget:(nullable id)target action:(SEL)action{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    [btn setImage:[UIImage imageNamed:img] forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

+(UIButton *)createMixBtn:(NSString *)tit titColor:(UIColor *)titColor titFont:(UIFont *)font Img:(NSString *)img addTarget:(nullable id)target action:(SEL)action{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:tit forState:UIControlStateNormal];
    [btn setTitleColor:titColor forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    [btn setImage:[UIImage imageNamed:img] forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

+(UIButton *)createMixBtn:(CGRect)frame Tit:(NSString *)tit titColor:(UIColor *)titColor titFont:(UIFont *)font Img:(NSString *)img addTarget:(nullable id)target action:(SEL)action{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    [btn setTitle:tit forState:UIControlStateNormal];
    [btn setTitleColor:titColor forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    [btn setImage:[UIImage imageNamed:img] forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

+(UIButton *)createSubmitBtn:(CGRect)frame Tit:(NSString *)tit titColor:(UIColor *)titColor titFont:(UIFont *)font backColor:(UIColor *)backColor addTarget:(nullable id)target action:(SEL)action{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    [btn setTitle:tit forState:UIControlStateNormal];
    [btn setTitleColor:titColor forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = backColor;
    [btn setCornerRadius:btn.height/2.0];
    return btn;
}

#pragma mark - UIImageView
+(UIImageView *)creatImageViewWithFrame:(CGRect)frame imgName:(NSString *)imgName{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:frame];
    imageView.image = [UIImage imageNamed:imgName];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    return imageView;
}

#pragma mark - UITextField
+ (UITextField *)creatTextFieldWithFrame:(CGRect)frame placeHolder:(NSString *)placeHolder font:(UIFont *)font color:(UIColor *)color{
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    textField.placeholder = placeHolder;
    textField.font = font;
    textField.textColor = color;
    textField.autocapitalizationType = YES;//关闭首字母大写
    return textField;
}

#pragma mark - Alert
+(UIViewController *)getCurrentVC{
 
      UIViewController *result = nil;

      UIWindow * window = [[UIApplication sharedApplication] keyWindow];
      if (window.windowLevel != UIWindowLevelNormal)  {
         NSArray *windows = [[UIApplication sharedApplication] windows];
         for(UIWindow * tmpWin in windows)  {
             if (tmpWin.windowLevel == UIWindowLevelNormal)  {
                 window = tmpWin;
                 break;
             }
         }
     }

     UIView *frontView = [[window subviews] objectAtIndex:0];
     id nextResponder = [frontView nextResponder];

     if ([nextResponder isKindOfClass:[UIViewController class]])
         result = nextResponder;
     else
         result = window.rootViewController;

    return result;
}
+(NSMutableAttributedString *)changeMsgFontAndColor:(NSString *)msg{
    if (msg==nil||[msg isEqualToString:@""]) {
        return nil;
    }
    NSMutableAttributedString *messageAtt = [[NSMutableAttributedString alloc] initWithString:msg];
    [messageAtt addAttribute:NSFontAttributeName value:KFONT_14 range:NSMakeRange(0, msg.length)];
    [messageAtt addAttribute:NSForegroundColorAttributeName value:KCOLOR_6 range:NSMakeRange(0, msg.length)];
    return messageAtt;
}
+(void)showMsg:(NSString *)msg{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:msg preferredStyle:UIAlertControllerStyleAlert];
    [alert setValue:[self changeMsgFontAndColor:msg] forKey:@"attributedMessage"];
    //修改按钮的颜色
    UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [sure setValue:KCOLOR_ZT forKey:@"_titleTextColor"];
    [alert addAction:sure];
    
    UIViewController *vc = [self getCurrentVC];
    [vc presentViewController:alert animated:true completion:nil];
}
+(void)showMsg:(NSString *)msg withEvent:(void(^)(void))touchEvent{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:msg preferredStyle:UIAlertControllerStyleAlert];
    [alert setValue:[self changeMsgFontAndColor:msg] forKey:@"attributedMessage"];
    //修改按钮的颜色
    UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        touchEvent();
    }];
    [sure setValue:KCOLOR_ZT forKey:@"_titleTextColor"];
    [alert addAction:sure];
    UIViewController *vc = [self getCurrentVC];
    [vc presentViewController:alert animated:true completion:nil];
}
+(void)showMsg:(NSString *)msg withChooseEvent:(void(^)(BOOL isTrue))touchEvent{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:msg preferredStyle:UIAlertControllerStyleAlert];
    [alert setValue:[self changeMsgFontAndColor:msg] forKey:@"attributedMessage"];
    //取消按钮
    UIAlertAction *leftBtn = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        touchEvent(NO);
    }];
    [leftBtn setValue:KCOLOR_9 forKey:@"_titleTextColor"];
    [alert addAction:leftBtn];
    //确定按钮
    UIAlertAction *rightBtn = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        touchEvent(YES);
    }];
    [rightBtn setValue:KCOLOR_ZT forKey:@"_titleTextColor"];
    [alert addAction:rightBtn];
    UIViewController *vc = [self getCurrentVC];
    [vc presentViewController:alert animated:true completion:nil];
}
+(void)showMsg:(NSString *)msg withTit:(NSString *)tit withChooseEvent:(void(^)(BOOL isTrue))touchEvent{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:tit message:msg preferredStyle:UIAlertControllerStyleAlert];
    [alert setValue:[self changeMsgFontAndColor:msg] forKey:@"attributedMessage"];
    //取消按钮
    UIAlertAction *leftBtn = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        touchEvent(NO);
    }];
    [leftBtn setValue:KCOLOR_9 forKey:@"_titleTextColor"];
    [alert addAction:leftBtn];
    //确定按钮
    UIAlertAction *rightBtn = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        touchEvent(YES);
    }];
    [rightBtn setValue:KCOLOR_ZT forKey:@"_titleTextColor"];
    [alert addAction:rightBtn];
    UIViewController *vc = [self getCurrentVC];
    [vc presentViewController:alert animated:true completion:nil];
}
+(void)showMsg:(NSString *)msg withLeftTit:(NSString *)leftTit withRightTit:(NSString *)rightTit withEvent:(void(^)(BOOL isTrue))touchTowEvent{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:msg preferredStyle:UIAlertControllerStyleAlert];
    [alert setValue:[self changeMsgFontAndColor:msg] forKey:@"attributedMessage"];
    //左侧按钮
    UIAlertAction *leftBtn = [UIAlertAction actionWithTitle:leftTit style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        touchTowEvent(NO);
    }];
    [leftBtn setValue:KCOLOR_9 forKey:@"_titleTextColor"];
    [alert addAction:leftBtn];
    //右侧按钮
    UIAlertAction *rightBtn = [UIAlertAction actionWithTitle:rightTit style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        touchTowEvent(YES);
    }];
    [rightBtn setValue:KCOLOR_ZT forKey:@"_titleTextColor"];
    [alert addAction:rightBtn];
    UIViewController *vc = [self getCurrentVC];
    [vc presentViewController:alert animated:true completion:nil];
}
+(void)showSheet:(void(^)(NSInteger index))touchSheetEvent{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel
                                                          handler:nil];
    UIAlertAction* action1 = [UIAlertAction actionWithTitle:@"举报" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (touchSheetEvent) {
            touchSheetEvent(1);
        }
    }];
    
    UIAlertAction* action2 = [UIAlertAction actionWithTitle:@"拉黑" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (touchSheetEvent) {
            touchSheetEvent(2);
        }
    }];
    [alert addAction:action1];
    [alert addAction:action2];
    [alert addAction:cancelAction];
    UIViewController *vc = [self getCurrentVC];
    [vc presentViewController:alert animated:YES completion:nil];
}

//获取底部安全距离
+ (CGFloat)safeAreaHeight {
    if (@available(iOS 11.0, *)) {
        UIWindow *mainWindow = [[[UIApplication sharedApplication] delegate] window];
        return mainWindow.safeAreaInsets.bottom;
    }
    return 0;
}

+(BOOL)isFullScreenIphone {
    BOOL isFullIphone = NO;
    if (@available(iOS 11.0, *)) {
        UIWindow *mainWindow = [[[UIApplication sharedApplication] delegate] window];
        if (mainWindow.safeAreaInsets.bottom > 0.0) {
            isFullIphone = YES;
        }
    }
    return isFullIphone;
}

+(void)openPageInWeb:(NSString *)url{
    if (@available(iOS 10.0, *)) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url] options:@{} completionHandler:^(BOOL success) {
        }];
    } else {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
    }
}

@end

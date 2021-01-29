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
    return obj ? obj:nil;
}
#pragma mark -删除本地数据
+(void)removeLocalData:(NSString *)key{
    NSMutableDictionary *userMsgDic = [self getLocalResource];
    if (userMsgDic) {
        [userMsgDic removeObjectForKey:key];
        [userMsgDic writeToFile:KPath atomically:YES];
    }
}
#pragma mark -清空本地数据
+(void)removeAllLocalData{
    NSMutableDictionary *userMsgDic = [self getLocalResource];
    [userMsgDic removeAllObjects];
    [userMsgDic writeToFile:KPath atomically:YES];
}
#pragma mark -获取项目配置信息
+(id)getMyProjectConfigMessage:(NSString *)key{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"MyConfigFile" ofType:@"plist"];
    NSDictionary *fileDictionary = [[NSDictionary alloc]initWithContentsOfFile:filePath];
    id obj = [fileDictionary objectForKey:key];
    return obj ? obj:nil;
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
    textField.autocapitalizationType = YES;//关闭键盘首字母大写
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
    [sure setValue:KCOLOR_F0 forKey:@"_titleTextColor"];
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
    [sure setValue:KCOLOR_F0 forKey:@"_titleTextColor"];
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
    [rightBtn setValue:KCOLOR_F0 forKey:@"_titleTextColor"];
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
    [rightBtn setValue:KCOLOR_F0 forKey:@"_titleTextColor"];
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
    [rightBtn setValue:KCOLOR_F0 forKey:@"_titleTextColor"];
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

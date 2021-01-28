//
//  UIButton+ButtonHelper.m
//  MyProject
//
//  Created by 互娱盘古 on 2020/6/29.
//  Copyright © 2020 小小程序员. All rights reserved.
//

#import "UIButton+ButtonHelper.h"
#import <objc/runtime.h>

@implementation UIButton (ButtonHelper)

- (void)setWSpace:(CGFloat)wSpace{
    objc_setAssociatedObject(self, @selector(wSpace), @(wSpace), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)wSpace{
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}

-(void)setTxtRect:(CGRect)txtRect{
    objc_setAssociatedObject(self, @selector(txtRect), [NSValue valueWithCGRect:txtRect], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGRect)txtRect{
    return [objc_getAssociatedObject(self, _cmd) CGRectValue];
}

-(void)setImgRect:(CGRect)imgRect{
    objc_setAssociatedObject(self, @selector(imgRect), [NSValue valueWithCGRect:imgRect], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(CGRect)imgRect{
    return [objc_getAssociatedObject(self, _cmd) CGRectValue];
}

#pragma mark -方法替换
+(void)load{

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{

        Class class = [self class];

        SEL origjnalSelector = @selector(layoutSubviews);
        SEL swizzledSelector = @selector(my_layoutSubviews);

        Method origjnalMethod = class_getInstanceMethod(class, origjnalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);

        BOOL didAddMethod = class_addMethod(class, origjnalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));

        if (didAddMethod) {
            class_replaceMethod(class, swizzledSelector, method_getImplementation(origjnalMethod), method_getTypeEncoding(origjnalMethod));
        }else{
            method_exchangeImplementations(origjnalMethod, swizzledMethod);
        }

    });

}

-(void)my_layoutSubviews{
    [self my_layoutSubviews];

    if ([self txtRect].size.width != 0) {
        self.titleLabel.frame = self.txtRect;
    }
    if ([self imgRect].size.width != 0) {
        self.imageView.frame = self.imgRect;
    }
    if ([self wSpace] != 0) {
        self.imageView.frame = CGRectMake(self.wSpace/2, self.wSpace/2, self.width-self.wSpace, self.height-self.wSpace);
    }
}




@end

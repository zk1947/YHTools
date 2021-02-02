//
//  MainTabBar.m
//  TabBarDemo
//
//  Created by 互娱盘古 on 2020/3/25.
//  Copyright © 2020 互娱盘古. All rights reserved.
//

#import "MainTabBar.h"
#import "YHToolsHeader.h"

@interface MainTabBar ()

/** 中间按钮 */
@property (nonatomic, strong) UIButton *centerBtn;

/** 标签按钮集合 */
@property (nonatomic, strong) NSMutableArray *btnArr;

/** 标签名称集合 */
@property (nonatomic, copy) NSArray *titArr;

/** 标签图标集合 */
@property (nonatomic, copy) NSArray *imgArr;

/** 标签选中图标集合 */
@property (nonatomic, copy) NSArray *sImgArr;

/** 是否有凸起 默认非凸起 */
@property (nonatomic, assign) BOOL isRaised;

@end

@implementation MainTabBar

@dynamic delegate;

- (instancetype)initWithTitArr:(NSArray *)titArr imgArr:(NSArray *)imgArr sImgArr:(NSArray *)sImgArr isRaised:(BOOL)isRaised
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.btnArr = [NSMutableArray array];
        
        self.titArr = titArr;
        self.imgArr = imgArr;
        self.sImgArr = sImgArr;
        self.isRaised = isRaised;
        
        [self creatSubView];
    }
    return self;
}

-(void)creatSubView{
    
    if (_isRaised) {
        //设置拉伸点，对左边和上面分开设置，理解其拉伸效果
        UIImage *image = KIMAGE(@"fotter-bg");
        image = [image stretchableImageWithLeftCapWidth:0 topCapHeight:image.size.height*0.6];
        UIImageView *backV = [[UIImageView alloc]initWithFrame:CGRectMake(0, -KX(35), KSCR_W, KTAB_H+KX(35))];
        backV.userInteractionEnabled = YES;
        backV.image = image;
        [self addSubview:backV];
    }else{
        //背景色
        UIView *backV = [[UIView alloc]initWithFrame:CGRectMake(0, -KX(1), KSCR_W, KTAB_H+KX(1))];
        backV.backgroundColor = KCOLOR_FF;
        [self addSubview:backV];
        
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KSCR_W, KX(1))];
        line.backgroundColor = KCOLOR_RGB(215, 213, 214);
        [backV addSubview:line];
    }
    
    CGFloat btnW = KSCR_W/self.titArr.count;
    for (NSInteger index = 0; index < self.titArr.count; index ++) {
        
        UIButton *btn = [YHTool createMixBtn:self.titArr[index] titColor:KCOLOR_9 titFont:KFONT_10 Img:self.imgArr[index] addTarget:self action:@selector(btnAction:)];
        [btn setImage:KIMAGE(self.sImgArr[index]) forState:UIControlStateSelected];
        [btn setImage:KIMAGE(self.sImgArr[index]) forState:UIControlStateHighlighted];
        [btn setTitleColor:KCOLOR_9 forState:UIControlStateNormal];
        [btn setTitleColor:KCOLOR_ZT forState:UIControlStateSelected];
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        if (index == self.titArr.count/2 && _isRaised == YES) {
            btn.frame = CGRectMake(btnW*index, KX(35), btnW, KTAB_H+KSPA_40);
            btn.imgRect = CGRectMake((btnW-KX(40))/2, KSPA_5, KX(40), KX(40));
            btn.txtRect = CGRectMake(0, KX(40)+KSPA_10, btnW, KX(12));
            self.centerBtn = btn;
        }else{
            btn.frame = CGRectMake(btnW*index, 0, btnW, KTAB_H);
            btn.txtRect = CGRectMake(0, 37, btnW, 10);
            btn.imgRect = CGRectMake((btnW-30)/2, 5, 30, 30);
        }
        btn.tag = 2020 +index;
        [self addSubview:btn];
        [self.btnArr addObject:btn];
        if (index == 0) {
            btn.selected = YES;
        }
    }
    
}
#pragma mark -调整中间凸起按钮的frame
-(void)layoutSubviews{
    [super layoutSubviews];
    if (_isRaised) {
        
        CGFloat add1 = [YHTool  isFullScreenIphone] ? KX(-5):KX(2);
        self.centerBtn.centerY = KNAV_H/2-add1;
    }
}
#pragma mark -切换索引
-(void)btnAction:(UIButton *)btn{
    for (UIButton *indexBtn in self.btnArr) {
        indexBtn.selected = btn.tag == indexBtn.tag ? YES:NO;
    }
    if ([self.delegate respondsToSelector:@selector(changeIndex:)]) {
        [self.delegate changeIndex:btn.tag - 2020];
    }
}
-(void)setTabIndex:(NSInteger)tabIndex{
    _tabIndex = tabIndex;
    [self.btnArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *btn = obj;
        btn.selected = idx == _tabIndex ? YES:NO;
    }];
}
#pragma mark -重写hitTest方法，去监听发布按钮的点击，目的是为了让凸出的部分点击也有反应
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    //这一个判断是关键，不判断的话push到其他页面，点击发布按钮的位置也是会有反应的，这样就不好了
    //self.isHidden == NO 说明当前页面是有tabbar的，那么肯定是在导航控制器的根控制器页面
    //在导航控制器根控制器页面，那么我们就需要判断手指点击的位置是否在发布按钮身上
    //是的话让发布按钮自己处理点击事件，不是的话让系统去处理点击事件就可以了
    if (self.isHidden == NO) {

        //将当前tabbar的触摸点转换坐标系，转换到发布按钮的身上，生成一个新的点
        CGPoint newP = [self convertPoint:point toView:self.centerBtn];

        //判断如果这个新的点是在发布按钮身上，那么处理点击事件最合适的view就是发布按钮
        if ( [self.centerBtn pointInside:newP withEvent:event]) {
            return self.centerBtn;
        }else{//如果点不在发布按钮身上，直接让系统处理就可以了

            return [super hitTest:point withEvent:event];
        }
    }

    else {//tabbar隐藏了，那么说明已经push到其他的页面了，这个时候还是让系统去判断最合适的view处理就好了
        return [super hitTest:point withEvent:event];
    }
}
#pragma mark -彻底干掉系统UITabBarItem
- (NSArray<UITabBarItem *> *)items {
    return @[];
}
- (void)setItems:(NSArray<UITabBarItem *> *)items {
}
- (void)setItems:(NSArray<UITabBarItem *> *)items animated:(BOOL)animated {
}

@end

//
//  MainTabBar.h
//  TabBarDemo
//
//  Created by 互娱盘古 on 2020/3/25.
//  Copyright © 2020 互娱盘古. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MainTabBarDelegate <NSObject>

-(void)changeIndex:(NSInteger)index;

@end

@interface MainTabBar : UITabBar

/** 标签栏索引 */
@property (nonatomic, assign) NSInteger tabIndex;

/** 代理 */
@property (nonatomic, weak) id delegate;

/// 创建tabbar
/// @param titArr 名称
/// @param imgArr 图标
/// @param sImgArr 选中图标
/// @param isRaised 是否凸起
- (instancetype)initWithTitArr:(NSArray *)titArr imgArr:(NSArray *)imgArr sImgArr:(NSArray *)sImgArr isRaised:(BOOL)isRaised;

@end

NS_ASSUME_NONNULL_END

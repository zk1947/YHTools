//
//  MainTabBarController.m
//  TabBarDemo
//
//  Created by 互娱盘古 on 2020/3/25.
//  Copyright © 2020 互娱盘古. All rights reserved.
//

#import "MainTabBarController.h"
#import "MainTabBar.h"
#import "BaseNavigationViewController.h"
#import "YHViewController.h"

@interface MainTabBarController ()

@property(nonatomic,strong)MainTabBar *mainTabBar;

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpChildVC];
    
    [self setValue:self.mainTabBar forKey:@"tabBar"];
    
}
-(void)setUpChildVC{
    
    YHViewController *vc1 = [YHViewController new];
    BaseNavigationViewController *nav1 = [[BaseNavigationViewController alloc] initWithRootViewController:vc1];
    [self addChildViewController:nav1];
    
    YHViewController *vc3 = [YHViewController new];
    BaseNavigationViewController *nav3 = [[BaseNavigationViewController alloc] initWithRootViewController:vc3];
    [self addChildViewController:nav3];
    
    YHViewController *vc4 = [YHViewController new];
    BaseNavigationViewController *nav4 = [[BaseNavigationViewController alloc] initWithRootViewController:vc4];
    [self addChildViewController:nav4];
        
}
-(MainTabBar *)mainTabBar{
    if (!_mainTabBar) {
        NSArray *titArr = @[@"测试",@"测试",@"测试"];
        NSArray *imgArr = @[@"icon_fanhui",@"icon_fanhui",@"icon_fanhui"];
        NSArray *sImgArr = @[@"icon_fanhui",@"icon_fanhui",@"icon_fanhui"];
        MainTabBar *mainTabBar = [[MainTabBar alloc]initWithTitArr:titArr imgArr:imgArr sImgArr:sImgArr isRaised:YES];
        mainTabBar.delegate = self;
        _mainTabBar = mainTabBar;
    }
    return _mainTabBar;
}
#pragma mark -TabBar Delegate
-(void)changeIndex:(NSInteger)index{
    self.selectedIndex = index;
}
-(void)setTabIndex:(NSInteger)tabIndex{
    _tabIndex = tabIndex;
    self.selectedIndex = _tabIndex;
    self.mainTabBar.tabIndex = _tabIndex;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

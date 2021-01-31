//
//  BaseNavigationViewController.m
//  YHTools
//
//  Created by 赵凯 on 2021/1/31.
//

#import "BaseNavigationViewController.h"
#import "YHToolsHeader.h"

@interface BaseNavigationViewController ()

@end

@implementation BaseNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //设置导航背景色
    [self.navigationBar setBackgroundImage:[UIColor imageWithColor:KCOLOR_ZT] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:[UIImage new]];
    //设置导航标题字色和字号
    self.modalPresentationStyle = UIModalPresentationFullScreen;
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:KCOLOR_FF,NSFontAttributeName:KFONT_17}];
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

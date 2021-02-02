//
//  BaseNavigationViewController.m
//  YHTools
//
//  Created by 赵凯 on 2021/1/31.
//

#import "BaseNavigationViewController.h"
#import "YHToolsHeader.h"

@interface BaseNavigationViewController ()

@property (nonatomic, strong) UIView *baseBackView;//返回按钮

@end

@implementation BaseNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //设置导航穿透度
    self.navigationBar.translucent = NO;
    //设置导航背景色
    [self.navigationBar setBackgroundImage:[UIColor imageWithColor:KCOLOR_ZT] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:[UIImage new]];
    //设置导航标题字色和字号
    self.modalPresentationStyle = UIModalPresentationFullScreen;
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:KCOLOR_FF,NSFontAttributeName:KFONT_17}];
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count > 0) {
    viewController.hidesBottomBarWhenPushed = YES;
    viewController.navigationItem.leftBarButtonItem =
        [[UIBarButtonItem alloc] initWithCustomView:self.baseBackView];
    }
    [super pushViewController:viewController animated:animated];
}
- (UIView *)baseBackView{
    if (!_baseBackView) {
        UIButton *backBtn = [YHTool createImgBtn:CGRectMake(0, 0, KSPA_44, KSPA_44) Img:@"icon_fanhui" addTarget:self action:@selector(baseBackBtnAction:)];
        backBtn.imgRect = CGRectMake(-KX(10), KX(10), KX(24), KX(24));
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KSPA_44, KSPA_44)];
        [view addSubview:backBtn];
        _baseBackView = view;
    }
    return _baseBackView;
}
- (void)baseBackBtnAction:(UIButton *)btn{
    [self popViewControllerAnimated:YES];
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

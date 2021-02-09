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
    self.edgesForExtendedLayout = UIRectEdgeNone;
    //设置模态样式
    self.modalPresentationStyle = UIModalPresentationFullScreen;
    //设置导航背景色
    [self.navigationBar setBackgroundImage:[UIColor imageWithColor:KCOLOR_ZT] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:[UIImage new]];
    //设置导航标题字色和字号
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:KCOLOR_FF,NSFontAttributeName:KFONT_17}];
    //重置侧滑代理
    __weak typeof(self) weakSelf = self;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = (id)weakSelf;
    }
}
#pragma mark -自定义返回按钮，处理tabbar的显示隐藏
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
#pragma mark -侧滑返回处理
-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer*)gestureRecognizer {
    // 判断是否是侧滑相关的手势
    if(gestureRecognizer == self.interactivePopGestureRecognizer) {
        //如果当前展示的控制器是根控制器就不让其响应
        if (self.viewControllers.count < 2 || self.visibleViewController == [self.viewControllers objectAtIndex:0]){
            return NO;
        }
    }
        //如果个别页面不需要或者不能侧滑反，只要在这个方法返回NO就可以。代码如下：
//        if ([self.topViewController isKindOfClass:[YourCustomViewController class]]) {
//            return NO;
//        }
        return YES;
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

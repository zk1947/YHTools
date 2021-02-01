//
//  BaseViewController.m
//  YHTools
//
//  Created by 赵凯 on 2021/1/31.
//

#import "BaseViewController.h"
#import "YHTool.h"
#import "UIButton+ButtonHelper.h"

@interface BaseViewController ()

@property (nonatomic, strong) UIView *baseBackView;//返回按钮

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    //非一级页面添加返回按钮
    if (self.navigationController.viewControllers.count>1) {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.baseBackView];
    }
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
    [self.navigationController popViewControllerAnimated:YES];
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

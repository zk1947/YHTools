//
//  YHViewController.m
//  YHTools
//
//  Created by zk1947@163.com on 01/28/2021.
//  Copyright (c) 2021 zk1947@163.com. All rights reserved.
//

#import "YHViewController.h"
#import "YHToolsHeader.h"
#import "BaseViewController.h"

@interface YHViewController ()

@end

@implementation YHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    UIButton *btn = [YHTool createTxtBtn:CGRectMake(0, 100, 200, 200) Tit:@"sdsd" titColor:KCOLOR_ZT titFont:KFONT_17 addTarget:self action:@selector(test)];
    [self.view addSubview:btn];
}

-(void)test{
    
    
//    ShowMessage(@"测试文本效果");
    
//    ShowDefaultSuccessView(@"测试成功效果", nil);
    
//    ShowDefaultErrorView(@"测试失败效果", nil);
    
//    ShowDefaultLoadingView(@"加载中...");
    
    
//    BaseViewController *vc = [BaseViewController new];
//    KPUSH(vc);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  YHViewController.m
//  YHTools
//
//  Created by zk1947@163.com on 01/28/2021.
//  Copyright (c) 2021 zk1947@163.com. All rights reserved.
//

#import "YHViewController.h"
#import "YHToolsHeader.h"

@interface YHViewController ()

@end

@implementation YHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    NSString *str = [YHTool getMyProjectThemeColor:@"themeColor"];
    NSLog(@"%@",str);
    NSString *str2 = [YHTool getMyProjectThemeColor:@"themeColor"];
    NSLog(@"%@",str2);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

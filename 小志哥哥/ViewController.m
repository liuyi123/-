//
//  ViewController.m
//  小志哥哥
//
//  Created by liuyi on 15/12/14.
//  Copyright © 2015年 puji. All rights reserved.
//

#import "ViewController.h"
#import "MainTabViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"刘熠";
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame=CGRectMake(self.view.bounds.size.width/2-100, self.view.bounds.size.height/2-20, 200, 40);
    [btn setTitle:@"进入主页" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(jumpToMainVc) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
//跳转到主页面
- (void)jumpToMainVc {
    MainTabViewController *TabBarVc = [[MainTabViewController alloc] init];
    
    [UIApplication sharedApplication].keyWindow.rootViewController = TabBarVc;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

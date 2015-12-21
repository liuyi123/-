//
//  LifeVC.m
//  小志哥哥
//
//  Created by liuyi on 15/12/14.
//  Copyright © 2015年 puji. All rights reserved.
//

#import "LifeVC.h"
#import "MainTabViewController.h"
#import "AppDelegate.h"
@interface LifeVC ()

@end

@implementation LifeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor blueColor];
    self.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem *leftItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"menu"] style:UIBarButtonItemStylePlain target:self action:@selector(openOrCloseLeftList)];
    leftItem.tintColor=[UIColor redColor];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    // Do any additional setup after loading the view.
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"viewWillDisappear");
//    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//    [tempAppDelegate.LeftSlideVC setPanEnabled:NO];
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear");
    MainTabViewController *tabVC = (MainTabViewController *)self.tabBarController;
    [tabVC setCustomTabBarHide:NO];
    
    
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    tempAppDelegate.leftVC.leftViewHideDelegate=self;
    [tempAppDelegate.LeftSlideVC setPanEnabled:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) openOrCloseLeftList
{
    
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    if (tempAppDelegate.LeftSlideVC.closed)
    {
        [tempAppDelegate.LeftSlideVC openLeftView];
    }
    else
    {
        [tempAppDelegate.LeftSlideVC closeLeftView];
    }
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

//
//  AppDelegate.h
//  小志哥哥
//
//  Created by liuyi on 15/12/14.
//  Copyright © 2015年 puji. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftSlideViewController.h"
#import "LeftSortsViewController.h"
#import "MainTabViewController.h"
#import "CCUser.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>
+(instancetype)instance;
@property (strong, nonatomic) UIWindow *window;
/*! @brief 注册个推后的cid
 *
 */
@property(nonatomic,copy)NSString* getuiCid;

@property(nonatomic,strong)CCUser* userInfo;

@property (strong, nonatomic) LeftSlideViewController *LeftSlideVC;
@property (strong, nonatomic) MainTabViewController *mainVC;
@property(strong,nonatomic)LeftSortsViewController *leftVC;
-(void)jumpToMain;
@end


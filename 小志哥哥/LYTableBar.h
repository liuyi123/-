//
//  LYTableBar.h
//  小志哥哥
//
//  Created by liuyi on 15/12/14.
//  Copyright © 2015年 puji. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^LYTabBarBlock)(NSInteger selectedIndex);
@interface LYTableBar : UIView
@property(nonatomic,copy)LYTabBarBlock tableBarBlock;
@property(nonatomic,strong)NSArray *items;
@end

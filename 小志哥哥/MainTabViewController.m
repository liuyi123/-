//
//  MainTabViewController.m
//  小志哥哥
//
//  Created by liuyi on 15/12/14.
//  Copyright © 2015年 puji. All rights reserved.
//

#import "MainTabViewController.h"
#import "LYTableBar.h"
#import "MainPageVC.h"
#import "LifeVC.h"
#define XCTabBarBackgroungColor [UIColor colorWithRed:241 / 255.0 green:241 / 255.0 blue:241 / 255.0 alpha:1]
#define XCTabBarBorderColor [[UIColor colorWithRed:178 / 255.0 green:178 / 255.0 blue:178 / 255.0 alpha:1] CGColor]
@interface MainTabViewController ()
@property(nonatomic,strong)NSMutableArray *itmes;
@end

@implementation MainTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor yellowColor];
    [self setUpAllChildVC];
    
    LYTableBar *tableBar=[[LYTableBar alloc]initWithFrame:self.tabBar.frame];
    tableBar.items=self.itmes;
    __weak typeof(self) weakself = self;
    tableBar.tableBarBlock=^(NSInteger selectedIndex){
        if (selectedIndex==2) {
            return;
        }
        weakself.selectedIndex=selectedIndex;
    
    };

    [self.view addSubview:tableBar];
    [self.tabBar removeFromSuperview];
    
    
    
}
- (void)setUpAllChildVC{
    
      MainPageVC *PageVC= [[MainPageVC alloc]init];
     [self setOneChildVc:PageVC withTitle:@"物业" image:[UIImage imageNamed:@"物业2"] selImage:[UIImage imageNamed:@"物业1"]];
    
    LifeVC *lifeVC= [[LifeVC alloc]init];
    [self setOneChildVc:lifeVC withTitle:@"生活" image:[UIImage imageNamed:@"生活2"] selImage:[UIImage imageNamed:@"生活1"]];
    
    MainPageVC *VC3= [[MainPageVC alloc]init];
    [self setOneChildVc:VC3 withTitle:@"邻里圈" image:[UIImage imageNamed:@"邻里圈"] selImage:[UIImage imageNamed:@"邻里圈1"]];
    
    LifeVC *VC4 = [[LifeVC alloc]init];
    [self setOneChildVc:VC4 withTitle:@"购物车" image:[UIImage imageNamed:@"购物车2"] selImage:[UIImage imageNamed:@"购物车1"]];
    


}
-(NSMutableArray *)itmes{
    if (_itmes==nil) {
        _itmes=[NSMutableArray array];
    }
    return _itmes;
}
//添加一个自控制器的方法
- (void)setOneChildVc:(UIViewController *)vc withTitle:(NSString *)title image:(UIImage *)image selImage:(UIImage *)selImage {
    
    vc.title = title;
    //    Vc.tabBarItem.title = title;
    vc.tabBarItem.image = image;
    selImage = [selImage imageWithRenderingMode:UIImageRenderingModeAutomatic];
    vc.tabBarItem.selectedImage = selImage;
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    //    Nav.tabBarItem.image = image;
    //     Vc.tabBarItem.selectedImage = selImage;
    [self addChildViewController:nav];
    
    [self.itmes addObject:vc.tabBarItem];
    

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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

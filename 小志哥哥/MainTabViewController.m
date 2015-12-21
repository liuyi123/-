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
#import "LeftSortsViewController.h"
#import "CommonDefine.h"
#import "LYTableButton.h"
#import "ViewController.h"
#define XCTabBarBackgroungColor [UIColor colorWithRed:241 / 255.0 green:241 / 255.0 blue:241 / 255.0 alpha:1]
#define XCTabBarBorderColor [[UIColor colorWithRed:178 / 255.0 green:178 / 255.0 blue:178 / 255.0 alpha:1] CGColor]
@interface MainTabViewController ()
@property(nonatomic,strong)NSMutableArray *itmes;
@property(nonatomic,strong)LYTableBar *customTabbar;
@property(nonatomic,strong)UIView *layerView;
@end

@implementation MainTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpAllChildVC];
    
       _layerView=[self CreatlasticLayerView];
    
    
    self.customTabbar=[[LYTableBar alloc]initWithFrame:self.tabBar.frame];
    self.customTabbar.items=self.itmes;
    __weak typeof(self) weakself = self;
    self.customTabbar.tableBarBlock=^(NSInteger selectedIndex){
        if (selectedIndex==2) {
            [weakself showINElasticLayer];
            return;
        }
        if (weakself.layerView.superview) {
            [weakself.layerView removeFromSuperview];
        }
      
        weakself.selectedIndex=selectedIndex;
    
    };
    
    [self.view addSubview:self.customTabbar];
    [self.tabBar removeFromSuperview];
  
    
    
}
-(void)setCustomTabBarHide:(BOOL)hidden{
    self.customTabbar.hidden = hidden;
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
    if (!_itmes) {
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
-(void)showINElasticLayer{
    if (!_layerView.superview) {
        [self.view addSubview:_layerView];
    }else{
        [_layerView removeFromSuperview];
    }
    
    


}

-(UIView*)CreatlasticLayerView{
    
    UITabBarItem *item1=[[UITabBarItem alloc]initWithTitle:@"测试" image:[UIImage imageNamed:@"物业2"] selectedImage:[UIImage imageNamed:@"物业1"]];
    UITabBarItem *item2=[[UITabBarItem alloc]initWithTitle:@"物业1" image:[UIImage imageNamed:@"物业2"] selectedImage:[UIImage imageNamed:@"物业1"]];
    UITabBarItem *item3=[[UITabBarItem alloc]initWithTitle:@"测试" image:[UIImage imageNamed:@"物业2"] selectedImage:[UIImage imageNamed:@"测试"]];
    UITabBarItem *item4=[[UITabBarItem alloc]initWithTitle:@"测试" image:[UIImage imageNamed:@"物业2"] selectedImage:[UIImage imageNamed:@"物业1"]];
    
    NSArray *items=@[item1,item2,item3,item4];
    
    
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-92, 200, 44)];
    
    CGFloat btnW=view.frame.size.width/items.count;
    CGFloat btnH=44;
    CALayer* layer = view.layer;
    layer.borderColor = [UIColor grayColor].CGColor;
    layer.borderWidth = 1;
    
    
    for (int i=0; i<items.count; i++) {
        LYTableButton *btn=[LYTableButton buttonWithType:UIButtonTypeCustom];
        UITabBarItem *item=items[i];
        btn.item=item;
        btn.frame=CGRectMake(i*btnW, 0, btnW, btnH);
        btn.tag=i;
        [btn addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:btn];
        
    }
    

    return view;
}
-(void)push:(UIButton *)btn{
    ViewController *vc=[[ViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    

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

//
//  LYTableBar.m
//  小志哥哥
//
//  Created by liuyi on 15/12/14.
//  Copyright © 2015年 puji. All rights reserved.
//

#import "LYTableBar.h"
#import "LYTableButton.h"
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height
#define XCTabBarBackgroungColor [UIColor colorWithRed:241 / 255.0 green:241 / 255.0 blue:241 / 255.0 alpha:1]
#define XCTabBarBorderColor [[UIColor colorWithRed:178 / 255.0 green:178 / 255.0 blue:178 / 255.0 alpha:1] CGColor]
@interface LYTableBar()
//添加点击的tabbar的脚标按钮
@property (nonatomic, weak) LYTableButton *selectedButton;
@end
@implementation LYTableBar
-(instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        self.backgroundColor = XCTabBarBackgroungColor;
        self.layer.borderWidth = 0.5;
        self.layer.borderColor = XCTabBarBorderColor;
    }
    return self;
}
-(void)addTableBarButton:(UITabBarItem*)item{
    
    

}

-(void)setItems:(NSArray *)items{
    
    _items=items;
    CGFloat buttnW=SCREEN_WIDTH/items.count;
    int i=0;
    
    for (UITabBarItem *item in items) {
        LYTableButton *tableButton=[LYTableButton buttonWithType:UIButtonTypeCustom];
        tableButton.frame=CGRectMake(i*buttnW, 0, buttnW, self.frame.size.height);
        tableButton.tag=i;
        tableButton.item=item;
        if (tableButton.tag==0) {
            [self tabBarButtonClick:tableButton];
        }
        [tableButton addTarget:self action:@selector(tabBarButtonClick:) forControlEvents:UIControlEventTouchDown];
        i++;
       [self addSubview:tableButton];
        
    }


}

-(void)tabBarButtonClick:(LYTableButton *)btn{
    
//    for (id obj in self.subviews) {
//        if ([obj isKindOfClass:[LYTableButton class]]) {
//            LYTableButton *tableBtn=obj;
//            if (tableBtn==btn) {
//                tableBtn.selected=YES;
//            }else{
//                tableBtn.selected=NO;
//            }
//        }
//        
//    }
    
    if (!btn.selected) {
 
        _selectedButton.selected = NO;
        btn.selected = YES;
        _selectedButton = btn;
        if (_tableBarBlock) {
            _tableBarBlock(btn.tag);
            
        }
    }
    
 
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

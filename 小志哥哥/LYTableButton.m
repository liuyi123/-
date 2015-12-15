//
//  LYTableButton.m
//  小志哥哥
//
//  Created by liuyi on 15/12/14.
//  Copyright © 2015年 puji. All rights reserved.
//

#import "LYTableButton.h"

#define XCImageRadio 0.5
#define XCTabBarButtonMargin 5
#define XCTabBarButtonWithBarMargin 6
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
@interface LYTableButton()

@end
@implementation LYTableButton
-(instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        //文字居中
        self.titleLabel.textAlignment=NSTextAlignmentCenter;
        //图片居中
        self.imageView.contentMode=UIViewContentModeCenter;
        //文字大小
        self.titleLabel.font=[UIFont systemFontOfSize:10];
        
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor colorWithRed:0.4f green:0.75f blue:0.09f alpha:1] forState:UIControlStateSelected];
        [self setTitleColor:[UIColor colorWithRed:0.4f green:0.75f blue:0.09f alpha:1] forState:UIControlStateDisabled];
        
        
        
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat imagex = 0;
    CGFloat imagey = XCTabBarButtonWithBarMargin;
    CGFloat imagew = self.frame.size.width;
    CGFloat imageh = self.frame.size.height * XCImageRadio;
    self.imageView.frame=CGRectMake(imagex, imagey, imagew, imageh);
    
    CGFloat titlex = 1;
    CGFloat titley = CGRectGetMaxY(self.imageView.frame)+2;
    CGFloat titlew = self.frame.size.width;
    CGFloat titleh = self.frame.size.height - imageh - XCTabBarButtonWithBarMargin * 2;
    self.titleLabel.frame = CGRectMake(titlex, titley, titlew, titleh);
    
    

}
-(void)setItem:(UITabBarItem *)item{
    _item=item;
    [self setImage:item.image forState:UIControlStateNormal];
    [self setImage:item.selectedImage forState:UIControlStateSelected];
    [self setTitle:item.title forState:UIControlStateNormal];
    
    

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

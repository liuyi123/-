//
//  ViewController.m
//  小志哥哥
//
//  Created by liuyi on 15/12/14.
//  Copyright © 2015年 puji. All rights reserved.
//

#import "ViewController.h"
#import "MainTabViewController.h"
#import "AppDelegate.h"
#import "CommonDefine.h"
#import "LoginVC.h"
@interface ViewController ()
@property(nonatomic,strong)UIImageView *backgroundView;

@property(nonatomic,strong)UIImageView *loginLogo;

@property(nonatomic,strong)UILabel *appNameLabel;

@property(nonatomic,strong)UIButton *signinButton;

@property(nonatomic,strong)UIButton *loginButton;

@property(nonatomic,strong)UIButton *inviteCodeLoginButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"刘熠";
    
    self.navigationController.navigationBarHidden=YES;
    [self setUpSubViews];
//    UIButton *btn=[UIButton buttonWithType:UIButtonTypeSystem];
//    btn.frame=CGRectMake(self.view.bounds.size.width/2-100, self.view.bounds.size.height/2-20, 200, 40);
//    [btn setTitle:@"登录" forState:UIControlStateNormal];
//    [btn addTarget:self action:@selector(jumpToMainVc) forControlEvents:UIControlEventTouchUpInside];
//    
//    
//    
//    [self.view addSubview:btn];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)setUpSubViews{
    UIImageView *backgroundImageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"小志哥哥"]];
    backgroundImageV.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT+90);
    backgroundImageV.userInteractionEnabled = YES;
    _backgroundView = backgroundImageV;
    [self.view addSubview:backgroundImageV];
    
    UIImageView *loginLogoV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"LOGO3"]];
    CGFloat loginLogoWH = 60;
    CGFloat loginLogoX = (SCREEN_WIDTH - loginLogoWH)*0.5;
    CGFloat loginLogoY = (SCREEN_HEIGHT - loginLogoWH)*0.2;
    loginLogoV.frame = CGRectMake(loginLogoX, loginLogoY, loginLogoWH, loginLogoWH);
    _loginLogo = loginLogoV;
    [self.backgroundView addSubview:loginLogoV];
    
    UILabel *appNameL = [[UILabel alloc]init];
    CGFloat appNameY = CGRectGetMaxY(self.loginLogo.frame)+14;
    CGFloat appNameH = 18;
    appNameL.frame = CGRectMake(0, appNameY, SCREEN_WIDTH, appNameH);
    appNameL.font = [UIFont systemFontOfSize:18];
    appNameL.text = @"小志哥哥APP";
    appNameL.textColor = [UIColor whiteColor];
    appNameL.textAlignment = NSTextAlignmentCenter;
    _appNameLabel = appNameL;
    [self.backgroundView addSubview:appNameL];
    
    UIButton *signinBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat signinBtnW = 255;
    CGFloat signinBtnH = 40;
    CGFloat signinBtnY = CGRectGetMaxY(self.appNameLabel.frame)+108;
    CGFloat signinBtnX = (SCREEN_WIDTH - signinBtnW)*0.5;
    signinBtn.frame = CGRectMake(signinBtnX, signinBtnY, signinBtnW, signinBtnH);
    [signinBtn setBackgroundImage:[UIImage imageNamed:@"按钮"] forState:UIControlStateNormal];
    [signinBtn setBackgroundImage:[UIImage imageNamed:@"按钮-选中"] forState:UIControlStateHighlighted];
    [signinBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [signinBtn setTitle:@"注册" forState:UIControlStateNormal];
    [signinBtn addTarget:self action:@selector(signIn:) forControlEvents:UIControlEventTouchUpInside];
    _signinButton = signinBtn;
    [self.backgroundView addSubview:signinBtn];
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat loginBtnW = 255;
    CGFloat loginBtnH = 40;
    CGFloat loginBtnY = CGRectGetMaxY(self.signinButton.frame)+20;
    CGFloat loginBtnX = (SCREEN_WIDTH - signinBtnW)*0.5;
    loginBtn.frame = CGRectMake(loginBtnX, loginBtnY, loginBtnW, loginBtnH);
    [loginBtn setBackgroundImage:[UIImage imageNamed:@"按钮"] forState:UIControlStateNormal];
    [loginBtn setBackgroundImage:[UIImage imageNamed:@"按钮-选中"] forState:UIControlStateHighlighted];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    _loginButton = loginBtn;
    [self.backgroundView addSubview:loginBtn];
    
    UIButton *inviteCodeLoginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat inviteCodeLoginBtnW = 255;
    CGFloat inviteCodeLoginBtnH = 40;
    CGFloat inviteCodeLoginBtnX = (SCREEN_WIDTH - inviteCodeLoginBtnW)*0.5;
    CGFloat inviteCodeLoginBtnY = CGRectGetMaxY(self.loginButton.frame);
    inviteCodeLoginBtn.frame = CGRectMake(inviteCodeLoginBtnX, inviteCodeLoginBtnY, inviteCodeLoginBtnW, inviteCodeLoginBtnH);
    [inviteCodeLoginBtn setTitle:@"邀请码登录" forState:UIControlStateNormal];
    inviteCodeLoginBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [inviteCodeLoginBtn setTitleColor:[UIColor colorWithRed:53/255.0 green:122/255.0 blue:255/255.0 alpha:1] forState:UIControlStateNormal];
    [inviteCodeLoginBtn addTarget:self action:@selector(invitationLogin:) forControlEvents:UIControlEventTouchUpInside];
    _inviteCodeLoginButton = inviteCodeLoginBtn;
    [self.backgroundView addSubview:inviteCodeLoginBtn];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
     self.navigationController.navigationBarHidden=YES;

}
-(void)login:(UIButton*)btn{
    LoginVC *loginVC=[[LoginVC alloc]init];
    [self.navigationController pushViewController:loginVC animated:YES];
    

}
-(void)signIn:(UIButton*)btn{
    
    
}
-(void)invitationLogin:(UIButton*)btn{


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

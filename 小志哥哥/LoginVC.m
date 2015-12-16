//
//  LoginVC.m
//  小志哥哥
//
//  Created by liuyi on 15/12/16.
//  Copyright © 2015年 puji. All rights reserved.
//

#import "LoginVC.h"
#import "CommonDefine.h"
#import "UIView+JKPicker.h"
#import "UIView+Frame.h"
#import "AppDelegate.h"
@interface LoginVC ()
/**
 *  整个界面的背景图片
 */
@property(nonatomic,strong) UIImageView *backgroundImageView;
/**
 *  登录LOGO
 */
@property(nonatomic,strong)UIImageView *loginLOGO;
/**
 *  登录区域的背景图片
 */
@property(nonatomic,strong)UIImageView *loginBackgroundView;
/**
 *  账号textf
 */
@property (strong, nonatomic) UITextField *accountField;
/**
 *  密码textf
 */
@property (strong, nonatomic) UITextField *pwdField;
/**
 *  登陆按钮
 */
@property (strong, nonatomic) UIButton *loginBtn;
/**
 *  忘记密码button
 */
@property(nonatomic,strong)UIButton *forgetPwdBtn;

@property (nonatomic, strong) NSString *channelId;

@property (nonatomic, strong) NSString *pushUserId;
@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
     self.navigationController.navigationBarHidden=NO;
    [self setUpSubviews];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setUpSubviews{
    [self backgroundImageView];
    [self loginLOGO];
    [self loginBackgroundView];
    [self accountField];
    [self pwdField];
    [self loginBtn];
    [self forgetPwdBtn];
}
#pragma mark - getter
-(UIImageView *)backgroundImageView{
    if (!_backgroundImageView) {
        _backgroundImageView = [[UIImageView alloc]initWithFrame:SCREEN_BOUNDS];
        _backgroundImageView.image = [UIImage imageNamed:@"小志哥哥"];
        _backgroundImageView.userInteractionEnabled = YES;
        [self.view addSubview:_backgroundImageView];
    }
    return _backgroundImageView;
}
-(UIImageView *)loginLOGO{
    if (!_loginLOGO) {
        CGFloat loginLOGOWH = 60;
        CGFloat loginLOGOX = (SCREEN_WIDTH - loginLOGOWH)*0.5;
        CGFloat loginLOGOY = (SCREEN_HEIGHT - loginLOGOWH)*0.2;
        _loginLOGO = [[UIImageView alloc]initWithFrame:CGRectMake(loginLOGOX, loginLOGOY, loginLOGOWH, loginLOGOWH)];
        _loginLOGO.image = [UIImage imageNamed:@"LOGO3"];
        [self.backgroundImageView addSubview:_loginLOGO];
    }
    return _loginLOGO;
}
-(UIImageView *)loginBackgroundView{
    if (!_loginBackgroundView) {
        CGFloat loginBackW = 225;
        CGFloat loginBackH = 90;
        CGFloat loginBackX = (SCREEN_WIDTH - loginBackW)*0.5;
        CGFloat loginBackY = CGRectGetMaxY(self.loginLOGO.frame)+20;
        _loginBackgroundView = [[UIImageView alloc]initWithFrame:CGRectMake(loginBackX, loginBackY, loginBackW, loginBackH)];
        _loginBackgroundView.image = [UIImage imageNamed:@"输入框"];
        _loginBackgroundView.userInteractionEnabled = YES;
        [self.backgroundImageView addSubview:_loginBackgroundView];
    }
    return _loginBackgroundView;
}

-(UITextField *)accountField{
    if (!_accountField) {
        CGFloat accountFieldX = 45;
        CGFloat accountFieldY = 10;
        CGFloat accountFieldW = self.loginBackgroundView.width - accountFieldX - 5;
        CGFloat accountFieldH = 30;
        _accountField = [[UITextField alloc]initWithFrame:CGRectMake(accountFieldX, accountFieldY, accountFieldW, accountFieldH)];
        _accountField.placeholder = @"请输入手机号";
        _accountField.borderStyle = UITextBorderStyleNone;
        _accountField.keyboardType = UIKeyboardTypeNumberPad;
        _accountField.clearButtonMode = UITextFieldViewModeWhileEditing;
        [self.loginBackgroundView addSubview:_accountField];
    }
    return _accountField;
}

-(UITextField *)pwdField{
    if (!_pwdField) {
        CGFloat pwdFieldH = 30;
        CGFloat pwdFieldW = self.accountField.width;
        CGFloat pwdFieldX = self.accountField.x;
        CGFloat pwdFieldY = self.loginBackgroundView.height - 5 - pwdFieldH;
        _pwdField = [[UITextField alloc]initWithFrame:CGRectMake(pwdFieldX, pwdFieldY, pwdFieldW, pwdFieldH)];
        _pwdField.placeholder = @"请输入密码";
        _pwdField.borderStyle = UITextBorderStyleNone;
        _pwdField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _pwdField.secureTextEntry = YES;
        [self.loginBackgroundView addSubview:_pwdField];
    }
    return _pwdField;
}
//跳转到主页面
- (void)jumpToMainVc:(UIButton*)btn {
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [tempAppDelegate jumpToMain];
    
    //    MainTabViewController *TabBarVc = [[MainTabViewController alloc] init];
    //
    //    //[self presentViewController:TabBarVc animated:YES completion:nil];
    //   [UIApplication sharedApplication].keyWindow.rootViewController = TabBarVc;
}
-(UIButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        CGFloat loginBtnW = 225;
        CGFloat loginBtnH = 40;
        CGFloat loginBtnX = (SCREEN_WIDTH - loginBtnW)*0.5;
        CGFloat loginBtnY = CGRectGetMaxY(self.loginBackgroundView.frame)+20;
        _loginBtn.frame = CGRectMake(loginBtnX, loginBtnY, loginBtnW, loginBtnH);
        [_loginBtn setBackgroundImage:[UIImage imageNamed:@"按钮"] forState:UIControlStateNormal];
        [_loginBtn setBackgroundImage:[UIImage imageNamed:@"按钮-选中"] forState:UIControlStateHighlighted];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_loginBtn addTarget:self action:@selector(jumpToMainVc:) forControlEvents:UIControlEventTouchUpInside];
        [self.backgroundImageView addSubview:_loginBtn];
    }
    return _loginBtn;
}
-(UIButton *)forgetPwdBtn{
    if (!_forgetPwdBtn) {
        _forgetPwdBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        CGFloat forgetPwdW = self.loginBtn.width;
        CGFloat forgetPwdH = self.loginBtn.height;
        CGFloat forgetPwdX = self.loginBtn.x;
        CGFloat forgetPwdY = CGRectGetMaxY(self.loginBtn.frame)+10;
        _forgetPwdBtn.frame = CGRectMake(forgetPwdX, forgetPwdY, forgetPwdW, forgetPwdH);
        [_forgetPwdBtn setTitle:@"忘记密码?" forState:UIControlStateNormal];
        [_forgetPwdBtn setTitleColor:[UIColor colorWithRed:53/255.0 green:122/255.0 blue:255/255.0 alpha:1] forState:UIControlStateNormal];
        [_forgetPwdBtn addTarget:self action:@selector(forgetPassword:) forControlEvents:UIControlEventTouchUpInside];
        [self.backgroundImageView addSubview:_forgetPwdBtn];
    }
    return _forgetPwdBtn;
}
-(void)forgetPassword:(UIButton*)btn{//忘记密码


}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event

{
    //   退出键盘编辑
    if (![self.accountField isExclusiveTouch]) {
        [self.accountField resignFirstResponder];
    }
    if (![self.pwdField isExclusiveTouch]) {
        [self.pwdField resignFirstResponder];
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

//
//  UIAlertView+Kirinrin.h
//  YouMe
//
//  Created by Kirinrin on 14/9/18.
//  Copyright (c) 2014年 suplus. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "WelcomeViewController.h"
typedef NS_ENUM(NSUInteger, WSResult)
{
    WSResultSuccess = 0,                    //调用成功，可以检查data参数的内容。
    WSResultParameterMismatch = 1,          //参数不匹配。
    WSResultNoAuthorization = 2,            //没有授权的连接请求错误。
    WSResultTimeout = 3,                    //超时请求错误。
    WSResultUploadFail = 4,                 //文件保存失败。
    WSResultAccessTokenMismatch = 5,        //未传AccessToken。
    WSResultInvalidAccessToken = 6,         //AccessToken非法。
    WSResultNotAMobileNo = 51,              //手机号非法。
    WSResultRuntimeException = 99,          //服务器运行时错误。
    WSResultNoAccount = 101,                //用户名不存在。
    WSResultInvalidPassword = 102,          //密码错误。
    WSResultLoginDeny = 103,                //密码尝试次数过多。
    WSResultGetVerifyCodeWithHighRate = 104,//验证码获取频率过高。
    WSResultWrongVerifyCode = 105,          //验证码错误。
    WSResultPhoneNotRegistered = 106,       //手机号未注册
    WSResultEasemobRegisterFail = 191,      //环信注册失败。
    WSResultEasemobUpdateFaif = 192,        //环信更新失败。
    WSResultPhoneRegistered = 107,          //手机号已注册。
    WSResultFriendInviteAlreadySend = 261,  //重复邀请。
    WSResultFriendInviteAlreadyFriend = 262,//己是好友
    WSResultFriendInviteMe = 263,           //邀请自己
    WSResultSnsDuplicatePriase = 264,       //重复点赞
    WSResultDuplicateSubmit = 9,            //重复提交
    WSResultSQLException = 98,              //数据库错误
    WSResultUnkownError = -1,               //未知错误。
    WSResultFriendHadInThisFriendLabel = 265, //该好友已在此标签内
    WSResultFriendInviteAlreadyIsFriend = 266, //已经是好友
    WSResultPayFail = 267 //支付失败
};

@interface UIAlertView (Kirinrin)

+ (void) alertWithTitle:(NSString *)title message:(NSString *)message;
+ (void) alertWithMessage:(NSString *)message;
+ (void) alertWithRemoteError:(WSResult)errorCode;
+ (void) alertWithNetworkError;

/**
 *  利用系统的NSError类对一些错误进行了定义
 */
+ (void) alertWithStoreError:(NSError *)error;
@end

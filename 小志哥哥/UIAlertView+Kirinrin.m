//
//  UIAlertView+Kirinrin.m
//  YouMe
//
//  Created by Kirinrin on 14/9/18.
//  Copyright (c) 2014年 suplus. All rights reserved.
//

#import "UIAlertView+Kirinrin.h"
#import "AppDelegate.h"
#import <StoreKit/StoreKit.h>


@implementation UIAlertView (Kirinrin)
+ (void) alertWithTitle:(NSString *)title message:(NSString *)message{
    UIAlertView*alert = [[UIAlertView alloc] initWithTitle:title  message:message delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil];
    
    [alert show];
}

+ (void) alertWithMessage:(NSString *)message{
    [UIAlertView alertWithTitle:nil message:message];
}

+ (void) alertWithRemoteError:(WSResult)errorCode{
    NSString *alertTitle;
    NSString *alertMessage;
    
    switch (errorCode) {
        
        case WSResultParameterMismatch:{
            alertTitle = NSLocalizedString(@"提示", nil);
            alertMessage = NSLocalizedString(@"参数不匹配。", nil);
            
            break;
        }

        case WSResultNoAuthorization:{
            alertTitle = NSLocalizedString(@"提示", nil);
            alertMessage = NSLocalizedString(@"没有授权的连接请求，请重新登录!", nil);
            
            break;
        }

        case WSResultTimeout:{
            alertTitle = NSLocalizedString(@"提示", nil);
            alertMessage = NSLocalizedString(@"超时请求，请稍后再试。", nil);
            
            break;
        }
        case WSResultUploadFail:{
            alertTitle = NSLocalizedString(@"提示", nil);
            alertMessage = NSLocalizedString(@"上传失败，请稍后再试。", nil);
            
            break;
        }
        case WSResultAccessTokenMismatch:{
            alertTitle = NSLocalizedString(@"提示", nil);
            alertMessage = NSLocalizedString(@"您的帐号已在其它地方登录", nil);
            
            // 回到用户界面
            break;
        }
        case WSResultInvalidAccessToken:{
            alertTitle = NSLocalizedString(@"提示", nil);
            alertMessage = NSLocalizedString(@"AccecssToken无效，请重新登录。", nil);
            
            //自动重新登录
            
            break;
        }
        case WSResultNotAMobileNo:{
            alertTitle = NSLocalizedString(@"提示", nil);
            alertMessage = NSLocalizedString(@"无效的手机号码，请重新检查。", nil);
            
            break;
        }
    
        case WSResultRuntimeException:{
            alertTitle = NSLocalizedString(@"提示", nil);
            alertMessage = NSLocalizedString(@"服务器运行时错误，请稍后再试!", nil);
            
            break;
        }
        case WSResultNoAccount:{
            alertTitle = NSLocalizedString(@"提示", nil);
            alertMessage = NSLocalizedString(@"用户名不存在，请重新输入!", nil);
            break;
        }
        case WSResultInvalidPassword:{
            alertTitle = NSLocalizedString(@"提示", nil);
            alertMessage = NSLocalizedString(@"密码错误，请重新输入!", nil);
            
            break;
        }
        case WSResultLoginDeny:{
            alertTitle = NSLocalizedString(@"提示", nil);
            alertMessage = NSLocalizedString(@"密码失败次数过多，请稍后再试", nil);
            
            break;
        }case WSResultGetVerifyCodeWithHighRate:{
            alertTitle = NSLocalizedString(@"提示", nil);
            alertMessage = NSLocalizedString(@"验证码获取频率过高，请稍后再试", nil);
            
            break;
        }case WSResultWrongVerifyCode:{
            alertTitle = NSLocalizedString(@"提示", nil);
            alertMessage = NSLocalizedString(@"验证码错误，请重新输入!", nil);
            
            break;
        }case WSResultEasemobRegisterFail:{
            alertTitle = NSLocalizedString(@"提示", nil);
            alertMessage = NSLocalizedString(@"环信注册失败，请联系我们。", nil);
            
            break;
        }
        case WSResultEasemobUpdateFaif:{
            alertTitle = NSLocalizedString(@"提示", nil);
            alertMessage = NSLocalizedString(@"环信更新失败，请联系我们。", nil);
            
            break;
        }
        case WSResultPhoneRegistered:{
            alertTitle = NSLocalizedString(@"提示", nil);
            alertMessage = NSLocalizedString(@"该手机号已注册，请尝试忘记密码！", nil);
            break;
        }
        case WSResultUnkownError:{
            alertTitle = NSLocalizedString(@"提示", nil);
            alertMessage = NSLocalizedString(@"网络或服务器故障", nil);
            break;
        }
        case WSResultFriendInviteAlreadySend:{
//            alertTitle = NSLocalizedString(@"错误", nil);
            alertMessage = NSLocalizedString(@"好友邀请己发送，请耐心等待对方接受", nil);
            break;
        }case WSResultDuplicateSubmit:{
            alertTitle = NSLocalizedString(@"提示", nil);
            alertMessage = NSLocalizedString(@"数据重复发送", nil);
            break;
        }case WSResultSQLException:{
            alertTitle = NSLocalizedString(@"提示", nil);
            alertMessage = NSLocalizedString(@"数据库错误", nil);
            break;
        }case WSResultPhoneNotRegistered:{
            alertTitle = NSLocalizedString(@"提示", nil);
            alertMessage = NSLocalizedString(@"手机号未注册", nil);
            break;
        }case WSResultFriendInviteAlreadyFriend:{
            alertTitle = NSLocalizedString(@"提示", nil);
            alertMessage = NSLocalizedString(@"已达到最大邀请数", nil);
            break;
        }case WSResultSnsDuplicatePriase:{
//            alertTitle = NSLocalizedString(@"错误", nil);
//            alertMessage = NSLocalizedString(@"加赞", nil);
            break;
        }case WSResultFriendInviteMe:{
            alertTitle = NSLocalizedString(@"提示", nil);
            alertMessage = NSLocalizedString(@"不能向自己发送邀请", nil);
            break;
        }case WSResultFriendHadInThisFriendLabel:{
            alertTitle=NSLocalizedString(@"提示", nil);
            alertMessage=NSLocalizedString(@"该好友已在此标签内", nil);
            break;
        }
        case WSResultFriendInviteAlreadyIsFriend:{
            alertTitle=NSLocalizedString(@"提示", nil);
            alertMessage=NSLocalizedString(@"已经是好友", nil);
            break;
        }
        case WSResultPayFail:{
            alertTitle=NSLocalizedString(@"提示", nil);
            alertMessage=NSLocalizedString(@"支付失败", nil);
            break;
        }
        default:{
            NSLog(@"未处理的错误代码 code = %d", (int)errorCode);
            alertTitle = NSLocalizedString(@"提示", nil);
            alertMessage = [NSString stringWithFormat:NSLocalizedString(@"非常抱歉，遇到了未知错误，请稍后再试！error code = %u", nil), errorCode] ;
            break;
        }
            
            break;
    }
    
    [self alertWithTitle:alertTitle message:alertMessage];
}

+ (void) alertWithNetworkError{
    [self alertWithMessage:@"网络故障。"];
}

+ (void) alertWithStoreError:(NSError *)error{
    switch (error.code) {
        case SKErrorPaymentCancelled:
            [self alertWithMessage:@"取消交易"];
            break;
        default:
            [self alertWithMessage:@"购买失败"];
            break;
            
    }
}
@end

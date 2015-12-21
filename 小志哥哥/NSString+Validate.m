//
//  NSString+Validate.m
//  YouMe
//
//  Created by Kirinrin on 14/9/22.
//  Copyright (c) 2014年 suplus. All rights reserved.
//

#import "NSString+Validate.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Validate)
-(BOOL)isNoChinaPassword{
    //非中文 正则，如果返回时false ，则不含中文
    NSString* password=@"[\u4e00-\u9fa5]+";
    NSPredicate* passwordText=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",password];
    return [passwordText evaluateWithObject:self];
}
-(BOOL)isNumberOrEnglishOrCode{
    //字母数字 下划线等等 如果返回 true 则正确
    NSString* password=@"(^[0-9]\\d*$)|(^[a-zA-Z]+$)";
    NSPredicate* passwordText=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",password];
    return [passwordText evaluateWithObject:self];
}
-(BOOL)isPhoneNumber{
    NSString *regex =@"(13[0-9]|0[1-9]|0[1-9][0-9]|0[1-9][0-9][0-9]|15[0-9]|18[02356789])\\d{8}";
    NSPredicate *mobileTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [mobileTest evaluateWithObject:self];
}
-(BOOL)isMobilePhoneNumber;{
    //手机号以13， 15，18, 17开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9])|(17[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    //    NSLog(@"phoneTest is %@",phoneTest);
    return [phoneTest evaluateWithObject:self];
}
-(BOOL)isEmail{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

-(NSString *)md5LowCase {
    if (self == nil) {
        return [NSString stringWithFormat:@""];
    }else{
        const char *cStr = [self UTF8String];
        unsigned char digest[CC_MD5_DIGEST_LENGTH];
        CC_MD5( cStr, (CC_LONG)strlen(cStr), digest );
        NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
        for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
            [result appendFormat:@"%02x", digest[i]];
        return result;
    }
    
}
@end

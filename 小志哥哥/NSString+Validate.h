//
//  NSString+Validate.h
//  YouMe
//
//  Created by Kirinrin on 14/9/22.
//  Copyright (c) 2014年 suplus. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, FCError)
{
    FCErrorInvaildLength,
    FCErrorInvaildFormat,
    FCErrorInvaildPassword,
    FCErrorInvaildPhoneNumber,
};

@interface NSString (Validate)
/**
 * 只要匹配结果是false就是非中文。
 * @param
 *
 * @return
 *     BOOL
 */
-(BOOL)isNoChinaPassword;
/**
 * 匹配是否是英文或数字。
 * @param
 *
 * @return
 *     BOOL (^[0-9]\\d*$)|(^[a-zA-Z]+$)
 */
-(BOOL)isNumberOrEnglishOrCode;
-(BOOL)isPhoneNumber;
-(BOOL)isMobilePhoneNumber;
-(BOOL)isEmail;
-(NSString *)md5LowCase ;
@end

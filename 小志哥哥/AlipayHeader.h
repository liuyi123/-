//
//  AlipayHeader.h
//  IntegratedAlipay
//
//  Created by Winann on 15/1/9.
//  Copyright (c) 2015年 Winann. All rights reserved.
//

/**
 *  1. 将本工程中的IntegratedAlipay文件夹导入工程中，记得选copy；
 *  2. 点击项目名称,点击“Build Settings”选项卡,在搜索框中,以关键字“search” 搜索,对“Header Search Paths”增加头文件路径:“$(SRCROOT)/项目名称/IntegratedAlipay/AlipayFiles”（注意：不包括引号，如果不是放到项目根目录下，请在项目名称后面加上相应的目录名）；
 *  3. 点击项目名称,点击“Build Phases”选项卡,在“Link Binary with Librarles” 选项中,新增“AlipaySDK.framework”和“SystemConfiguration.framework” 两个系统库文件。如果项目中已有这两个库文件,可不必再增加；
 *  4. 在本头文件中设置kPartnerID、kSellerAccount、kNotifyURL、kAppScheme和kPrivateKey的值（所有的值在支付宝回复的邮件里面：注意，建议除appScheme以外的字段都从服务器请求）；
 *  5. 点击项目名称,点击“Info”选项卡，在URL types里面添加一项，Identifier可以不填，URL schemes必须和appScheme的值相同，用于支付宝处理回到应用的事件；
 *  6. 在需要用的地方导入“AlipayHeader.h”，并使用“[AlipayRequestConfig alipayWithPartner:...”方法进行支付；
 *  7. 在AppDelegate中处理事件回调（可直接复制下面内容）：
 - (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
 //如果极简 SDK 不可用,会跳转支付宝钱包进行支付,需要将支付宝钱包的支付结果回传给 SDK if ([url.host isEqualToString:@"safepay"]) {
 [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
 NSLog(@"result = %@",resultDic);
 }];
 if ([url.host isEqualToString:@"platformapi"]){//支付宝钱包快登授权返回 authCode
 [[AlipaySDK defaultService] processAuthResult:url standbyCallback:^(NSDictionary *resultDic) {
 NSLog(@"result = %@",resultDic);
 }];
 }
 return YES;
 }
 */

#ifndef IntegratedAlipay_AlipayHeader_h
#define IntegratedAlipay_AlipayHeader_h


#import <AlipaySDK/AlipaySDK.h>     // 导入AlipaySDK     // 导入支付类
#import "Order.h"                   // 导入订单类
#import "DataSigner.h"              // 生成signer的类：获取私钥并将商户信息签名,外部商户可以根据情况存放私钥和签名,只需要遵循 RSA 签名规范, 并将签名字符串 base64 编码和 UrlEncode

#import <Foundation/Foundation.h>   // 导入Foundation，防止某些类出现类似：“Cannot find interface declaration for 'NSObject', superclass of 'Base64'”的错误提示


/**
 *  partner:合作身份者ID,以 2088 开头由 16 位纯数字组成的字符串。
 *
 */
#define kPartnerID @"2088611090656741"


/**
 *  seller:支付宝收款账号,手机号码或邮箱格式。
 */
#define kSellerAccount @"haitaoshou@126.com"

/**
 *  支付宝服务器主动通知商户 网站里指定的页面 http 路径。
 */
#define kNotifyURL @"http://115.28.93.67:8080/index.php/Notify/Alipay/"


/**
 *  appSckeme:应用注册scheme,在Info.plist定义URLtypes，处理支付宝回调
 */
#define kAppScheme @"yao"


/**
 *  private_key:商户方的私钥,pkcs8 格式。
 */
#define kPrivateKey @"MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAL3NoMQzFv6EVZDyxmJD2Sr7K19PAD8u/Zh6CyfU9deIoJ0mXd9UCvHE4taczPm5yHdNeBhH6HRpIWtJchWUgLuo4OI0se7FNeWqvrx+ad5ICTqlBCXQkIau7sE7tQ58QZ31o0W5H9nelB+EgT/5nTSHVRIqYFdcUrxoAopcdmKJAgMBAAECgYBSgTgJEUxFhrDLOT0TKfsUu+m2nFi3Hm4OAb8nqWLUNgfbR/o2Qgof3j3cnHxdcWy6r2os49UgBTMJt/tndg4exTO2qoTCyvkdkrZJoqsFuvB9oCVgDAZBWTP7vjxTmF6RTA6AV3X4wfzMmpmDb5/2CdGlyZitnuiyO5xKw1Q/IQJBAOEi9skRXEfjS7oGo7eNy75WcReBMaQsMRlTSSxq5NAc7IcDMNn8diRvVJt77kExDu9olIB/VdnVN5FN1erSHvsCQQDX0qk5xteBmdbeWj3KoMJ4iF3/7u5EDxiy0Y7Byq99QG14+rH4K8x4miEu/JD5KixDYlJtuIn144U7OKMxmL1LAkEA2PbPCdqXKhhcRDxdzmjyLs4zUsmIw4RrFNL0s7+YHw+gykRC8fChEl/QE7+NTnouwH3yjxsn6zPVx0xRmWlBvQJAXWPsFHNFt/Ag+XClQnRUEqI3wtLaSZsave5OTu9tBs8FUA9zSYdyYFGZwGJMPXWRV8tJDe+Hy14bveehPonwhwJBAIXbNpfOXaqfCHrogaq7ZXf7pjW8J33L7JK8x01fGI9Znhfn2lnpLIBj9WV6WUCPiltBbDmKwyE+J46zS3iY8qI="


#endif

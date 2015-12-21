//
//  CommonDefine.h
//  YouMe
//
//  Created by Kirinrin on 14/9/25.
//  Copyright (c) 2014年 suplus. All rights reserved.
//

#ifndef YouMe_CommonDefine_h
#define YouMe_CommonDefine_h
#define USER_PASSWOERD @"password"
#define USER_ACCOUNT @"phone"
//颜色相关
#define RGBACOLOR16(rgbValue, a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define DEFAULT_BLUE    [UIColor colorWithRed:56/255.0 green:192/255.0 blue: 254/255.0 alpha:1.0]
#define TABBAR_BGCOLOR RGBACOLOR16(0xf8f8f8, 1)
#define tintBlue RGBACOLOR16(0x007efe, 1)
//由角度获取弧度 有弧度获取角度
#define degreesToRadian(x) (M_PI * (x) / 180.0)
#define radianToDegrees(radian) (radian*180.0)/(M_PI)
//屏幕大小
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define SCREEN_BOUNDS [UIScreen mainScreen].bounds
//设备判别
#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
#define IS_IPHONE_6 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )667 ) < DBL_EPSILON )
#define IS_IPHONE_6P ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )736 ) < DBL_EPSILON )

//OS版本
#define iOS7 [[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0
#define iOS8 [[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0
#define iOS9 [[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0

#define BADGE_FONT [UIFont fontWithName:@".HelveticaNeueInterface-Regular" size:13]

//#ifdef DEBUG
#define NSLog(fmt, ...) do{ NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);}while(0)
//#else
//#define NSLog(fmt, ...) do{ NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);}while(0)
//#define NSLog(...)  do{}while(0)
//#endif


//收到通知小圆点用
#define HaveNewMessage  @"HaveNewMessage"


#define DataBaseName    @"MyDatabase.db"


/////////////////////////////////////////////////////////
////////////////切换版本注意事项////////////////////////
//1.更改下面 IsPJ_Version ,普及为1,富力为0
//2.打开或注释对象版本的接口地址
//3.切换正式版和测试版接口
/////////////////////////////////////////////////////////
#define IsPJ_Version 1


/*
 AppKey：pujihome
 AppSecret： 997F46E4F789D96E3300B66C8C2EEC6
 */

#define PJAPPKEY        @"pujihome"
#define PJAPPSECRET     @"997F46E4F789D96E3300B66C8C2EEC67"

#define FLAPPKEY        @"pujihome"
#define FLAPPSECRET     @"997F46E4F789D96E3300B66C8C2EEC67"

//<<<<<<<<<<<<<   正式 测试切换 4    >>>>>>>>>>>>>>>>>>>>>>
//普及正式接口

//#define RequestURL @"http://pujihome.pujiapp.com/interface/newpad.php"
//#define IMGSERVERURL @"http://pujihome.pujiapp.com/service/newpad/app/upload.app.php?model=1"
//普及测试版接口地址
#define RequestURL @"http://interfacetest.pujiapp.com/newpad.php"
#define IMGSERVERURL @"http://interfacetest.pujiapp.com/service/newpad/app/upload.app.php?model=1"


//富力接口
//#define RequestURL @"http://fulihome.pujiapp.com/interface/newpad.php"
///#define IMGSERVERURL  @"http://fulihome.pujiapp.com/interface/service/newpad/app/upload.app.php?model=1"
/////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////


////微信支付
////普及

#define APP_ID_PJ           @"wx5f8d3cc6f8572afe"               //APPID
#define APP_REG_DESC_PJ     @"PJ"
#define MCHID_PJ            @"1265894301"
#define PARTNERID_PJ        @"bZvZqaMwfnrmXaA1SoeGjxzM5fP3amWn"

//富力
#define APP_ID_FL          @"wxa3e8e5b4681ae6ee"               //APPID
#define APP_REG_DESC_FL    @"FL"
#define MCHID_FL            @"1265895701"
#define PARTNERID_FL        @"FULI58d69wstiwlspa54782setpf962t"


//支付结果回调页面


//版本共用 <<<<<<<<<<<<<   正式 测试切换 3    >>>>>>>>>>>>>>>>>>>>>>
//测试接口
#define PJWXPayUrl          @"http://interfacetest.pujiapp.com/weixin/weixin/example/native_notify.php"   //预支付
#define FLWXPayUrl          @"http://interfacetest.fuliapp.com/weixin/weixin/example/native_notify.php"   //预支付
#define PJNOTIFY_URL        @"http://interfacetest.pujiapp.com/weixin/notify.php"   //支付回调
#define FLNOTIFY_URL        @"http://interfacetest.fuliapp.com/weixin/notify.php"   //支付回调

//正式接口
//#define PJWXPayUrl          @"http://pujihome.pujiapp.com/interface/weixin/weixin/example/native_notify.php"
//#define FLWXPayUrl          @"http://fulihome.pujiapp.com/interface/weixin/weixin/example/native_notify.php"
//#define PJNOTIFY_URL        @"http://pujihome.pujiapp.com/interface/weixin/notify.php"
//#define FLNOTIFY_URL        @"http://fulihome.pujiapp.com/interface/weixin/notify.php"


#define NotifyActionKey   @"NotifyAction"



//支付宝-----
#define PARTNER         @"2088911657933868"
#define SELLER          @"pujilife@126.com"
#define PARIVATEKDY     @"MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAMaOkriQJ6XdrdvMD4cqXWHAaNOle+p0mD4HiCGBAmLDvLZrehKwrsksgchuWllJZKg3yXzq/TzbCAZGT2FFCoqHmc1YGCNzGpJlDKwv37IOlKRH4UsNwe5PY4O9w3Q6QIDUMiNPxLyXOBqyv5h3EiGG6DHMyGNaxYQfq5pEZnD3AgMBAAECgYAekdDRDZCtHsYnsvEpFEKwTBlXjIDZhf3yfuJcliox3oTtaPqwafdfDbUlkKfkW0JeC8i/rMY0WlyP6r9J8IFAsUDsBXRchR8DF6sBNlN7+rnHWegPq2QOhHw0/xuQosqcLMLWg4C8pb73BrxPON+PnTQzQUtKTMdimFxgxoOLQQJBAO0h/oVM0gFB70GodJLso9DDK0uERqE7ekOFuoZxBx3yiazXVwPCTgDvoD15at4mwn4rTqWBgrDINr/4XT0yB6cCQQDWWtoUMVAWeCs27Ni9dU5TL/RmyXdsE1Gt7A7aco2gw4NfmnLT60oKI9J0YKrNRELaKQJ5kZUBBbDWUDWY1HYxAkEA4WFq+KUgAIP7dAs46SAzPssRDlBllP7j4ONsejVZT1RjGDz/fhoia29VfLg3I3fxaVud/15NqdpRdzoG3I/9hwJBAJug7sDGZN1LdiS0pVA4wRtIr+uIznnbNOxPfSFBFm7oRJO+8SvHosPl6kCwhpHtw5PdPnzBJCvP0+pl5eQGLaECQG+Heq2sXqyZ6BEnoyXAhTBCDyyXq3iJkrOFx6sFKoR6lxjuh5TeQzPDdSMCdULL84W1EUBu9YkJOgYlhSSgJXk="
//测试版
#define PJPAYNOTIFY       @"http://interfacetest.pujiapp.com/alipay/notify.php"
#define FLPAYNOTIFY       @"http://interfacetest.fuliapp.com/interface/alipay/notify.php"

//<<<<<<<<<<<<<   正式 测试切换  2   >>>>>>>>>>>>>>>>>>>>>>

//正式版
//#define PJPAYNOTIFY       @"http://pujihome.pujiapp.com/interface/alipay/notify.php"
//#define FLPAYNOTIFY       @"http://fulihome.fuliapp.com/interface/alipay/notify.php"





//普及e家 百度地图key
#define KBaiduKey_PJ        @"HGvuU1WR9yPyBFNZGkoUhisM"
//富力e家 百度地图key
#define KBaiduKey_FL      @"otCNBY7rzcr2yQDKUZ5EsV4w"



//<<<<<<<<<<<<<   正式 测试切换  1 下面没了  >>>>>>>>>>>>>>>>>>>>>>

//个推    普及测试证书
#define pkAppId           @"imKnlv0YNr6S2xlVduDpc9"
#define pkAppKey          @"p0YDcCK5GaAdQnyYT8Pi38"
#define pkAppSecret       @"fquSZxqkKV89tmMR8lbDm6"

//普及e家 个推
//#define pkAppId           @"9E5uGw3PM6AJvL89JXRo79"
//#define pkAppKey          @"LMSNrhevsS8nzhqBnUOpJ"
//#define pkAppSecret       @"LW16IOJoTC8QX8WGNIQHV3"

//富力e家  个推
#define fkAppId           @"iMahVVxurw6BNr7XSn9EF2"
#define fkAppKey          @"yIPfqwq6OMAPp6dkqgLpG5"
#define fkAppSecret       @"G0aBqAD6t79JfzTB6Z5lo5"

//页面类型
typedef enum
{
    GB,                 //精品团购
    MYGB,               //我的团购
    YO_GA,              //瑜伽
    MYRS,               //我的预约 烹饪
    GOUWU,              //购物预约列表
    YOGA,               //预约 瑜伽
    XIYI,               //洗衣服务
    QIPAISHI,           //棋牌室
}ViewType;

#endif



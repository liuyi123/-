//
//  CCRequest.h
//  YouMe
//
//  Created by ChenLiyuan on 14-12-2.
//  Copyright (c) 2014年 suplus. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AFHTTPRequestOperationManager;
//URL
//#define RequestURL @"http://172.16.1.50/interface/newpad.php"






//京东到家
#define JDURL @"http://pdj.jd.com/html/index.html?channel=fulidichan&hideapp"

//装饰装修

#define DecorationURL  @"http://wen-du.com/m"

//18801488382 1234567
//Method
#define METHOD      @"Method"
#define HOUSESLIST  @"houses.list"
#define LOGIN       @"login.login"



typedef void (^CallBack) (id obj);

@class EMGroup;
@interface CCRequest : NSObject
+(instancetype)shareCCRequest;
-(void)ccPostRequest:(NSString *)urlString andParameters:(NSDictionary*)parameters andCallBack:(CallBack)callBack;
-(void)postRequestWithdParameters:(NSDictionary *)parameters andCallBack:(CallBack)callback;
-(void)postRequestWithdParameters:(NSDictionary *)parameters andCallBack:(CallBack)callback andErrorHandle:(void (^)(NSError* error))handle;


//异步获取时间戳
-(void)getSystemTimestampAsyncWithCallBack:(CallBack)callBack;

//获取楼盘信息
-(void)getCommunityInfoWithCallBack:(CallBack)callback;

//获取楼盘地址
-(void)getCommunityAddress:(CallBack)complete;

//获取PM
-(void)getPM:(CallBack)complete;

//注册
-(void)userRegWithName:(NSString*)userName andPwd:(NSString*)pwd andHousesId:(NSString*)hid andCallBack:(CallBack)callback;

//登陆
-(void)loginWithName:(NSString*)userName andPwd:(NSString*)pwd andHousesID:(NSString*)hid andCallBack:(CallBack)complete;

//获取请求对象
-(AFHTTPRequestOperationManager*)getManager;

//基础请求方法
-(void)ccRequestPostRequestWithdParameters:(NSDictionary*)parameters andCallBack:(CallBack)callback;

//基础请求方法
-(void)testccRequestPostRequestWithdParameters:(NSDictionary*)parameters andCallBack:(CallBack)callback;


//用户注册调用
-(void)userRegWithdParameters:(NSDictionary*)parameters andCallBack:(CallBack)callback;


//发送透传消息，当群组成员发生变化时候可调用此方法
+(void)sendCmdMessageWith:(EMGroup*)group;


//基础请求方法
-(void)postRequestWithdParameters:(NSDictionary*)parameters andCallBack:(CallBack)callback;


////=============本地文件读写====================================

/*! @brief 写入数据到文档目录中
 *
 * @obj 要写入的数据。
 * @obj key。
 */
-(BOOL)writeDataToLocalFileDocuments:(NSObject*)obj andKey:(NSString*)key;

/*! @brief 从本地 文档 目录中获取数据
 *
 *  @key key。
 */
-(NSObject*)getLocalDataAndKey:(NSString*)key;


/*! @brief 写入数据到UserDefaults中
 *
 * @obj 要写入的数据。
 * @obj key。
 */
-(void)writeDataToUserDef:(NSObject*)obj andkey:(NSString*)key;


/*! @brief 为对象数组排序，仅仅可使用一个条件排序
 *
 * @datas 要写入的数据。
 * @key 排序条件对象的名称。
 * @ascending 是否为升序。
 */
-(void)dataSortWithDatas:(NSMutableArray*)datas andKey:(NSString*)key andAscending:(BOOL)ascending;


/*! 
 @ 集成下拉刷新空控件调用的网络请求方法
*/
-(void)refreshingTestccRequestPostRequestWithdParameters:(NSDictionary*)parameters andCallBack:(CallBack)callback;
/*!
 @ 带有提示信息和锁定btn按钮的网络请求方法
 */

//-(void)haveTipsRequestPostRequestWithButton:(UIButton*)btn andParameters:(NSDictionary*)parameters andCallBack:(CallBack)callback;

/**
 @邻里圈喜欢 回复 举报方法
 */
-(void)forumTestccRequestPostRequestWithdParameters:(NSDictionary*)parameters andCallBack:(CallBack)callback;

/*! @brief 上传文件到服务器
 *
 * @data 要写入的数据。
 * @return 文件路径。
 */
+(NSDictionary*)sendSyncUploadImageToServerWtihData:(NSData*)data;

/*! @brief 上传文件到服务器
 *
 * @data 要写入的数据。
 * @return 文件路径。
 */
+(NSString*)sendSycnUpLoadImagesToServerWithDatas:(NSArray*)datas;

+(void)sendAsycnUpLoadImagesToServerWithDatas:(NSArray*)datas andCallBack:(CallBack)callback;

/*!
 *
 *@callback @{Pic,ThumbnailPath}
 */
+(void)sendGCDAsycnUpLoadImagesToServerWithDatas:(NSArray*)datas andCallBack:(CallBack)callback;

/*! @brief 将在线支付方式字符串转换为数组
 *
 * @methods 要写入的数据。
 * @return 结果。
 */
+(NSArray*)ergodicMethods:(NSString*)methods;
+(NSArray*)ergodicMethods:(NSString*)methods andDeleave:(NSString*)deleave;


/*! @brief getSign @{TimeStamp,AppKey,Sign}
 *
 * @methods 要写入的数据。
 * @return 结果。
 */
+(NSDictionary*)getSign;


/*! @brief 根据传入日期和格式返回字符
 *
 * @date    要写入的数据。
 * @format  格式
 * @return  字符串。
 */
+(NSString*)getDateStringWith:(NSDate*)date andFormat:(NSString*)format;

+(NSDate*)getDateWithString:(NSString*)dateStr andFormat:(NSString*)format;
@end







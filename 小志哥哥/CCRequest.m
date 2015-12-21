//
//  CCRequest.m
//  YouMe
//
//  Created by ChenLiyuan on 14-12-2.
//  Copyright (c) 2014年 suplus. All rights reserved.
//

#import "CCRequest.h"
#import "AppDelegate.h"
#import "AFNetworking.h"
#import "UIAlertView+Kirinrin.h"
#import "JSONKit.h"
#import "NSString+Validate.h"
#import <CommonCrypto/CommonDigest.h>
#import <UIKit/UIKit.h>
#import "CCUploadFile.h"
#import "CommonDefine.h"
#import "KVNProgress.h"



#define ChatCommandDef @"GroupMembersAlteration"

@interface CCRequest ()
@property(nonatomic,strong)UIView* waitView;

@end

static CCRequest* request;
@implementation CCRequest

+(instancetype)shareCCRequest
{
    if (request == nil) {
        request = [[CCRequest alloc] init];
        
        
        //等待视图
        request.waitView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 180, 100)];
        request.waitView.layer.masksToBounds = YES;
        request.waitView.layer.cornerRadius = 5;
        request.waitView.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2);
        request.waitView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        UIActivityIndicatorView* chrysanthemum = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [chrysanthemum startAnimating];
        chrysanthemum.center = CGPointMake(request.waitView.frame.size.width/2, request.waitView.frame.size.height/2);
        [request.waitView addSubview:chrysanthemum];
        
    }
    return request;
}

-(void)getSystemTimestampAsyncWithCallBack:(CallBack)callBack
{
    AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST:RequestURL parameters:@{@"Method":@"login.time"}success:^(AFHTTPRequestOperation *operation, id responseObject) {
//          NSLog(@"成功：%@",[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
//          NSLog(@"%@", [self bySecondGetDate:[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]]);
          callBack([self bySecondGetDate:[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]]);
        
      } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
          NSLog(@"---%@",error);
      }];
}

-(void)getSystemTimestampASync:(CallBack)callBack
{
    AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST:RequestURL parameters:@{METHOD:@"login.time"}success:^(AFHTTPRequestOperation *operation, id responseObject) {
        callBack(responseObject);
        NSLog(@"operation:%@-responseObject:%@",operation,responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    }];
}

- (NSString *)bySecondGetDate:(NSString *)second{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy年MM月dd日 HH:mm:ss"];
    NSString *dateLoca = [NSString stringWithFormat:@"%@",second];
    NSTimeInterval time=[dateLoca doubleValue];
    NSDate *detaildate=[NSDate dateWithTimeIntervalSince1970:time];
    NSString *timestr = [formatter stringFromDate:detaildate];
    return timestr;
}




//获取楼盘信息
-(void)getCommunityInfoWithCallBack:(CallBack)callback
{
    [self ccRequestPostRequestWithdParameters:@{METHOD:HOUSESLIST} andCallBack:callback];
}

-(void)getPM:(CallBack)complete
{
    [self ccRequestPostRequestWithdParameters:@{METHOD:@"tool.pm"} andCallBack:complete];
}

//这个不能用
-(void)getCommunityAddress:(CallBack)complete
{
    //[self ccRequestPostRequestWithdParameters:@{METHOD:@"houses.address"} andCallBack:complete];
}




//注册
-(void)userRegWithName:(NSString*)userName andPwd:(NSString*)pwd andHousesId:(NSString*)hid andCallBack:(CallBack)callback
{
    //后台未实现
}

//登陆
-(void)loginWithName:(NSString*)userName andPwd:(NSString*)pwd andHousesID:(NSString *)hid andCallBack:(CallBack)complete
{
    //userName = @"yanshiban";
    //pwd = @"123456";
    
    
    
    
    
    [self getSystemTimestampASync:^(id obj) {
        
        NSString* timeStamp = [[NSString alloc] initWithData:obj encoding:NSUTF8StringEncoding];
        NSString* password = [NSString stringWithFormat:@"%@&%@",[pwd md5LowCase],timeStamp];
        NSDictionary* dic = @{METHOD:LOGIN,
                              @"UserName":userName,
                              @"Password":[password md5LowCase],
                              @"TimeStamp":timeStamp,
                              @"ClientID":[AppDelegate instance].getuiCid?[AppDelegate instance].getuiCid:@"",
                              @"Type":@"2",
                              @"HousesID":hid};
        [self ccRequestPostRequestWithdParameters:dic andCallBack:^(id obj) {
            complete(obj );
        }];
    }];
}


-(void)login
{
    AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
}


-(void)ccPostRequest:(NSString *)urlString andParameters:(NSDictionary *)parameters andCallBack:(CallBack)callBack
{
    AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager POST:urlString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        callBack(responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //[UIAlertView alertWithMessage:error.description];
    }];
}


//基础请求方法l
-(void)ccRequestPostRequestWithdParameters:(NSDictionary*)parameters andCallBack:(CallBack)callback
{
    
    UIView* waitView = [[UIView alloc]initWithFrame:[UIApplication sharedApplication].keyWindow.frame];
    waitView.center = [UIApplication sharedApplication].keyWindow.center;
    waitView.alpha = .5f;
    waitView.backgroundColor = [UIColor blackColor];
    [[UIApplication sharedApplication].keyWindow addSubview:waitView];
    
    UIActivityIndicatorView* indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [indicator startAnimating];
    indicator.center = [UIApplication sharedApplication].keyWindow.center;
    [[UIApplication sharedApplication].keyWindow addSubview:indicator];
    
    
    [[self getManager] POST:RequestURL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        [indicator stopAnimating];
        [indicator removeFromSuperview];
        [waitView removeFromSuperview];
        
        //NSString* str = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        
       // NSLog(@"responseObject:%@",parameters);
        
        NSDictionary* dic = [responseObject objectFromJSONData];
        
        ///NSLog(@"－－－－－－%@",dic);
        
        if (dic) {
            if ([dic[@"Status"] intValue] != 0 && [dic[@"Msg"] isEqualToString:@"请求成功"]  ) {
                //NSLog(@"%@",dic);
                
                callback(dic[@"Data"]);
            }
            else
            {
                //[UIAlertView alertWithMessage:dic[@"Msg"]];
            }
        }else
        {
            if([parameters[@"Method"]isEqualToString:@"login.login"]){
            [UIAlertView alertWithMessage:@"用户名或密码错误"];
        
            }else{
            [UIAlertView alertWithMessage:@"未返回正确数据,数据接口故障"];
            }
            
            
        }
        

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //[UIAlertView alertWithMessage:error.description];
        [indicator stopAnimating];
        [indicator removeFromSuperview];
        [waitView removeFromSuperview];
        NSLog(@"%@",error);
    }];
}
/**
 @邻里圈喜欢 回复 举报方法
 */
-(void)forumTestccRequestPostRequestWithdParameters:(NSDictionary*)parameters andCallBack:(CallBack)callback
{
    [[self getManager] POST:RequestURL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary* dic = [responseObject objectFromJSONData];
        if ([dic[@"Msg"] isEqualToString:@"请求成功"]) {
            callback(dic[@"Data"]);
        }
        else
        {
            //[UIAlertView alertWithMessage:dic[@"Msg"]];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    //[UIAlertView alertWithMessage:error.description];

    }];
}
////带提示信息的基础请求方法
//-(void)haveTipsRequestPostRequestWithButton:(UIButton*)btn andParameters:(NSDictionary*)parameters andCallBack:(CallBack)callback{
//    [CCRequest beginRequestAndPostNotification];
//    
//    [[self getManager] POST:RequestURL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
//         NSDictionary* dic = [responseObject objectFromJSONData];
//        
//        
//        if (dic) {
//            if ([dic[@"Status"] intValue] != 0 && [dic[@"Msg"] isEqualToString:@"请求成功"]  ) {
//                
//                callback(dic[@"Data"]);
//            }
//            else
//            {
//             btn.enabled=YES;
//             [UIAlertView alertWithMessage:dic[@"Msg"]];
//            }
//        }else
//        {
//            btn.enabled=YES;
//            [UIAlertView alertWithMessage:[NSString stringWithFormat:@"服务器运行时错误,数据未返回-(%@)",dic]];
//        }
//        [CCRequest fetchDataAndPostNotificationWithError:nil];
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//
//        [CCRequest fetchDataAndPostNotificationWithError:error];
//    }];
//    
//    
//}
//基础请求方法
-(void)testccRequestPostRequestWithdParameters:(NSDictionary*)parameters andCallBack:(CallBack)callback
{
    
    
    [CCRequest beginRequestAndPostNotification];
    
    [[self getManager] POST:RequestURL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"opernation: %@\nresponse: %@", operation, responseObject);
        
        NSDictionary* dic = [responseObject objectFromJSONData];
        
        
        if (dic) {
            if ([dic[@"Status"] intValue] != 0 && [dic[@"Msg"] isEqualToString:@"请求成功"]  ) {
                [CCRequest fetchDataAndPostNotificationWithError:nil];
                callback(dic[@"Data"]);
            }
            else
            {

               // [UIAlertView alertWithMessage:dic[@"Msg"]];
            }
        }else
        {
            // [UIAlertView alertWithMessage:[NSString stringWithFormat:@"服务器运行时错误,数据未返回-(%@)",dic]];
             [UIAlertView alertWithMessage:[NSString stringWithFormat:@"数据异常，请耐心等待"]];
        }
        
        //跟进订单提交,修改家政服务和预约服务
        
        
//        [waitView removeFromSuperview];
        
        [CCRequest fetchDataAndPostNotificationWithError:nil];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //[UIAlertView alertWithMessage:error.description];
        
        NSLog(@"%@",error);
        
//        [waitView removeFromSuperview];
        [CCRequest fetchDataAndPostNotificationWithError:error];
    }];
}
//下拉刷新的基础请求方法
-(void)refreshingTestccRequestPostRequestWithdParameters:(NSDictionary*)parameters andCallBack:(CallBack)callback
{
    [[self getManager] POST:RequestURL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary* dic = [responseObject objectFromJSONData];
        callback(dic);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //[UIAlertView alertWithMessage:error.description];
    }];
}
-(void)postRequestWithdParameters:(NSDictionary*)parameters  andCallBack:(CallBack)callback
{
    [self postRequestWithHUD:^{
        
        [KVNProgress showWithParameters:@{KVNProgressViewParameterStatus: @"Loading...",
                                          KVNProgressViewParameterBackgroundType: @(KVNProgressBackgroundTypeSolid),
                                          KVNProgressViewParameterFullScreen: KVNProgressViewParameterFullScreen}];
        
        
    } AndParameters:parameters andCallBack:^(id obj) {
        [KVNProgress dismiss];
        callback(obj);
    }andError:^{
        
        
        [KVNProgress dismiss];
        
        
    } ];
    
}



-(void)postRequestWithdParameters:(NSDictionary *)parameters andCallBack:(CallBack)callback andErrorHandle:(void (^)(NSError* error))handle
{
    
    [KVNProgress showWithParameters:@{KVNProgressViewParameterStatus: @"Loading...",
                                      KVNProgressViewParameterBackgroundType: @(KVNProgressBackgroundTypeSolid),
                                      KVNProgressViewParameterFullScreen: KVNProgressViewParameterFullScreen}];
    
    [[self getManager] POST:RequestURL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [KVNProgress dismiss];
        
        NSDictionary* dic = [responseObject objectFromJSONData];
        if (dic && [dic[@"Status"] intValue] != 0) {
            callback(dic[@"Data"]);
            
        }else
        {
            if (dic.count != 0) {
                NSError* error = [[NSError alloc]initWithDomain:dic[@"Msg"] code:[dic[@"Status"] integerValue]  userInfo:dic];
                handle(error);
            }
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [KVNProgress dismiss];
        NSLog(@"Request Error:%@",error);
        handle(error);
    }];
    
    
    
    
}


-(void)postRequestWithHUD:(void (^)(void))block AndParameters:(NSDictionary*)parameters  andCallBack:(CallBack)complete andError:(void (^)(void))errorBlock
{
    block();
    
    [[self getManager] POST:RequestURL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary* dic = [responseObject objectFromJSONData];
        if (dic && [dic[@"Status"] intValue] != 0) {
            complete(dic[@"Data"]);
            
        }else
        {
            [UIAlertView alertWithMessage:dic[@"Msg"]];
            errorBlock();
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
        errorBlock();
    }];
}


//用户注册方法
-(void)userRegWithdParameters:(NSDictionary*)parameters andCallBack:(CallBack)callback
{

    
    
    
    
    [[UIApplication sharedApplication].keyWindow addSubview:self.waitView];
    
    
    
    
    [[self getManager] POST:RequestURL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        [self.waitView removeFromSuperview];
        
        NSLog(@"%@",responseObject);
        
        callback(responseObject);

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //[UIAlertView alertWithMessage:error.description];
        [self.waitView removeFromSuperview];
    }];
}


//获取请求对象
-(AFHTTPRequestOperationManager*)getManager
{
    AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    return manager;
}


-(BOOL)writeDataToLocalFileDocuments:(NSObject*)obj andKey:(NSString*)key;
{
    NSMutableData* data = [NSMutableData data];
    NSKeyedArchiver* arc = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
    [arc encodeObject:obj forKey:key];
    [arc finishEncoding];
    
    NSString* documentsPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    
    NSString* filePath = [NSString stringWithFormat:@"%@/%@",documentsPath,key];
    
    
    return [data writeToFile:filePath atomically:YES];
    
}

-(NSObject*)getLocalDataAndKey:(NSString*)key
{
    NSString* documentsPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString* filePath = [NSString stringWithFormat:@"%@/%@",documentsPath,key];
    
    NSMutableData* data = [NSMutableData dataWithContentsOfFile:filePath];
    NSKeyedUnarchiver*  unarc = [[NSKeyedUnarchiver alloc]initForReadingWithData:data];
    NSObject* obj = [unarc decodeObjectForKey:key];
    
    return obj;
    
}

-(void)writeDataToUserDef:(NSObject*)obj andkey:(NSString*)key
{
    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:obj forKey:key];
    [ud synchronize];
    
    //NSString* name = [ud objectForKey:@"name"];
}

-(void)dataSortWithDatas:(NSMutableArray*)datas andKey:(NSString*)key andAscending:(BOOL)ascending;
{
    if (datas && datas.count>1) {
        NSSortDescriptor* descriptor = [[NSSortDescriptor alloc]initWithKey:key ascending:ascending];
        NSArray* descriptorArr = [NSArray arrayWithObjects:descriptor, nil];
        [datas sortUsingDescriptors:descriptorArr];
    }
    
}

+(NSDictionary*)sendSyncUploadImageToServerWtihData:(NSData*)data
{
    //传文件
    CCUploadFile* upload = [[CCUploadFile alloc]init];
    NSURL* url = [NSURL URLWithString:IMGSERVERURL];
    NSDictionary* result = [upload uploadSyncFileWithURL:url data:data];

    
    return result;
}



+(NSArray*)sendSycnUpLoadImagesToServerWithDatas:(NSArray*)datas
{
    

    
    
    NSMutableArray* paths= [NSMutableArray array];
    //NSDictionary* path;
    
    if (datas && datas.count>0) {
        for (UIImage* image in datas) {
            NSData* imgData =UIImageJPEGRepresentation(image, 0.5f);
            NSLog(@"ImageSize : %f M",imgData.length/(1024.0f*1024.0f));
            
            NSDictionary* imgServerPath = nil;
            while (!imgServerPath) {
                imgServerPath = [CCRequest sendSyncUploadImageToServerWtihData:imgData];
            }
            
            [paths addObject:imgServerPath];
            
        }
        
        
        
        
//        for (int i = 0; i<paths.count; i++) {
//            
//            if (i ==0) {
//                path = paths.firstObject;
//            }else
//            {
//                path = [path stringByAppendingString:[NSString stringWithFormat:@",%@",paths[i]]];
//            }
//        }
        
    }
    
    
    return paths;
}

+(void)sendGCDAsycnUpLoadImagesToServerWithDatas:(NSArray*)datas andCallBack:(CallBack)callback
{
    //[CCRequest  beginRequestAndPostNotification];
    
    UIView* waitView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    waitView.layer.masksToBounds = YES;
    //waitView.layer.cornerRadius = 5;
    
    waitView.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2);
    waitView.backgroundColor = [UIColor blackColor];
    waitView.alpha = .8f;
    UIActivityIndicatorView* chrysanthemum = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [chrysanthemum startAnimating];
    chrysanthemum.center = CGPointMake(waitView.frame.size.width/2, waitView.frame.size.height/2);
    
    
    [[UIApplication sharedApplication].keyWindow addSubview:waitView];
    [[UIApplication sharedApplication].keyWindow addSubview:chrysanthemum];
    
    
    
    //NSMutableArray* paths= [NSMutableArray array];
    
    
    //并行队列开始
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSDictionary* path;
        
        NSString* pic = @"";
        NSString* thumbnailPath = @"";
        
        if (datas && datas.count>0) {
            for (UIImage* image in datas) {
                NSData* imgData =UIImageJPEGRepresentation(image, 0.5f);
                NSLog(@"ImageSize : %f M",imgData.length/(1024.0f*1024.0f));
                
                NSDictionary* imgServerPath = nil;
                int time = 0;
                while (!imgServerPath) {
                    
                    if (time>2) {
                        break;
                    }
                    
                    time++;
                    imgServerPath = [CCRequest sendSyncUploadImageToServerWtihData:imgData];
                }
                //Pic,ThumbnailPath
                pic             = [pic stringByAppendingString:[NSString stringWithFormat:@",%@",imgServerPath[@"Pic"]]];
                thumbnailPath   = [thumbnailPath stringByAppendingString:[NSString stringWithFormat:@"%@,",imgServerPath[@"ThumbnailPath"]]];
            }
            
            if ([[pic substringWithRange:NSMakeRange(0, 1)] isEqualToString:@","]) {
                pic = [pic substringFromIndex:1];
            }
            
            if ([[thumbnailPath substringWithRange:NSMakeRange(0, 1)] isEqualToString:@","]) {
                thumbnailPath = [thumbnailPath substringFromIndex:1];
            }
            
            path = @{@"Pic":pic,
                     @"ThumbnailPath":thumbnailPath};
            
            
        }//并行队列结束
        
        //回主线程
        
        dispatch_async(dispatch_get_main_queue(), ^{
            //[CCRequest  fetchDataAndPostNotificationWithError:nil];
            
            [chrysanthemum removeFromSuperview];
            [waitView removeFromSuperview];
            
            callback(path);
            
        });
        
        
    });
    
    
    
    
    
}




+(void)beginRequestAndPostNotification
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"BeginRequest" object:nil userInfo:nil];
}

+(void)fetchDataAndPostNotificationWithError:(NSError*)error
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"FetchdData" object:error userInfo:nil];
}


+(void)sendAsycnUpLoadImagesToServerWithDatas:(NSArray*)datas andCallBack:(CallBack)callback
{
    
    NSMutableArray* paths= [NSMutableArray array];
    
    if (datas && datas.count>0) {
        CCUploadFile* upload = [[CCUploadFile alloc]init];
        NSURL* url = [NSURL URLWithString:IMGSERVERURL];
        
        for (UIImage* image in datas) {
            NSData* imgData =UIImageJPEGRepresentation(image, 0.5f);
            NSLog(@"ImageSize : %f M",imgData.length/(1024.0f*1024.0f));
            
            //传文件
            [upload uploadFileWithURL:url data:imgData andCallback:^(id obj) {
                [paths addObject:obj];
                
                //[CCRequest  beginRequestAndPostNotification];
                
                if (paths.count == datas.count) {
                    
                    NSString* path = @"";
                    for (int i = 0; i<paths.count; i++) {
                        
                        if (i ==0) {
                            path = paths.firstObject;
                        }else
                        {
                            path = [path stringByAppendingString:[NSString stringWithFormat:@",%@",paths[i]]];
                            
                        }

                       
                    }
                    
                    //[CCRequest  fetchDataAndPostNotificationWithError:nil];
                     callback(path);
                    
                }
            }];

        }
        
        
    }
    
    
    
}



//遍历支付方式，将字符串变成数组,剔除空字符
+(NSArray*)ergodicMethods:(NSString*)methods
{
    NSArray* source = [methods componentsSeparatedByString:@","];
    NSMutableArray* ms  = [NSMutableArray array];
    
    for (NSString* m in source) {
        
        if (m.length == 1) {
            [ms addObject:m];
        }
        
        
    }
    
    return [NSArray arrayWithArray:ms];
    
}

//遍历支付方式，将字符串变成数组,剔除空字符
+(NSArray*)ergodicMethods:(NSString*)methods andDeleave:(NSString*)deleave
{
    NSArray* source = [methods componentsSeparatedByString:deleave];
    NSMutableArray* ms  = [NSMutableArray array];
    
    for (NSString* m in source) {
        
        if (m.length == 1) {
            [ms addObject:m];
        }
        
        
    }
    
    return [NSArray arrayWithArray:ms];
    
}


+(NSDictionary*)getSign
{
    NSDateFormatter *dateformat=[[NSDateFormatter alloc]init];
    dateformat.dateFormat=@"yyyyMMddHHmmss";
    NSString* timeStamp = [dateformat stringFromDate:[NSDate date]];
    
    
    NSString* appSecret = @"";
    NSString* appKey = @"";
    
    
    if (IsPJ_Version) {
        appSecret = PJAPPSECRET;
        appKey = PJAPPKEY;
    }else
    {
        appSecret = FLAPPSECRET;
        appKey = FLAPPKEY;
    }
    
    NSString* tempStr = [NSString stringWithFormat:@"%@AppKey%@TimeStamp%@",appSecret,appKey,timeStamp];
    NSString* md5Str = [tempStr md5LowCase];
    NSString* md5StrBig = [md5Str uppercaseString];
    
    
    //NSLog(@"%@,%@",md5Str,md5StrBig);
    
    NSDictionary* dic = @{
        @"TimeStamp":timeStamp,
        @"AppKey":appKey,
        @"Sign":md5StrBig
        };
    
    return dic;
}



+(NSString*)getDateStringWith:(NSDate*)date andFormat:(NSString*)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    return [formatter stringFromDate:date];
}

+(NSDate*)getDateWithString:(NSString*)dateStr andFormat:(NSString*)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    //[formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    return [formatter dateFromString:dateStr];
}


@end


/*  Sign的请求示例
 //@{TimeStamp,AppKey,Sign}
 NSDictionary* signDic = [CCRequest getSign];
 NSString* HousesID = @"27";
 
 NSDictionary* dic = @{@"Method":@"groupb.getgroupblist",
 @"AppKey":signDic[@"AppKey"],
 @"TimeStamp":signDic[@"TimeStamp"],
 @"Sign":signDic[@"Sign"],
 @"HousesID":HousesID,
 @"Type":@"1",
 @"Page":@"1",
 @"PageNum":@"10"
 };
 
 NSLog(@"%@",dic);
 
 [[CCRequest shareCCRequest] postRequestWithdParameters:dic andCallBack:^(id obj) {
 NSLog(@"%@",obj);
 }];
 */




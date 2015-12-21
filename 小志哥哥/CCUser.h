//
//  CCUser.h
//  pujiguanjia
//
//  Created by 陈立远 on 15/4/22.
//  Copyright (c) 2015年 PUJI Network. All rights reserved.
//


//用户信息====

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    OWNER,  //业主
    FAMILY, //家人
    LESSEE, //租户
    NORMAL  //普通
} UserType;

@class CCHouse;
@class CCOrderUser;
@class CCCommunity;

@interface CCUser : NSObject

//安全信息
/*! @brief 访问令牌
 */
@property(nonatomic,copy)NSString* accessToken;



//================城市和楼盘================



/*! @brief 城市
 */
@property(nonatomic,copy)NSString* cityName;

/*! @brief 城市
 */
@property(nonatomic,copy)NSString* cityID;


/*! @brief 楼盘ID
 */
@property(nonatomic,copy)NSString* communityID;

/*! @brief 楼盘名称
 */
@property(nonatomic,copy)NSString* communityName;

/*! @brief 楼栋ID
 */
@property(nonatomic,copy)NSString* buildingID;

/*! @brief 楼栋名
 */
@property(nonatomic,copy)NSString* building;


/*! @brief 房间号
 */
@property(nonatomic,copy)NSString* room;
/*! @brief 房间ID
 */
@property(nonatomic,copy)NSString* roomID;



@property(nonatomic,strong)CCCommunity* community;



//================基础信息================

/*! @brief 用户编号-系统内
 */
@property(nonatomic,copy)NSString*  userID;

/*! @brief 用户名/登录名
 */
@property(nonatomic,copy)NSString*  userName;

/*! 真实姓名
 */
@property(nonatomic,copy)NSString* contact;

/*! @brief 昵称
 */
@property(nonatomic,copy)NSString*  nickName;

/*! @brief 联系电话
 */
@property(nonatomic,copy)NSString*  tel;

/*! @brief 地址
 */
@property(nonatomic,copy)NSString*  address;


/*! @brief 头像
 */
@property(nonatomic,copy)NSString*  head;

/*! @brief 类别 业主/普通用户
 */
@property(nonatomic,assign)UserType  type;

/*! @brief 是否已认证
 */
@property(nonatomic,assign)int  isAuthentication;


//================权限信息================

/*! @brief 物业菜单
 *
 */
@property(nonatomic,strong)NSMutableArray* wuyeMenus;

/*! @brief 生活菜单
 *
 */
@property(nonatomic,strong)NSMutableArray* lifeMenus;

/*! @brief 邻里圈
 *
 */
@property(nonatomic,strong)NSMutableArray* forumMenus;

/*! @brief 支持邻里圈
 *
 */
@property(nonatomic,assign)BOOL isForum;


/*! @brief 支持购物车
 *
 */
@property(nonatomic,assign)BOOL isShopCar;


/////////////////////////////////////

/*! @brief 固定联系电话
 */
@property(nonatomic,copy)NSString*  mobilePhone;

/*! @brief 最后一条公告ID
 */
@property(nonatomic,copy)NSString* lastNewsID;



/*! @brief 这个也不知道
 */
@property(nonatomic,copy)NSString* logo;

/*! @brief 这是什么
 */
@property(nonatomic,copy)NSString* appName;


/*! @brief 这个也没说明
 */
@property(nonatomic,copy)NSString* mobile;
//////////////////////////////////////////////////


/*! @brief 实例方法
 *
 * @param dic  请求回来的用户信息。
 * @return 对象。
 */
+(instancetype)createCCUserWithDic:(NSDictionary*)dic;


@end

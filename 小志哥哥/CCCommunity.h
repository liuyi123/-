//
//  CCCommunity.h
//  普及管家
//
//  Created by 陈立远 on 15/5/19.
//  Copyright (c) 2015年 PUJI Network. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CCCity;

@interface CCCommunity : NSObject <NSCoding>
//物业属性

/*! @brief 物业公司ID
 *
 */
@property(nonatomic,copy)NSString* housesCompanyID;

/*! @brief 物业公司名称
 *
 */
@property(nonatomic,copy)NSString* housesCompanyName;

/*! @brief 是否有电话中心
 *
 */
@property(nonatomic,assign)BOOL isCall;

/*! @brief 联系人
 *
 */
@property(nonatomic,copy)NSString* linkman;

/*! @brief 联系电话
 *
 */
@property(nonatomic,copy)NSString* tel;

/*! @brief 楼盘ID
 *
 */
@property(nonatomic,copy)NSString* cID;

/*! @brief 楼盘名称
 *
 */
@property(nonatomic,copy)NSString* name;

/*! @brief 地址
 *
 */
@property(nonatomic,copy)NSString* address;

/*! @brief 城市ID
 *
 */
@property(nonatomic,copy)NSString* cityId;

/*! @brief 城市名称
 *
 */
@property(nonatomic,copy)NSString* city;




/*! @brief 物业菜单
 *
 */
@property(nonatomic,strong)NSMutableArray* wuyeMenus;

/*! @brief 生活菜单
 *
 */
@property(nonatomic,strong)NSMutableArray* lifeMenus;

/*! @brief 社区菜单
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


+(instancetype)createCommunityWithDic:(NSDictionary*)dic;
+(instancetype)createCommunityWithCID:(NSString*)cId andCity:(NSString*)city andName:(NSString*)name andAddress:(NSString*)address;
@end



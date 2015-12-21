//
//  CCUser.m
//  pujiguanjia
//
//  Created by 陈立远 on 15/4/22.
//  Copyright (c) 2015年 PUJI Network. All rights reserved.
//

#import "CCUser.h"
#import "JSONKit.h"
#import "CCRequest.h"
#import "CCCommunity.h"

@implementation CCUser

#pragma mark Create Object
+(instancetype)createCCUserWithDic:(NSDictionary*)dic
{
    
    CCUser* user = [[CCUser alloc]init];
    if (user) {
        user.accessToken = dic[@"AccessToken"];
        user.address = dic[@"Address"];
        user.cityName =dic[@"CityName"];
        user.cityID = dic[@"CityID"];
        //暂时替代
        
        
        if ([user.cityName isKindOfClass:[NSNull class]]) {
            
            CCCommunity* community  = (CCCommunity*)[[CCRequest shareCCRequest] getLocalDataAndKey:@"Community"];
            if (community && community.city && community.cityId) {
                user.cityName = community.city;
                user.cityID = community.cityId;
            }else
            {
                user.cityName = @"北京";
                user.cityID = @"1";
            }
            
        }
        
        
        user.communityID = dic[@"HousesID"];
        user.communityName = dic[@"HousesName"];
        user.building = dic[@"BuildingName"];
        user.buildingID = dic[@"BuildingID"];
        user.room = dic[@"HouseNumberName"];
        user.roomID = dic[@"HouseNumberID"];
        
        user.userID = dic[@"UserID"];
        user.userName = dic[@"UserName"];
        user.contact = dic[@"Linkman"];
        user.mobile = dic[@"Mobile"];
        user.head = dic[@"PicturePath"];
        user.tel = dic[@"Tel"];
        NSString *valueStr=[dic[@"IsAuth"]isKindOfClass:[NSNull class]]?@"0":dic[@"IsAuth"];
        user.isAuthentication = [valueStr intValue];
        user.nickName = dic[@"Nickname"];
        
        //解析权限列表
        [user initUserPowerMenu:dic[@"CatePage"]];
        
        user.mobilePhone = dic[@"UserTel"];
        user.logo = dic[@"Logo"];
        user.lastNewsID = dic[@"LastNewsID"];
        
        
//        user.userName = dic[@""];
//        user.realName = dic[@""];
//        user.addressList= [CCUser convertDicToAddressList:dic];
//        
//        user.type = [dic[@""] intValue];
        
        return user;
    }
    
    return nil;
}



-(void)initUserPowerMenu:(NSArray*)catePage
{
    self.isForum = NO;
    self.isShopCar = NO;
    
    for (NSDictionary* dic in catePage) {
        if ([dic[@"AppTitle"] isEqualToString:@"物业"]) {
            self.wuyeMenus = [self getMenusWithArray:dic[@"Page"]];
            
        }else if ([dic[@"AppTitle"] isEqualToString:@"生活"])
        {
            self.lifeMenus = [self getMenusWithArray:dic[@"Page"]];
            
        }
        else if ([dic[@"AppTitle"] isEqualToString:@"邻里圈"])
        {
            self.isForum = YES;
            
        }else if ([dic[@"AppTitle"] isEqualToString:@"购物车"])
        {
            self.isShopCar = YES;
            
        }
    }
    
}

-(NSMutableArray*)getMenusWithArray:(NSArray*)page
{
    NSMutableArray* menus = [NSMutableArray array];
    for (NSDictionary* dic in page) {
        //[menus addObject:dic[@"AppName"]];
        [menus addObject:dic];
    }
    
    return menus;
}

//{"IsAuth":0,"UserID":"6594","BuildingID":"24","Linkman":"王萌萌","Tel":"010-88880000",
//"CatePage":[
//    {"PageID":"22","HousesPageID":"843","AppName":"wuye","AppTitle":"物业","Page":
//        [
//        {"AppName":"zhoubian","AppTitle":"周边快购","HousesPageID":"847"},
//        {"AppName":"homemaking","AppTitle":"家政服务","HousesPageID":"848"},
//        {"AppName":"deliver","AppTitle":"快送服务","HousesPageID":"849"},
//        {"AppName":"esjy","AppTitle":"二手交易","HousesPageID":"850"},
//        {"AppName":"fwzs","AppTitle":"房屋租售","HousesPageID":"851"},
//        {"AppName":"weixiu","AppTitle":"日常维修","HousesPageID":"855"},
//        {"AppName":"sfbz","AppTitle":"收费标准","HousesPageID":"858"},
//        {"AppName":"jiaofei","AppTitle":"账单缴费","HousesPageID":"859"}
//         ]
//    },
//    {"PageID":"23","HousesPageID":"844","AppName":"shenghuo","AppTitle":"生活","Page":
//        [
//        {"AppName":"fankui","AppTitle":"住户反馈","HousesPageID":"852"},
//        {"AppName":"louguan","AppTitle":"楼管信息","HousesPageID":"853"},
//        {"AppName":"dianhua","AppTitle":"便民电话","HousesPageID":"854"},
//        {"AppName":"baojian","AppTitle":"保健按摩","HousesPageID":"860"},
//        {"AppName":"gonggao","AppTitle":"小区公告","HousesPageID":"861"},
//        {"AppName":"xinwen","AppTitle":"新闻动态","HousesPageID":"862"},
//        {"AppName":"shequ","AppTitle":"社区特惠","HousesPageID":"863"},
//        {"AppName":"fujin","AppTitle":"小区附近","HousesPageID":"864"}
//         ]
//    },
//    {"PageID":"24","HousesPageID":"856","AppName":"circle","AppTitle":"邻里圈"}
//    {"PageID":"25","HousesPageID":"857","AppName":"gouwuche","AppTitle":"购物车"}
//                                                                                               ],
//    "UserName":"yanshiban",
//    "CityName":null,
//    "HouseNumberID":"14800",
//    "Address":"东塔0301",
//    "UnitName":null,
//    "UnitID":"55",
//    "Mobile":"",
//    "AppNames":"dianhua,favorites,transaction,businesses,feedback,service,news,homemaking,wuye,shenghuo,zhoubian,deliver,esjy,fwzs,fankui,louguan,weixiu,circle,gouwuche,sfbz,jiaofei,baojian,gonggao,xinwen,shequ,fujin",
//    
//    "HouseNumberName":null,
//    "UserTel":"18801481234",
//    "Nickname":"lijin",
//    "PicturePath":"http://172.16.1.50/interface/userfile/image/transaction/1436434539_237.jpg",
//    "HousesName":"普及管家演示版",
//    "HousesID":"27",
//    "LastNewsID":903,
//    "Logo":"http://172.16.1.50/pujiapp/userfile/",
//    "AccessToken":"1066febb7fb3100932d6777be8c0a4e6","BuildingName":null
//}

@end

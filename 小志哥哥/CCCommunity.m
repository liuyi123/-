//
//  CCCommunity.m
//  普及管家
//
//  Created by 陈立远 on 15/5/19.
//  Copyright (c) 2015年 PUJI Network. All rights reserved.
//

#import "CCCommunity.h"

@implementation CCCommunity


+(instancetype)createCommunityWithDic:(NSDictionary *)dic
{
    CCCommunity* cty = [[CCCommunity alloc]init];
    cty.housesCompanyID = dic[@"HousesCompanyID"];
    cty.housesCompanyName = dic[@"HousesCompanyName"];
    cty.cID  = dic[@"HousesID"];
    cty.name = dic[@"HousesName"];
    cty.isCall  = [dic[@"IsCall"] intValue];
    cty.linkman = dic[@"Linkman"];
    cty.tel = dic[@"Tel"];
    
    
    [cty initMenusWithArray:dic[@"CatePage"]];
    
    
    cty.isShopCar =YES;// dic[@""];
    
    
    return cty;
}

-(void)initMenusWithArray:(NSDictionary*)array
{
   
    self.isForum = NO;
    self.isShopCar = NO;
    //遍历大类
    for (NSDictionary* dic in array) {
        if ([dic[@"AppName"] isEqualToString:@"wuye"])
        {
            self.wuyeMenus = [self getMenusWithDicArray:dic[@"Page"]];
            
            
        }else if ([dic[@"AppName"] isEqualToString:@"shenghuo"])
        {
            self.lifeMenus = [self getMenusWithDicArray:dic[@"Page"]];
            
            
        }else if ([dic[@"AppName"] isEqualToString:@"circle"])
        {
            self.isForum = YES;
            
        }else if ([dic[@"AppName"] isEqualToString:@"gouwuche"])
        {
            self.isShopCar = YES;
            
        }
    }
    
}

-(NSMutableArray*)getMenusWithDicArray:(NSArray*)page
{
    NSMutableArray* menus = [NSMutableArray array];
    
    for (NSDictionary* dic in page) {
        //[menus addObject:dic[@"AppName"]];
        [menus addObject:dic];
    }
    return menus;
}



- (void)encodeWithCoder:(NSCoder *)aCoder
{
    //[aCoder encodeObject:self.detailAddress forKey:@"DetailAddress"];
    [aCoder encodeObject:self.housesCompanyID forKey:@"housesCompanyID"];
    [aCoder encodeObject:self.housesCompanyName forKey:@"housesCompanyName"];
    [aCoder encodeObject:self.cID forKey:@"cID"];
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeBool:self.isCall forKey:@"isCall"];
    [aCoder encodeObject:self.linkman forKey:@"linkman"];
    [aCoder encodeObject:self.tel forKey:@"tel"];
    [aCoder encodeObject:self.address forKey:@"address"];
    [aCoder encodeObject:self.city forKey:@"city"];
    [aCoder encodeObject:self.cityId forKey:@"cityId"];
    [aCoder encodeObject:self.wuyeMenus forKey:@"wuyeMenus"];
    [aCoder encodeObject:self.lifeMenus forKey:@"lifeMenus"];
    [aCoder encodeObject:self.forumMenus forKey:@"forumMenus"];
    
    [aCoder encodeBool:self.isShopCar forKey:@"isShopCar"];
    [aCoder encodeBool:self.isForum forKey:@"isForum"];
    
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        if (aDecoder == nil) {
            return self;
        }
    }
    self.housesCompanyID = [aDecoder decodeObjectForKey:@"housesCompanyID"];
    self.housesCompanyName = [aDecoder decodeObjectForKey:@"housesCompanyName"];
    self.cID = [aDecoder decodeObjectForKey:@"cID"];
    self.name = [aDecoder decodeObjectForKey:@"name"];
    self.isCall = [aDecoder decodeBoolForKey:@"isCall"];
    self.linkman = [aDecoder decodeObjectForKey:@"linkman"];
    self.tel = [aDecoder decodeObjectForKey:@"tel"];
    self.address = [aDecoder decodeObjectForKey:@"address"];
    self.city = [aDecoder decodeObjectForKey:@"city"];
    self.cityId = [aDecoder decodeObjectForKey:@"cityId"];
    self.wuyeMenus = [aDecoder decodeObjectForKey:@"wuyeMenus"];
    self.lifeMenus = [aDecoder decodeObjectForKey:@"lifeMenus"];
    self.forumMenus = [aDecoder decodeObjectForKey:@"forumMenus"];
    
    self.isShopCar = [aDecoder decodeBoolForKey:@"isShopCar"];
    self.isForum = [aDecoder decodeBoolForKey:@"isForum"];
    
    /*
     if (self = [super init]) {
     if (aDecoder == nil) {
     return self;
     }
     self.name = [aDecoder decodeObjectForKey:@"Name"];
     self.tel  = [aDecoder decodeObjectForKey:@"Tel"];
     self.communityName = [aDecoder decodeObjectForKey:@"CommunityName"];
     self.build = [aDecoder decodeObjectForKey:@"Build"];
     self.room = [aDecoder decodeObjectForKey:@"Room"];
     self.detailAddress = [aDecoder decodeObjectForKey:@"DetailAddress"];
     }
     
     
     return self;
     */
    return self;
}




+(instancetype)createCommunityWithCID:(NSString*)cId andCity:(NSString*)city andName:(NSString*)name andAddress:(NSString*)address
{
    CCCommunity* cty = [[CCCommunity alloc]init];
    
    if (cty) {
        cty.cID = cId;
        cty.name = name;
        cty.city = city;
        cty.address = address;
        

    }
    return cty;
}
@end
//{
//     CatePage =         (
//                         {
//                             AppName = wuye;
//                             AppTitle = "\U7269\U4e1a";
//                             HousesPageID = 832;
//                             Page =                 (
//                                                     {
//                                                         AppName = esjy;
//                                                         AppTitle = "\U4e8c\U624b\U4ea4\U6613";
//                                                         HousesPageID = 834;
//                                                     }
//                                                     );
//                             PageID = 22;
//                         },
//                         {
//                             AppName = shenghuo;
//                             AppTitle = "\U751f\U6d3b";
//                             HousesPageID = 833;
//                             Page =                 (
//                                                     {
//                                                         AppName = deliver;
//                                                         AppTitle = "\U5feb\U9001\U670d\U52a1";
//                                                         HousesPageID = 835;
//                                                     },
//                                                     {
//                                                         AppName = zbfw2;
//                                                         AppTitle = "\U5468\U8fb9\U670d\U52a1";
//                                                         HousesPageID = 837;
//                                                     }
//                                                     );
//                             PageID = 23;
//                         },
//                         {
//                             AppName = circle;
//                             AppTitle = "\U90bb\U91cc\U5708";
//                             HousesPageID = 839;
//                             PageID = 24;
//                         },
//                         {
//                             AppName = gouwuche;
//                             AppTitle = "\U8d2d\U7269\U8f66";
//                             HousesPageID = 840;
//                             PageID = 25;
//                         }
//                         );
//     HousesCompanyID = 1;
//     HousesCompanyName = "\U5317\U4eac\U6052\U5bcc\U7269\U4e1a\U7ba1\U7406\U6709\U9650\U516c\U53f8";
//     HousesID = 1;
//     HousesName = "\U5bcc\U529b\U57ceA\U533a";
//     IsCall = 0;
//     Linkman = "\U5f20\U51e1\U8363";
//     Tel = 01068622778;
// }
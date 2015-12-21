//
//  CCUploadFile.h
//  普及管家
//
//  Created by 陈立远 on 15/8/19.
//  Copyright (c) 2015年 PUJI Network. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^CallBack) (id obj);
@interface CCUploadFile : NSObject
- (void)uploadFileWithURL:(NSURL *)url data:(NSData *)data;

- (NSDictionary*)uploadSyncFileWithURL:(NSURL *)url data:(NSData *)data;
- (void)uploadFileWithURL:(NSURL *)url data:(NSData *)data andCallback:(CallBack)callback;

+(NSString*)getBigPicPaths:(NSArray*)paths;
+(NSString*)getThumbnailPaths:(NSArray*)paths;
@end

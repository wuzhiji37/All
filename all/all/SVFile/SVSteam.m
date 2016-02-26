//
//  SVSteam.m
//  all
//
//  Created by 吴智极 on 16/2/26.
//  Copyright © 2016年 吴智极. All rights reserved.
//

#import "SVSteam.h"

@implementation SVSteam

+ (SVSteam *)shareInstance {
    static SVSteam *instance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        instance = [[self alloc] init];
    });
    return instance;
}
- (void)doGetAppList {
    NSString *path = [NSString stringWithFormat:@"%@/GetAppList/v2/?format=json", STEAM_URL_APPS];
    NSLog(@"path = %@",path);
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    [session GET:path
      parameters:nil
        progress:^(NSProgress * _Nonnull downloadProgress) {
            NSLog(@"doGetAppList = %lld / %lld",downloadProgress.completedUnitCount, downloadProgress.totalUnitCount);
        }
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             NSDictionary *dic = [[NSDictionary alloc] initWithDictionary:responseObject];
             self.appArray = [[dic objectForKey:@"applist"] objectForKey:@"apps"];
             NSLog(@"self.appArray = %lu",(unsigned long)self.appArray.count);
             GCD_BACK((^{
                 NSString *SteamDBPath = [DOCUMENT_PATH stringByAppendingPathComponent:@"steam.sqlite"];
                 FMDatabase *SteamDB = [FMDatabase databaseWithPath:SteamDBPath];
                 SteamDB.shouldCacheStatements = YES;
                 if ([SteamDB open]) {
                     BOOL drop_res = [SteamDB executeUpdate:[NSString stringWithFormat:@"DROP TABLE %@", TABLE_STEAMAPP]];
                     NSLog(@"drop_res = %@",drop_res?@"YES":@"NO");
                     BOOL create_res = [SteamDB executeUpdate:[NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS '%@' ('%@' INTEGER PRIMARY KEY, '%@' TEXT)", TABLE_STEAMAPP, PROPERTY_APPID, PROPERTY_APPNAME]];
                     if (create_res) {
                         NSLog(@"success to creating db table");
                         for (int i = 0; i<self.appArray.count; i+=1) {
                             NSDictionary *tDic = [self.appArray objectAtIndex:i];
                             NSNumber *appid = [tDic objectForKey:@"appid"];
                             NSString *appname = [[NSString stringWithFormat:@"%@",[tDic objectForKey:@"name"]] stringByReplacingOccurrencesOfString:@"\'" withString:@"\""];
                             BOOL insert_res = [SteamDB executeUpdate:@"INSERT INTO Table_SteamApp VALUES (?, ?)", appid, appname];
                         }
                         NSLog(@"1");
                         
                         //                     GCD_BACK((^{
                         //                         for (int i = 1; i<self.appArray.count; i+=2) {
                         //                             NSDictionary *tDic = [self.appArray objectAtIndex:i];
                         //                             int appid = [[tDic objectForKey:@"appid"] intValue];
                         //                             NSString *appname = [[NSString stringWithFormat:@"%@",[tDic objectForKey:@"name"]] stringByReplacingOccurrencesOfString:@"\'" withString:@"\""];
                         //                             BOOL insert_res = [SteamDB executeUpdate:[NSString stringWithFormat:@"INSERT INTO '%@' ('%@', '%@') VALUES ('%d', '%@')", TABLE_STEAMAPP, PROPERTY_APPID, PROPERTY_APPNAME, appid, appname]];
                         //                             //                             NSLog(@"insert_res %@, %d", insert_res?@"OK":@"NO", appid);
                         //                         }
                         //                         NSLog(@"2");
                         ////                         FMResultSet *select_res = [SteamDB executeQuery:[NSString stringWithFormat:@"SELECT * FROM %@ WHERE %@ < 100", TABLE_STEAMAPP, PROPERTY_APPID]];
                         ////                         while ([select_res next]) {
                         ////                             NSLog(@"RS = %d %@", [select_res intForColumn:PROPERTY_APPID], [select_res stringForColumn:PROPERTY_APPNAME]);
                         ////                         }
                         //                     }));
                         [SteamDB close];
                     } else {
                         NSLog(@"error when creating db table");
                     }
                 } else {
                     NSLog(@"ERROR");
                 }
             }));
             
             
             
             
         }
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             NSLog(@"fail");
         }];
}
@end

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
- (instancetype)init {
    self = [super init];
    if (self) {
        self.steamDB = [[SVDataBase manager] getDataBaseWithName:@"steam"];
//        [[SVDataBase manager] dataBase:self.steamDB
//                           deleteTable:TABLE_STEAM_APP];
//        [[SVDataBase manager] dataBase:self.steamDB
//                           deleteTable:TABLE_STEAM_UPDATE];
        
        if (IS_FIRSTSTART) {
            [[SVDataBase manager] dataBase:self.steamDB
                               createTable:TABLE_STEAM_APP
                              keysAndTypes:KEYTYPE_STEAM_APP
                               primaryKeys:@[PROPERTY_APPID]];
            [[SVDataBase manager] dataBase:self.steamDB
                               createTable:TABLE_STEAM_UPDATE
                              keysAndTypes:KEYTYPE_STEAM_UPDATE
                               primaryKeys:@[PROPERTY_TABLENAME]];
        }
        [self doSteamUpdate];
        //[self doGetAppList];
    }
    return self;
}
- (void)doSteamUpdate {
    [[SVDataBase manager] dataBase:self.steamDB
                       selectTable:TABLE_SQLITE_MASTER
                      keysAndTypes:nil];
//    for (NSString *tableName in [) {
//        <#statements#>
//    }
    [[SVDataBase manager] dataBase:self.steamDB
                       insertTable:TABLE_STEAM_UPDATE
                     keysAndValues:KEYVALUE_STEAM_UPDATE(TABLE_STEAM_APP, @0)];
    [[SVDataBase manager] dataBase:self.steamDB
                       selectTable:TABLE_STEAM_UPDATE
                      keysAndTypes:KEYTYPE_STEAM_UPDATE];
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
             NSLog(@"self.appArray.count = %lu",(unsigned long)self.appArray.count);
             GCD_BACK((^{
                 for (int i = 0; i<self.appArray.count; i++) {
                     NSDictionary *tDic = [self.appArray objectAtIndex:i];
                     NSNumber *appid = [tDic objectForKey:@"appid"];
                     NSString *appname = [NSString stringWithFormat:@"%@",[tDic objectForKey:@"name"]];
                     [[SVDataBase manager] dataBase:self.steamDB
                                        insertTable:TABLE_STEAM_APP
                                      keysAndValues:KEYVALUE_STEAM_APP(appid, appname)];
                 }
                 
                 SVLog(DOCUMENT_PATH);
             }));
             
             
             
             
         }
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             NSLog(@"fail");
         }];
}
@end

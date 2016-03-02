//
//  SVHeader.h
//  all
//
//  Created by 吴智极 on 16/2/16.
//  Copyright © 2016年 吴智极. All rights reserved.
//

#ifndef SVHeader_h
#define SVHeader_h

#import "NSDate+SVExtra.h"
//System
#define NSLog(format, ...) do { \
                            fprintf(stderr, "<%s.%d> %s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __func__); \
                            (NSLog)((format), ##__VA_ARGS__); \
                            fprintf(stderr, "--------------------\n"); \
                            } while (0)
#define SVLog(a)                do {NSLog(@"%s = %@",#a,(a));} while (0)
#define WS                      __weak __typeof(&*self)weakself = self;
//IOS
#define IOS_VERSION             ([[[UIDevice currentDevice] systemVersion] floatValue])
#define CurrentSystemVersion    ([[UIDevice currentDevice] systemVersion])
#define CurrentLanguage         ([[NSLocale preferredLanguages] objectAtIndex:0])
#define IS_FIRSTSTART           ([USER_DEFAULT boolForKey:@"firstStart"])
//Value
#define StatusBar_HEIGHT 20
#define NaviBar_HEIGHT   44
#define Bar_HEIGHT       (StatusBar_HEIGHT+NaviBar_HEIGHT)
#define NaviBarIcon      20
#define TabBar_HEIGHT    49
#define TabBarIcon       30

//Size
#define SCREEN_WIDTH    ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT   ([UIScreen mainScreen].bounds.size.height)
#define WIDTH(a)        ((a).bounds.size.width)
#define HEIGHT(a)       ((a).bounds.size.height)

//Shorten
#define USER_DEFAULT    [NSUserDefaults standardUserDefaults]
#define FONT(n)         [UIFont systemFontOfSize:(n)]
#define URL(string)     [NSURL URLWithString:[[NSString stringWithFormat:@"%@",string] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]]]

//Steam
#define STEAM_APIKEY        @"21573F8C6E91E6DDA25BF893BEE05662"
#define STEAM_ID_WZJ        @"76561198059360686"
#define STEAM_ID_WZY        @"76561198070775508"
#define STEAM_URL_NEWS      @"https://api.steampowered.com/ISteamNews"
#define STEAM_URL_USER      @"https://api.steampowered.com/ISteamUser"
#define STEAM_URL_SERVICE   @"https://api.steampowered.com/IPlayerService"
#define STEAM_URL_APPS      @"https://api.steampowered.com/ISteamApps"
#define STEAM_URL_IMAGE     @"http://media.steampowered.com/steamcommunity/public/images/apps"


//Database
#define TABLE_SQLITE_MASTER                     @"sqlite_master"

#define TABLE_STEAM_APP                         @"Table_Steam_App"
#define KEYTYPE_STEAM_APP                       @{PROPERTY_APPID    :@"INTEGER",\
                                                  PROPERTY_APPNAME  :@"TEXT"}
#define KEYVALUE_STEAM_APP(appid, appname)      @{PROPERTY_APPID    :appid,\
                                                  PROPERTY_APPNAME  :appname}
#define PROPERTY_APPID                          @"appid"
#define PROPERTY_APPNAME                        @"appname"


#define TABLE_STEAM_UPDATE                              @"Table_Steam_Update"
#define KEYTYPE_STEAM_UPDATE                            @{PROPERTY_TABLENAME :@"TEXT",PROPERTY_UPDATETIME:@"INTEGER"}
#define KEYVALUE_STEAM_UPDATE(tablename, updatetime)    @{PROPERTY_TABLENAME :tablename,\
                                                          PROPERTY_UPDATETIME:updatetime}
#define PROPERTY_TABLENAME                              @"tablename"
#define PROPERTY_UPDATETIME                             @"updatetime"

//Path
#define FILE_PATH           NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)
#define DOCUMENT_PATH       [FILE_PATH firstObject]

//GCD
#define GCD_BACK(block)     dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define GCD_MAIN(block)     dispatch_async(dispatch_get_main_queue(),block)
#endif /* SVHeader_h */

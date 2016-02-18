//
//  SVHeader.h
//  all
//
//  Created by 吴智极 on 16/2/16.
//  Copyright © 2016年 吴智极. All rights reserved.
//

#ifndef SVHeader_h
#define SVHeader_h

// MACRO
#define NSLog(format, ...) do { \
                            fprintf(stderr, "<%s.%d> %s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __func__); \
                            (NSLog)((format), ##__VA_ARGS__); \
                            fprintf(stderr, "--------------------\n"); \
                            } while (0)
#define WS  __weak __typeof(&*self)weakself = self;
#define IOS_VERSION     [[[UIDevice currentDevice] systemVersion] floatValue]


#define StatusBar_HEIGHT 20
#define NaviBar_HEIGHT   44
#define Bar_HEIGHT       (StatusBar_HEIGHT+NaviBar_HEIGHT)
#define NaviBarIcon      20
#define TabBar_HEIGHT    49
#define TabBarIcon       30

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#define USER_DEFAULT [NSUserDefaults standardUserDefaults]
#endif /* SVHeader_h */

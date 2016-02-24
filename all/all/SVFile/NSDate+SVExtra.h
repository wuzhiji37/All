//
//  NSDate+SVExtra.h
//  all
//
//  Created by 吴智极 on 16/2/24.
//  Copyright © 2016年 吴智极. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (SVExtra)
+ (NSString *)dateStrWithUnixTime:(id)time;
+ (NSString *)dateStrWithUnixTimeTwoLine:(id)time;
@end

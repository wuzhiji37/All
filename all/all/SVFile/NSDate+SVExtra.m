//
//  NSDate+SVExtra.m
//  all
//
//  Created by 吴智极 on 16/2/24.
//  Copyright © 2016年 吴智极. All rights reserved.
//

#import "NSDate+SVExtra.h"

@implementation NSDate (SVExtra)
+ (NSString *)dateStrWithUnixTime:(id)time {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yy/MM/dd HH:mm:ss"];
    return [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:[time unsignedIntegerValue]]];
}
+ (NSString *)dateStrWithUnixTimeTwoLine:(id)time {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy MMM dd\nHH:mm:ss"];
    return [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:[time unsignedIntegerValue]]];
}
@end

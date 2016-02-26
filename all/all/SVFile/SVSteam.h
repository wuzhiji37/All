//
//  SVSteam.h
//  all
//
//  Created by 吴智极 on 16/2/26.
//  Copyright © 2016年 吴智极. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SVSteam : NSObject
+ (SVSteam *)shareInstance;
- (void)doGetAppList;
@property (nonatomic, strong) NSArray *appArray;
@end

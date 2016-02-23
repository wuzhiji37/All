//
//  SteamNavigationController.m
//  all
//
//  Created by 吴智极 on 16/2/23.
//  Copyright © 2016年 吴智极. All rights reserved.
//

#import "SteamNavigationController.h"

@implementation SteamNavigationController
- (instancetype)init {
    self.steamVC = [[SteamViewController alloc] init];
    self = [super initWithRootViewController:self.steamVC];
    if (self) {
    }
    return self;
}
@end

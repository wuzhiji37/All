//
//  ClassNavigationController.m
//  all
//
//  Created by 吴智极 on 16/2/18.
//  Copyright © 2016年 吴智极. All rights reserved.
//

#import "ClassNavigationController.h"

@implementation ClassNavigationController
- (instancetype)init {
    self.classVC = [[ClassViewController alloc] init];
    self = [super initWithRootViewController:self.classVC];
    if (self) {
        
    }
    return self;
}
@end

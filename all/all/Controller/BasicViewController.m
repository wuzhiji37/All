//
//  BasicViewController.m
//  all
//
//  Created by 吴智极 on 16/2/18.
//  Copyright © 2016年 吴智极. All rights reserved.
//

#import "BasicViewController.h"

@implementation BasicViewController
- (instancetype)init {
    self = [super init];
    if (self) {
        self.automaticallyAdjustsScrollViewInsets = NO;
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}
@end

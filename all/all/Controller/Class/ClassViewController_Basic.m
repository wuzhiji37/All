//
//  ClassViewController_Basic.m
//  all
//
//  Created by 吴智极 on 16/2/18.
//  Copyright © 2016年 吴智极. All rights reserved.
//

#import "ClassViewController_Basic.h"

@interface ClassViewController_Basic ()

@end

@implementation ClassViewController_Basic
- (instancetype)init {
    self = [super init];
    if (self) {

    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    WS;
    _mainView = [[UIView alloc] init];
    [self.view addSubview:_mainView];
    _mainView.backgroundColor = [UIColor lightGrayColor];
    [_mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakself.view).insets(UIEdgeInsetsMake(100, 20, 100, 20));
    }];
}
@end

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
    self.objView = [[UIView alloc] init];
    [self.view addSubview:self.objView];
    self.objView.backgroundColor = [UIColor lightGrayColor];
    [self.objView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.view.mas_top).offset(Bar_HEIGHT+10);
        make.left.equalTo(weakself.view.mas_left).offset(10);
        make.right.equalTo(weakself.view.mas_right).offset(-10);
        make.height.equalTo(@100);
    }];
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    self.objCV = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    [self.view addSubview:self.objCV];
    
    self.objCV.backgroundColor = [UIColor lightGrayColor];
    [self.objCV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.objView.mas_bottom).offset(10);
        make.left.equalTo(weakself.view.mas_left).offset(10);
        make.right.equalTo(weakself.view.mas_right).offset(-10);
        make.bottom.equalTo(weakself.view.mas_bottom).offset(-10);
    }];
}
@end

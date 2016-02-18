//
//  ClassViewController_UILabel.m
//  all
//
//  Created by 吴智极 on 16/2/18.
//  Copyright © 2016年 吴智极. All rights reserved.
//

#import "ClassViewController_UILabel.h"

@interface ClassViewController_UILabel ()
{
    UILabel *_label1;
    UILabel *_label2;
    UILabel *_label3;
}
@end

@implementation ClassViewController_UILabel

- (void)viewDidLoad {
    [super viewDidLoad];
    _label1 = [[UILabel alloc] init];
    [self.view addSubview:_label1];
    _label2 = [[UILabel alloc] init];
    [self.view addSubview:_label2];
    _label3 = [[UILabel alloc] init];
    [self.view addSubview:_label3];
    
    _label1.text = @"label1";
    _label2.text = @"label2";
    _label3.text = @"label3";
    
    _label1.backgroundColor = [UIColor greenColor];
    _label2.backgroundColor = [UIColor yellowColor];
    _label3.backgroundColor = [UIColor orangeColor];
    
    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(@[self.mainView,_label2,_label3]);
        make.height.mas_equalTo(@100);
        make.left.equalTo(self.mainView.mas_left).offset(10);
        make.right.equalTo(_label2.mas_left).offset(-10);
    }];
    [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@50);
        make.left.equalTo(_label1.mas_right).offset(10);
        make.right.equalTo(_label3.mas_left).offset(-10);
    }];
    [_label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@20);
        make.left.equalTo(_label2.mas_right).offset(10);
        make.right.equalTo(self.mainView.mas_right).offset(-10);
    }];

}
@end

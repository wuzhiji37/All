//
//  ClassTableViewCell_Basic.m
//  all
//
//  Created by 吴智极 on 16/2/22.
//  Copyright © 2016年 吴智极. All rights reserved.
//

#import "ClassTableViewCell_Basic.h"

@implementation ClassTableViewCell_Basic

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier size:(CGSize)size {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.frame = CGRectMake(0, 0, size.width, size.height);
        self.valueNameArray = @[];
        self.valueArray = @[];
        self.valueNumber = 0;
        [self loadView];
    }
    return self;
}
- (void)loadView {
    WS;
    
    self.propertyLabel = [[UILabel alloc] init];
    self.propertyLabel.adjustsFontSizeToFitWidth = YES;
    [self.contentView addSubview:self.propertyLabel];
    
    self.valueLabel = [[UILabel alloc] init];
    self.valueLabel.adjustsFontSizeToFitWidth = YES;
    self.valueLabel.textAlignment = NSTextAlignmentRight;
    self.valueLabel.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:self.valueLabel];
    
    [self.propertyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.contentView.mas_left).offset(10);
        make.right.equalTo(weakself.valueLabel.mas_left).offset(-10);
        make.top.equalTo(weakself.contentView.mas_top);
        make.bottom.equalTo(weakself.contentView.mas_bottom);
        make.width.equalTo(weakself.valueLabel);
    }];
    
    [self.valueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.propertyLabel.mas_right).offset(10);
        make.right.equalTo(weakself.contentView.mas_right).offset(-10);
        make.top.equalTo(weakself.contentView.mas_top);
        make.bottom.equalTo(weakself.contentView.mas_bottom);
    }];
}

@end

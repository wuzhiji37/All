//
//  SteamTableViewCell_GetNewsForApp.m
//  all
//
//  Created by 吴智极 on 16/2/23.
//  Copyright © 2016年 吴智极. All rights reserved.
//

#import "SteamTableViewCell_GetNewsForApp.h"

@implementation SteamTableViewCell_GetNewsForApp

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier size:(CGSize)size {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.frame = CGRectMake(0, 0, size.width, size.height);
        [self loadViews];
    }
    return self;
}
- (void)loadViews {
    WS;
    self.backgroundColor = [UIColor lightGrayColor];
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.contentView.layer.cornerRadius = 5;
    self.contentView.layer.masksToBounds = YES;
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakself).insets(UIEdgeInsetsMake(5, 5, 0, 5));
    }];
    self.timeLabel = [[UILabel alloc] init];
    self.timeLabel.font = FONT(13);
    self.timeLabel.numberOfLines = 0;
    self.timeLabel.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:self.timeLabel];
    
    self.authorLabel = [[UILabel alloc] init];
    self.authorLabel.font = FONT(13);
    self.authorLabel.numberOfLines = 0;
    self.authorLabel.textColor = [UIColor lightGrayColor];
    self.authorLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.authorLabel];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.font = FONT(15);
    self.titleLabel.numberOfLines = 0;
    [self.contentView addSubview:self.titleLabel];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.contentView.mas_top).offset(5);
        make.left.equalTo(weakself.contentView.mas_left).offset(5);
        make.right.equalTo(weakself.authorLabel.mas_left).offset(-5);
        make.bottom.equalTo(weakself.titleLabel.mas_top).offset(-5);
        make.width.equalTo(weakself.authorLabel).multipliedBy(0.5);
        make.height.equalTo(@[weakself.authorLabel, self.titleLabel]);
    }];
    
    [self.authorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.contentView.mas_top).offset(5);
        make.left.equalTo(weakself.timeLabel.mas_right).offset(5);
        make.right.equalTo(weakself.contentView.mas_right).offset(-5);
        make.bottom.equalTo(weakself.titleLabel.mas_top).offset(-5);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.timeLabel.mas_bottom).offset(5);
        make.left.equalTo(weakself.contentView.mas_left).offset(5);
        make.right.equalTo(weakself.contentView.mas_right).offset(-5);
        make.bottom.equalTo(weakself.contentView.mas_bottom).offset(-5);
    }];
}
@end

//
//  SteamTableViewCell_GetFriendList.m
//  all
//
//  Created by 吴智极 on 16/2/24.
//  Copyright © 2016年 吴智极. All rights reserved.
//

#import "SteamTableViewCell_GetFriendList.h"

@implementation SteamTableViewCell_GetFriendList
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
    
    self.avatarIV = [[UIImageView alloc] init];
    [self.contentView addSubview:self.avatarIV];
    
    [self.avatarIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.contentView.mas_top).offset(5);
        make.bottom.equalTo(weakself.contentView.mas_bottom).offset(-5);
        make.left.equalTo(weakself.contentView.mas_left).offset(5);
        make.width.equalTo(weakself.avatarIV.mas_height);
    }];
    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.font = FONT(15);
    [self.contentView addSubview:self.nameLabel];
    
    self.personastateLabel = [[UILabel alloc] init];
    self.personastateLabel.font = FONT(13);
    self.personastateLabel.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:self.personastateLabel];
    
    self.timeLabel = [[UILabel alloc] init];
    self.timeLabel.font = FONT(13);
    self.timeLabel.textAlignment = NSTextAlignmentRight;
    self.timeLabel.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:self.timeLabel];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.avatarIV.mas_top);
        make.left.equalTo(weakself.avatarIV.mas_right).offset(5);
        make.right.equalTo(weakself.contentView.mas_right).offset(-5);
        
        make.height.equalTo(@[weakself.personastateLabel, weakself.timeLabel]);
    }];
    
    [self.personastateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.nameLabel.mas_bottom).offset(5);
        make.left.equalTo(weakself.nameLabel);
        make.bottom.equalTo(weakself.contentView.mas_bottom).offset(-5);
        
        make.top.equalTo(weakself.timeLabel);
        make.width.equalTo(weakself.timeLabel);
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(weakself.personastateLabel.mas_right).offset(5);
        make.right.equalTo(weakself.nameLabel);
    }];
    self.nameLabel.text = @"123";
    self.personastateLabel.text = @"1234";
    self.timeLabel.text = @"12345";
}
@end

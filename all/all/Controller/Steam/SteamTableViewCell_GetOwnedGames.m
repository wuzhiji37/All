//
//  SteamTableViewCell_GetOwnedGames.m
//  all
//
//  Created by 吴智极 on 16/2/25.
//  Copyright © 2016年 吴智极. All rights reserved.
//

#import "SteamTableViewCell_GetOwnedGames.h"

@implementation SteamTableViewCell_GetOwnedGames
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
    self.iconIV = [[UIImageView alloc] init];
    [self.contentView addSubview:self.iconIV];
    
    self.logoIV = [[UIImageView alloc] init];
    self.logoIV.alpha = 0.5;
    self.logoIV.userInteractionEnabled = YES;
    [self.contentView addSubview:self.logoIV];
    
    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.font = FONT(16);
    self.nameLabel.adjustsFontSizeToFitWidth = YES;
    [self.contentView addSubview:self.nameLabel];
    
    self.timeLabel = [[UILabel alloc] init];
    self.timeLabel.font = FONT(13);
    self.timeLabel.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:self.timeLabel];
    
    [self.iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(weakself.contentView);
        make.width.equalTo(weakself.iconIV.mas_height);
    }];
    [self.logoIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.iconIV.mas_right);
        make.top.bottom.equalTo(weakself.contentView);
        make.width.equalTo(weakself.logoIV.mas_height).multipliedBy(18/7.0);
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.equalTo(weakself.contentView);
        make.left.equalTo(weakself.logoIV.mas_right).offset(5);
        
        make.left.right.height.equalTo(weakself.timeLabel);
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.nameLabel.mas_bottom);
        make.bottom.equalTo(weakself.contentView);

    }];
}
@end

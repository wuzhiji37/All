//
//  SteamTableViewCell_GetFriendList.h
//  all
//
//  Created by 吴智极 on 16/2/24.
//  Copyright © 2016年 吴智极. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SteamTableViewCell_GetFriendList : UITableViewCell
@property (nonatomic, strong) UIImageView *avatarIV;

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *personastateLabel;
@property (nonatomic, strong) UILabel *timeLabel;
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier size:(CGSize)size;
@end

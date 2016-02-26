//
//  SteamTableViewCell_GetOwnedGames.h
//  all
//
//  Created by 吴智极 on 16/2/25.
//  Copyright © 2016年 吴智极. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SteamTableViewCell_GetOwnedGames : UITableViewCell
@property (nonatomic, strong) UIImageView *iconIV;
@property (nonatomic, strong) UIImageView *logoIV;
@property (nonatomic, strong) UILabel     *nameLabel;
@property (nonatomic, strong) UILabel     *timeLabel;
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier size:(CGSize)size;
@end

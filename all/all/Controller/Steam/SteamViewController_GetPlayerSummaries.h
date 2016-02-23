//
//  SteamViewController_GetPlayerSummaries.h
//  all
//
//  Created by 吴智极 on 16/2/23.
//  Copyright © 2016年 吴智极. All rights reserved.
//

#import "BasicViewController.h"

@interface SteamViewController_GetPlayerSummaries : BasicViewController
@property (nonatomic, strong) NSString *steamId;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *avatarfullIV;
@property (nonatomic, strong) UIImageView *avatarmediumIV;
@property (nonatomic, strong) UIImageView *avatarIV;
@end

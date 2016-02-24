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
@property (nonatomic, strong) NSDictionary *playerDic;
//Public Data
@property (nonatomic, strong) UIImageView *avatarfullIV;
@property (nonatomic, strong) UIImageView *avatarmediumIV;
@property (nonatomic, strong) UIImageView *avatarIV;
@property (nonatomic, strong) UILabel *personanameLabel;
@property (nonatomic, strong) UILabel *steamidLabel;
@property (nonatomic, strong) UILabel *personastateLabel;
@property (nonatomic, strong) UILabel *communityvisibilitystateLabel;
@property (nonatomic, strong) UILabel *profilestateLabel;
@property (nonatomic, strong) UILabel *lastlogoffLabel;
@property (nonatomic, strong) UILabel *commentpermissionLabel;
//Pravite Data
@property (nonatomic, strong) UILabel *realnameLabel;
@property (nonatomic, strong) UILabel *primaryclanidLabel;
@property (nonatomic, strong) UILabel *timecreatedLabel;
@property (nonatomic, strong) UILabel *gameidLabel;
@property (nonatomic, strong) UILabel *gameserveripLabel;
@property (nonatomic, strong) UILabel *gameextrainfoLabel;
@property (nonatomic, strong) UILabel *loccountrycodeLabel;
@property (nonatomic, strong) UILabel *locstatecodeLabel;
@property (nonatomic, strong) UILabel *loccityidLabel;
@end

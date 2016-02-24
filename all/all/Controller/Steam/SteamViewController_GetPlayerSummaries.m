//
//  SteamViewController_GetPlayerSummaries.m
//  all
//
//  Created by 吴智极 on 16/2/23.
//  Copyright © 2016年 吴智极. All rights reserved.
//

#import "SteamViewController_GetPlayerSummaries.h"

@implementation SteamViewController_GetPlayerSummaries

- (instancetype)init {
    self = [super init];
    if (self) {
        self.steamId = STEAM_ID_WZJ;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadViews];
    if (!self.playerDic) {
        [self doGetPlayerSummaries];
    } else {
        [self doWithPlayerDic];
    }
}
- (void)loadViews {
    WS;
    
    self.scrollView = [[UIScrollView alloc] init];
    [self.view addSubview:self.scrollView];
    
    self.avatarfullIV = [[UIImageView alloc] init];
    [self.scrollView addSubview:self.avatarfullIV];
    
    self.avatarmediumIV = [[UIImageView alloc] init];
    [self.scrollView addSubview:self.avatarmediumIV];
    
    self.avatarIV = [[UIImageView alloc] init];
    [self.scrollView addSubview:self.avatarIV];
    
    self.personanameLabel = [[UILabel alloc] init];
    self.personanameLabel.font = FONT(14);
    [self.scrollView addSubview:self.personanameLabel];
    
    self.personastateLabel = [[UILabel alloc] init];
    self.personastateLabel.font = FONT(14);
    [self.scrollView addSubview:self.personastateLabel];
    
    self.steamidLabel = [[UILabel alloc] init];
    self.steamidLabel.font = FONT(14);
    [self.scrollView addSubview:self.steamidLabel];
    
    self.communityvisibilitystateLabel = [[UILabel alloc] init];
    self.communityvisibilitystateLabel.font = FONT(14);
    [self.scrollView addSubview:self.communityvisibilitystateLabel];
    
    self.profilestateLabel = [[UILabel alloc] init];
    self.profilestateLabel.font = FONT(14);
    [self.scrollView addSubview:self.profilestateLabel];
    
    self.lastlogoffLabel = [[UILabel alloc] init];
    self.lastlogoffLabel.font = FONT(14);
    [self.scrollView addSubview:self.lastlogoffLabel];
    
    self.commentpermissionLabel = [[UILabel alloc] init];
    self.commentpermissionLabel.font = FONT(14);
    [self.scrollView addSubview:self.commentpermissionLabel];
    
    self.realnameLabel = [[UILabel alloc] init];
    self.realnameLabel.font = FONT(14);
    [self.scrollView addSubview:self.realnameLabel];
    
    self.primaryclanidLabel = [[UILabel alloc] init];
    self.primaryclanidLabel.font = FONT(14);
    [self.scrollView addSubview:self.primaryclanidLabel];
    
    self.timecreatedLabel = [[UILabel alloc] init];
    self.timecreatedLabel.font = FONT(14);
    [self.scrollView addSubview:self.timecreatedLabel];
    
    self.gameidLabel = [[UILabel alloc] init];
    self.gameidLabel.font = FONT(14);
    [self.scrollView addSubview:self.gameidLabel];
    
    self.gameserveripLabel = [[UILabel alloc] init];
    self.gameserveripLabel.font = FONT(14);
    [self.scrollView addSubview:self.gameserveripLabel];
    
    self.gameextrainfoLabel = [[UILabel alloc] init];
    self.gameextrainfoLabel.font = FONT(14);
    [self.scrollView addSubview:self.gameextrainfoLabel];
    
    self.loccountrycodeLabel = [[UILabel alloc] init];
    self.loccountrycodeLabel.font = FONT(14);
    [self.scrollView addSubview:self.loccountrycodeLabel];
    
    self.locstatecodeLabel = [[UILabel alloc] init];
    self.locstatecodeLabel.font = FONT(14);
    [self.scrollView addSubview:self.locstatecodeLabel];
    
    self.loccityidLabel = [[UILabel alloc] init];
    self.loccityidLabel.font = FONT(14);
    [self.scrollView addSubview:self.loccityidLabel];
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakself.view).insets(UIEdgeInsetsMake(Bar_HEIGHT, 0, 0, 0));
    }];
    
    [self.avatarfullIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.scrollView.mas_top).offset(5);
        make.left.equalTo(weakself.scrollView.mas_left).offset(5);
        
        make.size.mas_equalTo(CGSizeMake(184, 184));
        make.left.equalTo(@[weakself.avatarmediumIV, weakself.avatarIV]);
    }];
    
    [self.avatarmediumIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.avatarfullIV.mas_bottom).offset(5);
        make.size.mas_equalTo(CGSizeMake(64, 64));
    }];
    
    [self.avatarIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.avatarmediumIV.mas_bottom).offset(5);
        make.size.mas_equalTo(CGSizeMake(32, 32));
    }];
    
    [self.personanameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.avatarfullIV.mas_top);
        make.left.equalTo(weakself.avatarfullIV.mas_right).offset(5);
        make.right.equalTo(weakself.scrollView.mas_right).offset(-5);
        make.height.equalTo(@14);
        
        make.left.equalTo(@[weakself.steamidLabel, weakself.personastateLabel, weakself.communityvisibilitystateLabel, weakself.profilestateLabel, weakself.lastlogoffLabel, weakself.commentpermissionLabel]);
    }];
    
    [self.steamidLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.personanameLabel.mas_bottom).offset(5);
        make.size.equalTo(weakself.personanameLabel);
    }];
    
    [self.personastateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.steamidLabel.mas_bottom).offset(5);
        make.size.equalTo(weakself.steamidLabel);
    }];
    
    [self.communityvisibilitystateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.personastateLabel.mas_bottom).offset(5);
        make.size.equalTo(weakself.personastateLabel);
    }];
    
    [self.profilestateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.communityvisibilitystateLabel.mas_bottom).offset(5);
        make.size.equalTo(weakself.communityvisibilitystateLabel);
    }];
    
    [self.lastlogoffLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.profilestateLabel.mas_bottom).offset(5);
        make.size.equalTo(weakself.profilestateLabel);
    }];
    
    [self.commentpermissionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.lastlogoffLabel.mas_bottom).offset(5);
        make.size.equalTo(weakself.lastlogoffLabel);
    }];
    
    [self.realnameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.avatarmediumIV.mas_top);
        make.left.equalTo(weakself.avatarmediumIV.mas_right).offset(5);
        make.right.equalTo(weakself.scrollView.mas_right).offset(-5);
        make.height.equalTo(@14);
        
        make.left.equalTo(@[weakself.primaryclanidLabel, weakself.timecreatedLabel, weakself.gameidLabel, weakself.gameserveripLabel, weakself.gameextrainfoLabel, weakself.loccountrycodeLabel, weakself.locstatecodeLabel, weakself.loccityidLabel]);
    }];
    
    [self.primaryclanidLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.realnameLabel.mas_bottom).offset(5);
        make.size.equalTo(weakself.realnameLabel);
    }];
    
    [self.timecreatedLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.primaryclanidLabel.mas_bottom).offset(5);
        make.size.equalTo(weakself.primaryclanidLabel);
    }];
    [self.gameidLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.timecreatedLabel.mas_bottom).offset(5);
        make.size.equalTo(weakself.timecreatedLabel);
    }];
    [self.gameserveripLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.gameidLabel.mas_bottom).offset(5);
        make.size.equalTo(weakself.gameidLabel);
    }];
    [self.gameextrainfoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.gameserveripLabel.mas_bottom).offset(5);
        make.size.equalTo(weakself.gameserveripLabel);
    }];

    [self.loccountrycodeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.gameextrainfoLabel.mas_bottom).offset(5);
        make.size.equalTo(weakself.gameextrainfoLabel);
    }];
    [self.locstatecodeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.loccountrycodeLabel.mas_bottom).offset(5);
        make.size.equalTo(weakself.loccountrycodeLabel);
    }];
    [self.loccityidLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.locstatecodeLabel.mas_bottom).offset(5);
        make.size.equalTo(weakself.locstatecodeLabel);
    }];
}

- (void)doGetPlayerSummaries {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSString *path = [NSString stringWithFormat:@"%@/GetPlayerSummaries/v0002/?key=%@&steamids=%@&format=json", STEAM_URL_USER, STEAM_APIKEY, self.steamId];
    NSLog(@"path = %@",path);
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    [session GET:path
      parameters:nil
        progress:^(NSProgress * _Nonnull downloadProgress) {
            NSLog(@"NSProgress = %lld / %lld",downloadProgress.completedUnitCount, downloadProgress.totalUnitCount);
        }
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             [MBProgressHUD hideHUDForView:self.view animated:YES];
             NSDictionary *dic = [[NSDictionary alloc] initWithDictionary:responseObject];
             self.playerDic = [[[dic objectForKey:@"response"] objectForKey:@"players"] objectAtIndex:0];
             NSLog(@"dic = %@",self.playerDic);
             [self doWithPlayerDic];
         }
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             [MBProgressHUD hideHUDForView:self.view animated:YES];
             NSLog(@"fail");
         }];
}
- (void)doWithPlayerDic {
    self.title = [self.playerDic objectForKey:@"personaname"];
    [self.avatarfullIV sd_setImageWithURL:URL([self.playerDic objectForKey:@"avatarfull"])];
    [self.avatarmediumIV sd_setImageWithURL:URL([self.playerDic objectForKey:@"avatarmedium"])];
    [self.avatarIV sd_setImageWithURL:URL([self.playerDic objectForKey:@"avatar"])];
    self.personanameLabel.text = [NSString stringWithFormat:@"昵称：%@",[self.playerDic objectForKey:@"personaname"]];
    self.steamidLabel.text = [NSString stringWithFormat:@"steam ID：%@",[self.playerDic objectForKey:@"steamid"]];
    switch ([[self.playerDic objectForKey:@"personastate"] integerValue]) {
        case 0:
            self.personastateLabel.text = @"状态：离线";
            break;
        case 1:
            self.personastateLabel.text = @"状态：在线";
            break;
        case 2:
            self.personastateLabel.text = @"状态：忙碌";
            break;
        case 3:
            self.personastateLabel.text = @"状态：离开";
            break;
        case 4:
            self.personastateLabel.text = @"状态：打盹";
            break;
        case 5:
            self.personastateLabel.text = @"状态：想交易";
            break;
        case 6:
            self.personastateLabel.text = @"状态：想玩游戏";
            break;
        default:
            self.personastateLabel.text = @"状态：未知";
            break;
    }
    
    switch ([[self.playerDic objectForKey:@"communityvisibilitystate"] integerValue]) {
        case 1:
            self.communityvisibilitystateLabel.text = @"资料公开：非公开";
            break;
        case 3:
            self.communityvisibilitystateLabel.text = @"资料公开：公开";
            break;
        default:
            self.communityvisibilitystateLabel.text = @"资料公开：未知";
            break;
    }
    if ([[[self.playerDic objectForKey:@"profilestate"] stringValue] isEqualToString:@"1"]) {
        self.profilestateLabel.text = @"社区配置：已配置";
    } else {
        self.profilestateLabel.text = @"社区配置：未配置";
    }
    self.lastlogoffLabel.text = [NSString stringWithFormat:@"最后注销时间：%@", [NSDate dateStrWithUnixTime:[self.playerDic objectForKey:@"lastlogoff"]]];
    if ([[[self.playerDic objectForKey:@"commentpermission"] stringValue] isEqualToString:@"1"]) {
        self.commentpermissionLabel.text = @"评论公开：公开";
    } else {
        self.commentpermissionLabel.text = @"评论公开：非公开";
    }
    if ([self.playerDic objectForKey:@"realname"]) {
        self.realnameLabel.text = [NSString stringWithFormat:@"真实姓名：%@", [self.playerDic objectForKey:@"realname"]];
        self.primaryclanidLabel.text = [NSString stringWithFormat:@"组：%@", [self.playerDic objectForKey:@"primaryclanid"]];
        self.timecreatedLabel.text = [NSString stringWithFormat:@"用户创建时间：%@", [NSDate dateStrWithUnixTime:[self.playerDic objectForKey:@"timecreated"]]];
        self.gameidLabel.text = [NSString stringWithFormat:@"游戏状态：%@", [self.playerDic objectForKey:@"gameid"]];
        self.gameserveripLabel.text = [NSString stringWithFormat:@"服务器状态：%@", [self.playerDic objectForKey:@"gameserverip"]];
        self.gameextrainfoLabel.text = [NSString stringWithFormat:@"游戏额外信息：%@", [self.playerDic objectForKey:@"gameextrainfo"]];
        self.loccountrycodeLabel.text = [NSString stringWithFormat:@"当前国家：%@", [self.playerDic objectForKey:@"loccountrycode"]];
        self.locstatecodeLabel.text = [NSString stringWithFormat:@"当前地区：%@", [self.playerDic objectForKey:@"locstatecode"]];
        self.loccityidLabel.text = [NSString stringWithFormat:@"当前城市：%@", [self.playerDic objectForKey:@"loccityid"]];
    }
}
@end

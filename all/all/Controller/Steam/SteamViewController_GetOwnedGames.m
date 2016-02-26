//
//  SteamViewController_GetOwnedGames.m
//  all
//
//  Created by 吴智极 on 16/2/25.
//  Copyright © 2016年 吴智极. All rights reserved.
//

#import "SteamViewController_GetOwnedGames.h"
#import "SteamTableViewCell_GetOwnedGames.h"
@implementation SteamViewController_GetOwnedGames
- (instancetype)init {
    self = [super init];
    if (self) {
        self.gameArray = [NSArray array];
        self.gameArray_sorted = [NSArray array];
        self.steamId = STEAM_ID_WZJ;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    WS;
    self.title = @"游戏";
    self.gameTV = [[UITableView alloc] init];
    self.gameTV.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.gameTV];
    [self.gameTV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakself.view).insets(UIEdgeInsetsMake(Bar_HEIGHT, 0, 0, 0));
    }];
    
    self.gameTV.delegate = self;
    self.gameTV.dataSource = self;
    [self doGetOwnedGames];
}
- (void)doGetOwnedGames {
    NSString *path = [NSString stringWithFormat:@"%@/GetOwnedGames/v0001/?key=%@&steamid=%@&format=json&include_appinfo=1&include_played_free_games=1", STEAM_URL_SERVICE, STEAM_APIKEY, self.steamId];
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    [session GET:path
      parameters:nil
        progress:^(NSProgress * _Nonnull downloadProgress) {
            NSLog(@"NSProgress = %lld / %lld",downloadProgress.completedUnitCount, downloadProgress.totalUnitCount);
        }
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             NSDictionary *dic = [[NSDictionary alloc] initWithDictionary:responseObject];
             self.gameArray = [[NSArray alloc] initWithArray:[[dic objectForKey:@"response"] objectForKey:@"games"]];
             self.gameArray_sorted = [self.gameArray sortedArrayUsingComparator:^NSComparisonResult(NSDictionary *dic1, NSDictionary *dic2) {
                 NSComparisonResult result = [[dic1 objectForKey:@"playtime_forever"] compare:[dic2 objectForKey:@"playtime_forever"]];
                 if (result == NSOrderedSame) {
                     NSNumber *dic1_2weeks = [dic1 objectForKey:@"playtime_2weeks"];
                     if (!dic1_2weeks) {
                         dic1_2weeks = @0;
                     }
                     NSNumber *dic2_2weeks = [dic2 objectForKey:@"playtime_2weeks"];
                     if (!dic2_2weeks) {
                         dic2_2weeks = @0;
                     }
                     result = [dic1_2weeks compare:dic2_2weeks];

                 }
                 return -result;
             }];
             [self.gameTV reloadData];
         }
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             NSLog(@"fail");
         }];

}
#pragma mark - UITableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.gameArray_sorted.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"SteamTableViewCell_GetOwnedGames";
    SteamTableViewCell_GetOwnedGames *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[SteamTableViewCell_GetOwnedGames alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId size:CGSizeMake(WIDTH(tableView), 50)];
        
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSDictionary *dic = [self.gameArray_sorted objectAtIndex:indexPath.row];
    NSString *iconStr = [NSString stringWithFormat:@"%@/%@/%@.jpg", STEAM_URL_IMAGE, [dic objectForKey:@"appid"], [dic objectForKey:@"img_icon_url"]];
    NSString *logoStr = [NSString stringWithFormat:@"%@/%@/%@.jpg", STEAM_URL_IMAGE, [dic objectForKey:@"appid"], [dic objectForKey:@"img_logo_url"]];
    [cell.iconIV sd_setImageWithURL:URL(iconStr)];
    [cell.logoIV sd_setImageWithURL:URL(logoStr)];
    cell.nameLabel.text = [dic objectForKey:@"name"];
    cell.timeLabel.text = [NSString stringWithFormat:@"总时间／近两周(分钟)：%d/%d",[[dic objectForKey:@"playtime_forever"] intValue],[[dic objectForKey:@"playtime_2weeks"] intValue]];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dic = [self.gameArray_sorted objectAtIndex:indexPath.row];
    NSLog(@"dic = %@",dic);
}

@end

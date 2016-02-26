//
//  SteamViewController_GetFriendList.m
//  all
//
//  Created by 吴智极 on 16/2/24.
//  Copyright © 2016年 吴智极. All rights reserved.
//

#import "SteamViewController_GetFriendList.h"
#import "SteamTableViewCell_GetFriendList.h"

#import "SteamViewController_GetPlayerSummaries.h"
@implementation SteamViewController_GetFriendList
- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"在线" style:UIBarButtonItemStylePlain target:self action:@selector(rightClick:)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    WS;
    self.title = @"我的好友";
    self.friendArray = [NSMutableArray array];
    self.friendArray_Online = [NSMutableArray array];
    _online = NO;
    self.friendTV = [[UITableView alloc] init];
    self.friendTV.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.friendTV];
    [self.friendTV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakself.view).insets(UIEdgeInsetsMake(Bar_HEIGHT, 0, 0, 0));
    }];
    
    self.friendTV.delegate = self;
    self.friendTV.dataSource = self;
    [self doGetFriendList];
}
- (void)doGetFriendList {
    NSString *path = [NSString stringWithFormat:@"%@/GetFriendList/v0001/?key=%@&steamid=%@&relationship=friend&format=json",STEAM_URL_USER, STEAM_APIKEY, STEAM_ID_WZJ];
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    NSLog(@"path = %@", path);
    [session GET:path
      parameters:nil
        progress:^(NSProgress * _Nonnull downloadProgress) {
            NSLog(@"NSProgress = %lld / %lld",downloadProgress.completedUnitCount, downloadProgress.totalUnitCount);
        }
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             NSDictionary *dic = [[NSDictionary alloc] initWithDictionary:responseObject];
             self.friendArray = [[NSMutableArray alloc] initWithArray:[[dic objectForKey:@"friendslist"] objectForKey:@"friends"]];
             [self doGetFriendStatus];
         }
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             NSLog(@"fail");
         }];
}
- (void)doGetFriendStatus {
    for (int i = 0; i<self.friendArray.count ;i++) {
        __block NSMutableDictionary *dic_b = [NSMutableDictionary dictionaryWithDictionary:[self.friendArray objectAtIndex:i]];
        __block NSMutableDictionary *playerDic_b = [NSMutableDictionary dictionaryWithDictionary:[dic_b objectForKey:@"info"]];
        NSString *path = [NSString stringWithFormat:@"%@/GetPlayerSummaries/v0002/?key=%@&steamids=%@&format=json", STEAM_URL_USER, STEAM_APIKEY, [dic_b objectForKey:@"steamid"]];
        AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
        [session GET:path
          parameters:nil
            progress:^(NSProgress * _Nonnull downloadProgress) {
            }
             success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                 NSDictionary *dic = [[NSDictionary alloc] initWithDictionary:responseObject];
                 playerDic_b = [[[dic objectForKey:@"response"] objectForKey:@"players"] objectAtIndex:0];
                 [dic_b setObject:playerDic_b forKey:@"info"];
                 if ([[playerDic_b objectForKey:@"personastate"] integerValue]>0 || [playerDic_b objectForKey:@"gameextrainfo"]) {
                     [self.friendArray_Online addObject:dic_b];
                 }
                 [self.friendArray replaceObjectAtIndex:i withObject:dic_b];
                 [self.friendTV reloadData];
             }
             failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                 NSLog(@"fail");
             }];
    }
}
- (void)rightClick:(UIBarButtonItem *)item {
    if (_online) {
        item.title = @"在线";
        _online = NO;
    } else {
        item.title = @"所有";
        _online = YES;
    }
    [self.friendTV reloadData];
}
#pragma mark - UITableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _online?self.friendArray_Online.count:self.friendArray.count;

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellId = @"SteamTableViewCell_GetFriendList";
    SteamTableViewCell_GetFriendList *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[SteamTableViewCell_GetFriendList alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId size:CGSizeMake(WIDTH(tableView), 60)];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSDictionary *dic = _online?[self.friendArray_Online objectAtIndex:indexPath.row]:[self.friendArray objectAtIndex:indexPath.row];
    NSDictionary *infoDic = [dic objectForKey:@"info"];
    [cell.avatarIV sd_setImageWithURL:URL([infoDic objectForKey:@"avatarfull"])];
    cell.nameLabel.text = [NSString stringWithFormat:@"%@",[infoDic objectForKey:@"personaname"]];
    if ([infoDic objectForKey:@"gameextrainfo"]) {
        cell.personastateLabel.text = [NSString stringWithFormat: @"状态：游戏中[%@]",[infoDic objectForKey:@"gameextrainfo"]];
    } else {
        switch ([[infoDic objectForKey:@"personastate"] integerValue]) {
            case 0:
                cell.personastateLabel.text = @"状态：离线";
                break;
            case 1:
                cell.personastateLabel.text = @"状态：在线";
                break;
            case 2:
                cell.personastateLabel.text = @"状态：忙碌";
                break;
            case 3:
                cell.personastateLabel.text = @"状态：离开";
                break;
            case 4:
                cell.personastateLabel.text = @"状态：打盹";
                break;
            case 5:
                cell.personastateLabel.text = @"状态：想交易";
                break;
            case 6:
                cell.personastateLabel.text = @"状态：想玩游戏";
                break;
            default:
                cell.personastateLabel.text = @"状态：未知";
                break;
        }
    }
    cell.timeLabel.text = [NSString stringWithFormat:@"%@",[NSDate dateStrWithUnixTime:[dic objectForKey:@"friend_since"]]];
    return cell;
}
- (void)setCell:(SteamTableViewCell_GetFriendList *)cell withDic:(NSDictionary *)dic indexPath:(NSIndexPath *)indexPath {
    cell.tag = 10000;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dic = _online?[self.friendArray_Online objectAtIndex:indexPath.row]:[self.friendArray objectAtIndex:indexPath.row];
    NSString *steamId = [NSString stringWithFormat:@"%@",[dic objectForKey:@"steamid"]];
    NSDictionary *playerDic = [dic objectForKey:@"info"];
    SteamViewController_GetPlayerSummaries *VC = [[SteamViewController_GetPlayerSummaries alloc] init];
    VC.steamId = steamId;
    VC.playerDic = playerDic;
    [self.navigationController pushViewController:VC animated:YES];
}

@end

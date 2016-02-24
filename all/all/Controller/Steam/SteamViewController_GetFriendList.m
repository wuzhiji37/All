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
    [super viewDidLoad];
    WS;
    self.title = @"我的好友";
    self.friendArray = [NSMutableArray array];
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
             [self.friendTV reloadData];
         }
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             NSLog(@"fail");
         }];
}
#pragma mark - UITableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.friendArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellId = [NSString stringWithFormat:@"SteamTableViewCell_GetFriendList%@",indexPath];
    SteamTableViewCell_GetFriendList *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[SteamTableViewCell_GetFriendList alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId size:CGSizeMake(WIDTH(tableView), 60)];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    __block NSMutableDictionary *dic_b = [NSMutableDictionary dictionaryWithDictionary:[self.friendArray objectAtIndex:indexPath.row]];
    __block NSMutableDictionary *playerDic_b = [NSMutableDictionary dictionaryWithDictionary:[dic_b objectForKey:@"info"]];
    
    NSLog(@"dic_b1 = %@",dic_b);
    id hasInfo = [dic_b objectForKey:@"info"];
    if (!hasInfo) {
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
                 [self.friendArray replaceObjectAtIndex:indexPath.row withObject:dic_b];
                 if (cell.tag != 10000) {
                     [self setCell:cell withDic:dic_b indexPath:indexPath];
                 }
             }
             failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                 [MBProgressHUD hideHUDForView:self.view animated:YES];
                 NSLog(@"fail");
             }];
    } else {
        if (cell.tag != 10000) {
            [self setCell:cell withDic:dic_b indexPath:indexPath];
        }
    }
    return cell;
}
- (void)setCell:(SteamTableViewCell_GetFriendList *)cell withDic:(NSDictionary *)dic indexPath:(NSIndexPath *)indexPath {
    cell.tag = 10000;
    NSDictionary *infoDic = [dic objectForKey:@"info"];
    NSLog(@"infoDic = %@, indexPath = %@", infoDic , indexPath);
    [cell.avatarIV sd_setImageWithURL:URL([infoDic objectForKey:@"avatarfull"])];
    cell.nameLabel.text = [NSString stringWithFormat:@"%@",[infoDic objectForKey:@"personaname"]];
    switch ([[dic objectForKey:@"personastate"] integerValue]) {
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
    cell.timeLabel.text = [NSString stringWithFormat:@"%@",[NSDate dateStrWithUnixTime:[dic objectForKey:@"friend_since"]]];
    [self.friendTV reloadData];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dic = [self.friendArray objectAtIndex:indexPath.row];
}

@end

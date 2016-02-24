//
//  SteamViewController_GetNewsForApp.m
//  all
//
//  Created by 吴智极 on 16/2/23.
//  Copyright © 2016年 吴智极. All rights reserved.
//

#import "SteamViewController_GetNewsForApp.h"
#import "SteamTableViewCell_GetNewsForApp.h"
#import "WebViewController.h"
@implementation SteamViewController_GetNewsForApp

- (void)viewDidLoad {
    [super viewDidLoad];
    WS;
    self.title = @"Steam新闻 - Dota 2";
    self.newsArray = @[];
    self.newsTV = [[UITableView alloc] init];
    self.newsTV.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.newsTV];
    [self.newsTV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakself.view).insets(UIEdgeInsetsMake(Bar_HEIGHT, 0, 0, 0));
    }];
    
    self.newsTV.delegate = self;
    self.newsTV.dataSource = self;
    [self doGetNewsForApp];
}
- (void)doGetNewsForApp {
    NSString *path = [NSString stringWithFormat:@"%@/GetNewsForApp/v0002/?appid=570&count=100&format=json",STEAM_URL_NEWS];
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    [session GET:path
      parameters:nil
        progress:^(NSProgress * _Nonnull downloadProgress) {
            NSLog(@"NSProgress = %lld / %lld",downloadProgress.completedUnitCount, downloadProgress.totalUnitCount);
        }
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             NSDictionary *dic = [[NSDictionary alloc] initWithDictionary:responseObject];
             self.newsArray = [[NSArray alloc] initWithArray:[[dic objectForKey:@"appnews"] objectForKey:@"newsitems"]];
             [self.newsTV reloadData];
         }
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             NSLog(@"fail");
         }];
}
#pragma mark - UITableView 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.newsArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"SteamTableViewCell_GetNewsForApp";
    SteamTableViewCell_GetNewsForApp *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[SteamTableViewCell_GetNewsForApp alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId size:CGSizeMake(WIDTH(tableView), 100)];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSDictionary *dic = [self.newsArray objectAtIndex:indexPath.row];
    cell.timeLabel.text = [NSDate dateStrWithUnixTimeTwoLine:[dic objectForKey:@"date"]];
    cell.authorLabel.text = [NSString stringWithFormat:@"%@ - %@",[dic objectForKey:@"author"],[dic objectForKey:@"feedlabel"]];
    cell.titleLabel.text = [NSString stringWithFormat:@"%@", [dic objectForKey:@"title"]];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dic = [self.newsArray objectAtIndex:indexPath.row];
    WebViewController *webVC = [[WebViewController alloc] initWithHTMLString:[NSString stringWithFormat:@"%@", [dic objectForKey:@"contents"]]];
    [self.navigationController pushViewController:webVC animated:YES];
}

@end

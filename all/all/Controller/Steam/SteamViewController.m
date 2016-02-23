//
//  SteamViewController.m
//  all
//
//  Created by 吴智极 on 16/2/23.
//  Copyright © 2016年 吴智极. All rights reserved.
//

#import "SteamViewController.h"

@implementation SteamViewController {
    NSArray *steamArray;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.hidesBottomBarWhenPushed = NO;
        steamArray = @[@"GetNewsForApp",
                       @"GetPlayerSummaries"];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    WS;
    self.title = @"Steam";
    self.steamTV = [[UITableView alloc] init];
    self.steamTV.backgroundColor = [UIColor whiteColor];
    self.steamTV.delegate = self;
    self.steamTV.dataSource = self;
    [self.view addSubview:self.steamTV];
    [self.steamTV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakself.view).insets(UIEdgeInsetsMake(Bar_HEIGHT, 0, -TabBar_HEIGHT, 0));
    }];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return steamArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellID = @"ClassTableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = [steamArray objectAtIndex:indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //NSString -> Class
    Class vcClass = NSClassFromString([NSString stringWithFormat:@"SteamViewController_%@",[steamArray objectAtIndex:indexPath.row]]);
    id vc = [[vcClass alloc] init];
    if (!vc) {
        NSLog(@"No VC %@",[steamArray objectAtIndex:indexPath.row]);
        return;
    }
    [self.navigationController pushViewController:vc animated:YES];
}
@end

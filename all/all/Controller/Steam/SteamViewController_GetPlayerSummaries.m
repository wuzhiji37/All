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
    [self doGetPlayerSummaries];
}
- (void)loadViews {
    WS;
    
    NSInteger margin = (WIDTH(self.view) - 184 - 64 - 32)/4;
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.scrollView];
    
    self.avatarfullIV = [[UIImageView alloc] init];
    self.avatarfullIV.backgroundColor = [UIColor redColor];
    [self.scrollView addSubview:self.avatarfullIV];
    
    self.avatarmediumIV = [[UIImageView alloc] init];
    self.avatarmediumIV.backgroundColor = [UIColor yellowColor];
    [self.scrollView addSubview:self.avatarmediumIV];
    
    self.avatarIV = [[UIImageView alloc] init];
    self.avatarIV.backgroundColor = [UIColor greenColor];
    [self.scrollView addSubview:self.avatarIV];
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakself.view).insets(UIEdgeInsetsMake(Bar_HEIGHT, 0, 0, 0));
    }];
    [self.avatarfullIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.scrollView.mas_top).offset(5);
        make.top.equalTo(@[weakself.avatarmediumIV, weakself.avatarIV]);
        make.left.equalTo(weakself.scrollView.mas_left).offset(margin);
        make.right.equalTo(weakself.avatarmediumIV.mas_left).offset(-margin);
        make.size.mas_equalTo(CGSizeMake(184, 184));
    }];
    [self.avatarmediumIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.avatarfullIV.mas_right).offset(margin);
        make.right.equalTo(weakself.avatarIV.mas_left).offset(-margin);
        make.size.mas_equalTo(CGSizeMake(64, 64));
    }];
    [self.avatarIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.avatarmediumIV.mas_right).offset(margin);
        make.right.equalTo(weakself.scrollView.mas_right).offset(-margin);
        make.size.mas_equalTo(CGSizeMake(32, 32));
    }];
    
    
}

- (void)doGetPlayerSummaries {
    NSString *path = [NSString stringWithFormat:@"%@/GetPlayerSummaries/v0002/?key=%@&steamids=%@&format=json", STEAM_URL_USER, STEAM_APIKEY, self.steamId];
    NSLog(@"path = %@",path);
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    [session GET:path
      parameters:nil
        progress:^(NSProgress * _Nonnull downloadProgress) {
            NSLog(@"NSProgress = %lld / %lld",downloadProgress.completedUnitCount, downloadProgress.totalUnitCount);
        }
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             NSDictionary *dic = [[NSDictionary alloc] initWithDictionary:responseObject];
             NSLog(@"dic = %@",dic);
         }
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             NSLog(@"fail");
         }];
}
@end

//
//  SteamViewController_GetOwnedGames.h
//  all
//
//  Created by 吴智极 on 16/2/25.
//  Copyright © 2016年 吴智极. All rights reserved.
//

#import "BasicViewController.h"

@interface SteamViewController_GetOwnedGames : BasicViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *gameTV;
@property (nonatomic, strong) NSArray *gameArray;
@property (nonatomic, strong) NSArray *gameArray_sorted;
@property (nonatomic, strong) NSString *steamId;
@end

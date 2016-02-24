//
//  SteamViewController_GetFriendList.h
//  all
//
//  Created by 吴智极 on 16/2/24.
//  Copyright © 2016年 吴智极. All rights reserved.
//

#import "BasicViewController.h"

@interface SteamViewController_GetFriendList : BasicViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *friendTV;
@property (nonatomic, strong) NSMutableArray *friendArray;
@end

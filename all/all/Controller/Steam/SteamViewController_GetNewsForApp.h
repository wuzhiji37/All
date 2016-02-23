//
//  SteamViewController_GetNewsForApp.h
//  all
//
//  Created by 吴智极 on 16/2/23.
//  Copyright © 2016年 吴智极. All rights reserved.
//

#import "BasicViewController.h"

@interface SteamViewController_GetNewsForApp : BasicViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *newsTV;
@property (nonatomic, strong) NSArray *newsArray;
@end

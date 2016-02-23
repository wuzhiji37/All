//
//  SteamViewController.h
//  all
//
//  Created by 吴智极 on 16/2/23.
//  Copyright © 2016年 吴智极. All rights reserved.
//

#import "BasicViewController.h"

@interface SteamViewController : BasicViewController <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) UITableView *steamTV;
@end

//
//  ClassViewController.h
//  all
//
//  Created by 吴智极 on 16/2/18.
//  Copyright © 2016年 吴智极. All rights reserved.
//

#import "BasicViewController.h"

@interface ClassViewController : BasicViewController <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) UITableView *classTV;
@end

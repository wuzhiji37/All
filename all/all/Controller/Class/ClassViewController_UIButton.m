//
//  ClassViewController_UIButton.m
//  all
//
//  Created by 吴智极 on 16/2/22.
//  Copyright © 2016年 吴智极. All rights reserved.
//

#import "ClassViewController_UIButton.h"
#import "ClassTableViewCell_Basic.h"
@interface ClassViewController_UIButton ()
{
    UIButton *_button;
}
@end

@implementation ClassViewController_UIButton

- (void)viewDidLoad {
    [super viewDidLoad];
    WS;
    self.objArray = @[@{@"name":@"text",
                        @"valueName":@[@"text1",
                                       @"text2",
                                       @"text3",
                                       @"text4"],
                        @"value":@[@"text1",
                                   @"text2text2text2text2text2text2text2",
                                   @"text3\ntext3\ntext3\ntext3\ntext3\ntext3",
                                   @"text4 text4 text4 text4 text4 text4"]},];
    _button = [[UIButton alloc] init];
    [self.objView addSubview:_button];
    _button.backgroundColor = [UIColor whiteColor];
    [_button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakself.objView).insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
    
    self.objTV.delegate = self;
    self.objTV.dataSource = self;

}

#pragma mark - UITableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellId = [@"ClassTableViewCell_UILabel" stringByAppendingFormat:@"%ld",(long)indexPath.row];
    ClassTableViewCell_Basic *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[ClassTableViewCell_Basic alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId size:CGSizeMake(WIDTH(tableView), 50)];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSDictionary *dic = [self.objArray objectAtIndex:indexPath.row];
    cell.propertyLabel.text = [dic objectForKey:@"name"];
    cell.valueNameArray = [dic objectForKey:@"valueName"];
    cell.valueArray = [dic objectForKey:@"value"];
    cell.valueLabel.text = [cell.valueNameArray objectAtIndex:cell.valueNumber];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ClassTableViewCell_Basic *cell = (ClassTableViewCell_Basic *)[tableView cellForRowAtIndexPath:indexPath];
    cell.valueNumber = (cell.valueNumber+1)%cell.valueArray.count;
    cell.valueLabel.text = [cell.valueNameArray objectAtIndex:cell.valueNumber];
    [_button setValue:[cell.valueArray objectAtIndex:cell.valueNumber] forKey:cell.propertyLabel.text];
    
}

@end

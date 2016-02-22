//
//  ClassViewController_UILabel.m
//  all
//
//  Created by 吴智极 on 16/2/18.
//  Copyright © 2016年 吴智极. All rights reserved.
//

#import "ClassViewController_UILabel.h"
#import "ClassTableViewCell_Basic.h"
@interface ClassViewController_UILabel ()
{
    UILabel *_label;
}
@end

@implementation ClassViewController_UILabel

- (void)viewDidLoad {
    [super viewDidLoad];
    self.objArray = @[@{@"name":@"text",
                        @"valueName":@[@"text1",
                                       @"text2",
                                       @"text3",
                                       @"text4"],
                        @"value":@[@"text1",
                                   @"text2text2text2text2text2text2text2",
                                   @"text3\ntext3\ntext3\ntext3\ntext3\ntext3",
                                   @"text4 text4 text4 text4 text4 text4"]},
                      @{@"name":@"font",
                        @"valueName":@[@"15",
                                       @"25",
                                       @"35"],
                        @"value":@[FONT(15),
                                   FONT(25),
                                   FONT(35)]},
                      @{@"name":@"textColor",
                        @"valueName":@[@"black",
                                       @"red",
                                       @"green",
                                       @"blue"],
                        @"value":@[[UIColor blackColor],
                                   [UIColor redColor],
                                   [UIColor greenColor],
                                   [UIColor blueColor]]},
                      @{@"name":@"shadowColor",
                        @"valueName":@[@"black",
                                       @"red",
                                       @"green",
                                       @"blue"],
                        @"value":@[[UIColor blackColor],
                                   [UIColor redColor],
                                   [UIColor greenColor],
                                   [UIColor blueColor]]},
                      @{@"name":@"shadowOffset",
                        @"valueName":@[@"(0,0)",
                                       @"(5,5)",
                                       @"(10,10)",
                                       @"(-5,-5)"],
                        @"value":@[[NSValue valueWithCGSize:CGSizeMake(0, 0)],
                                   [NSValue valueWithCGSize:CGSizeMake(5, 5)],
                                   [NSValue valueWithCGSize:CGSizeMake(10, 10)],
                                   [NSValue valueWithCGSize:CGSizeMake(-5, -5)]]},
                      @{@"name":@"textAlignment",
                        @"valueName":@[@"NSTextAlignmentLeft",
                                       @"NSTextAlignmentCenter",
                                       @"NSTextAlignmentRight",
                                       @"NSTextAlignmentJustified",
                                       @"NSTextAlignmentNatural"],
                        @"value":@[@(NSTextAlignmentLeft),
                                   @(NSTextAlignmentCenter),
                                   @(NSTextAlignmentRight),
                                   @(NSTextAlignmentJustified),
                                   @(NSTextAlignmentNatural)]},
                      
                      @{@"name":@"lineBreakMode",
                        @"valueName":@[@"NSLineBreakByWordWrapping",
                                       @"NSLineBreakByCharWrapping",
                                       @"NSLineBreakByClipping",
                                       @"NSLineBreakByTruncatingHead",
                                       @"NSLineBreakByTruncatingTail",
                                       @"NSLineBreakByTruncatingMiddle"],
                        @"value":@[@(NSLineBreakByWordWrapping),
                                   @(NSLineBreakByCharWrapping),
                                   @(NSLineBreakByClipping),
                                   @(NSLineBreakByTruncatingHead),
                                   @(NSLineBreakByTruncatingTail),
                                   @(NSLineBreakByTruncatingMiddle)]},
                      @{@"name":@"attributedText",
                        @"valueName":@[@"nil",
                                       @"AttributedString"],
                        @"value":@[[[NSAttributedString alloc] init],
                                   [[NSAttributedString alloc] initWithString:@"1234567890" attributes:@{NSFontAttributeName: [UIFont italicSystemFontOfSize:20]}]]},
                      @{@"name":@"highlightedTextColor",
                        @"valueName":@[@"black",
                                       @"red",
                                       @"green",
                                       @"blue"],
                        @"value":@[[[UIColor blackColor] colorWithAlphaComponent:0.5],
                                   [[UIColor redColor] colorWithAlphaComponent:0.5],
                                   [[UIColor greenColor] colorWithAlphaComponent:0.5],
                                   [[UIColor blueColor] colorWithAlphaComponent:0.5]]},
                      @{@"name":@"highlighted",
                        @"valueName":@[@"NO",
                                       @"YES"],
                        @"value":@[[NSNumber numberWithBool:NO],
                                   [NSNumber numberWithBool:YES]]},
                      @{@"name":@"userInteractionEnabled",
                        @"valueName":@[@"NO",
                                       @"YES"],
                        @"value":@[[NSNumber numberWithBool:NO],
                                   [NSNumber numberWithBool:YES]]},
                      @{@"name":@"enabled",
                        @"valueName":@[@"NO",
                                       @"YES"],
                        @"value":@[[NSNumber numberWithBool:NO],
                                   [NSNumber numberWithBool:YES]]},
                      @{@"name":@"numberOfLines",
                        @"valueName":@[@"0",
                                       @"1",
                                       @"2",
                                       @"3"],
                        @"value":@[[NSNumber numberWithInteger:0],
                                   [NSNumber numberWithInteger:1],
                                   [NSNumber numberWithInteger:2],
                                   [NSNumber numberWithInteger:3]]},
                      @{@"name":@"adjustsFontSizeToFitWidth",
                        @"valueName":@[@"NO",
                                       @"YES"],
                        @"value":@[[NSNumber numberWithBool:NO],
                                   [NSNumber numberWithBool:YES]]},
                      @{@"name":@"baselineAdjustment",
                        @"valueName":@[@"UIBaselineAdjustmentAlignBaselines",
                                       @"UIBaselineAdjustmentAlignCenters",
                                       @"UIBaselineAdjustmentNone"],
                        @"value":@[@(UIBaselineAdjustmentAlignBaselines),
                                   @(UIBaselineAdjustmentAlignCenters),
                                   @(UIBaselineAdjustmentNone)]},
                      @{@"name":@"minimumScaleFactor",
                        @"valueName":@[@"0.0",
                                       @"0.8",
                                       @"0.3"],
                        @"value":@[[NSNumber numberWithDouble:0.0],
                                   [NSNumber numberWithDouble:0.8],
                                   [NSNumber numberWithDouble:0.3]]},
                      @{@"name":@"allowsDefaultTighteningForTruncation",
                        @"valueName":@[@"NO",
                                       @"YES"],
                        @"value":@[[NSNumber numberWithBool:NO],
                                   [NSNumber numberWithBool:YES]]},
                      ];
    
    _label = [[UILabel alloc] init];
    [self.objView addSubview:_label];
    _label.backgroundColor = [UIColor whiteColor];
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.objView).insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
    
    self.objTV.delegate = self;
    self.objTV.dataSource = self;
};

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
    [_label setValue:[cell.valueArray objectAtIndex:cell.valueNumber] forKey:cell.propertyLabel.text];
    
}
@end


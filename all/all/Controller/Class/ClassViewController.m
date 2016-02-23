//
//  ClassViewController.m
//  all
//
//  Created by 吴智极 on 16/2/18.
//  Copyright © 2016年 吴智极. All rights reserved.
//

#import "ClassViewController.h"

#import "ClassViewController_UILabel.h"
#import "ClassViewController_UIButton.h"
@implementation ClassViewController {
    NSArray *classArray;
}
- (instancetype)init {
    self = [super init];
    if (self) {
        self.hidesBottomBarWhenPushed = NO;
        classArray = @[@"UILabel",
                      @"UIButton",
                      @"UISegmentedControl",
                      @"UITextField",
                      @"UISlider",
                      @"UISwitch",
                      @"UIActivityIndicatorView",
                      @"UIProgressView",
                      @"UIPageControl",
                      @"UIStepper",
                      @"UIPageControl",
                      @"UIStackView",
                      @"UITableView",
                      @"UITableViewCell",
                      @"UIImageView",
                      @"UICollectionView",
                      @"UICollectionViewCell",
                      @"UICollectionReusableView",
                      @"UITextView",
                      @"UIScrollView",
                      @"UIDatePicker",
                      @"UIPickerView",
                      @"MapKit",
                      @"GLKit",
                      @"iAd",
                      @"SceneKit",
                      @"UIWebView",
                      @"UISearchBar"];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    WS;
    self.title = @"Class";
    NSLog(@"ver = %@",@(IOS_VERSION));
    self.classTV = [[UITableView alloc] init];
    self.classTV.backgroundColor = [UIColor whiteColor];
    self.classTV.delegate = self;
    self.classTV.dataSource = self;
    [self.view addSubview:self.classTV];
    [self.classTV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakself.view).insets(UIEdgeInsetsMake(Bar_HEIGHT, 0, -TabBar_HEIGHT, 0));
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return classArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellID = @"ClassTableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = [classArray objectAtIndex:indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //NSString -> Class
    Class vcClass = NSClassFromString([NSString stringWithFormat:@"ClassViewController_%@",[classArray objectAtIndex:indexPath.row]]);
    id vc = [[vcClass alloc] init];
    if (!vc) {
        NSLog(@"No VC %@",[classArray objectAtIndex:indexPath.row]);
        return;
    }
    [self.navigationController pushViewController:vc animated:YES];
}

@end

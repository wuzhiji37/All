//
//  ClassTableViewCell_Basic.h
//  all
//
//  Created by 吴智极 on 16/2/22.
//  Copyright © 2016年 吴智极. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClassTableViewCell_Basic : UITableViewCell
@property (nonatomic, strong) UILabel *propertyLabel;
@property (nonatomic, strong) UILabel *valueLabel;
@property (nonatomic, strong) NSArray *valueNameArray;
@property (nonatomic, strong) NSArray *valueArray;
@property (nonatomic, assign) NSInteger valueNumber;
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier size:(CGSize)size;
@end

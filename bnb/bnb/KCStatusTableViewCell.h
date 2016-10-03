//
//  KCStatusTableViewCell.h
//  bnb
//
//  Created by 谭 卓勋 on 16/9/25.
//  Copyright (c) 2016年 Tidus. All rights reserved.
//

#import <UIKit/UIKit.h>
@class KCStatus;
@interface KCStatusTableViewCell : UITableViewCell

#pragma mark 微博对象
@property (nonatomic,strong) KCStatus *status;

#pragma mark 单元格高度
@property (assign,nonatomic) CGFloat height;
@end

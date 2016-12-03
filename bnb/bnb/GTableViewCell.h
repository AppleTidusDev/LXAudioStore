//
//  GTableViewCell.h
//  bnb
//
//  Created by 谭 卓勋 on 16/11/1.
//  Copyright (c) 2016年 Tidus. All rights reserved.
//

#import <UIKit/UIKit.h>
@class G;
@interface GTableViewCell : UITableViewCell
@property (nonatomic,strong) G *status;

#pragma mark 单元格高度
@property (assign,nonatomic) CGFloat height;

@end

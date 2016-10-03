//
//  KCContactGroup.h
//  bnb
//
//  Created by 谭 卓勋 on 16/9/20.
//  Copyright (c) 2016年 Tidus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "KCContact.h"
@interface KCContactGroup : NSObject
#pragma mark 组名
@property (nonatomic,copy) NSString *name;

#pragma mark 分组描述
@property (nonatomic,copy) NSString *detail;

#pragma mark 联系人
@property (nonatomic,strong) NSMutableArray *contacts;

@property(nonatomic,copy)UIButton *button;
#pragma mark 带参数个构造函数
-(KCContactGroup *)initWithName:(NSString *)name andButton:(UIButton*)button andDetail:(NSString *)detail andContacts:(NSMutableArray *)contacts;

#pragma mark 静态初始化方法
+(KCContactGroup *)initWithName:(NSString *)name andButton:(UIButton*)button andDetail:(NSString *)detail andContacts:(NSMutableArray *)contacts;
@end

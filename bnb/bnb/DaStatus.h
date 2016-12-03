//
//  DaStatus.h
//  bnb
//
//  Created by 谭 卓勋 on 16/10/29.
//  Copyright (c) 2016年 Tidus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DaStatus : NSObject
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *add;
@property (nonatomic,copy) NSString *statu;
@property(nonatomic,copy)NSString *day;
@property (nonatomic,copy) NSString *time;
@property (nonatomic,copy) NSString *sa;
@property(nonatomic,copy)NSString *pro;
@property (nonatomic,copy)NSString *detail;
@property(nonatomic,copy)NSString *money;
@property(nonatomic,copy)NSString *pay;


#pragma mark - 方法
#pragma mark 根据字典初始化微博对象
-(DaStatus *)initWithDictionary:(NSDictionary *)dic;

#pragma mark 初始化微博对象（静态方法）
+(DaStatus *)statusWithDictionary:(NSDictionary *)dic;


@end

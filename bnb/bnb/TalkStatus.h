//
//  TalkStatus.h
//  bnb
//
//  Created by 谭 卓勋 on 16/10/26.
//  Copyright (c) 2016年 Tidus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TalkStatus : NSObject
@property (nonatomic,assign) long long Id;
@property (nonatomic,copy) NSString *label;
@property (nonatomic,copy) NSString *level;
@property (nonatomic,copy) NSString *name;
@property(nonatomic,copy)NSString *day;
@property (nonatomic,copy) NSString *time;
@property (nonatomic,copy) NSString *title;
@property(nonatomic,copy)NSString *number;


#pragma mark - 方法
#pragma mark 根据字典初始化微博对象
-(TalkStatus *)initWithDictionary:(NSDictionary *)dic;

#pragma mark 初始化微博对象（静态方法）
+(TalkStatus *)statusWithDictionary:(NSDictionary *)dic;



@end

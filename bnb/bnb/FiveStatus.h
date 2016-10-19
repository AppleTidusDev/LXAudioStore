//
//  FiveStatus.h
//  bnb
//
//  Created by 谭 卓勋 on 16/10/14.
//  Copyright (c) 2016年 Tidus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FiveStatus : NSObject
@property (nonatomic,assign) long long Id;
@property (nonatomic,copy) NSString *words1;
@property (nonatomic,copy) NSString *words2;
@property (nonatomic,copy) NSString *line1;
@property(nonatomic,copy)NSString *number1;
@property (nonatomic,copy) NSString *number2;
@property (nonatomic,copy) NSString *left;
@property (nonatomic,copy) NSString *right;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *p1;
@property (nonatomic,copy) NSString *p2;
@property(nonatomic,copy)NSString *p3;
@property (nonatomic,copy) NSString *p4;
@property (nonatomic,copy) NSString *w1;
@property (nonatomic,copy) NSString *w2;
@property (nonatomic,copy) NSString *w3;
@property (nonatomic,copy) NSString *w4;
@property(nonatomic,copy)NSString *line2;
@property (nonatomic,copy) NSString *line3;
@property (nonatomic,copy) NSString *line4;
@property(nonatomic,copy)NSString *line0;




#pragma mark - 方法
#pragma mark 根据字典初始化微博对象
-(FiveStatus *)initWithDictionary:(NSDictionary *)dic;

#pragma mark 初始化微博对象（静态方法）
+(FiveStatus *)statusWithDictionary:(NSDictionary *)dic;


@end

//
//  G.h
//  bnb
//
//  Created by 谭 卓勋 on 16/11/1.
//  Copyright (c) 2016年 Tidus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface G : NSObject
@property (nonatomic,copy) NSString *text0;
@property (nonatomic,copy) NSString *time0;
@property (nonatomic,copy) NSString *text1;
@property(nonatomic,copy)  NSString *time1;
@property (nonatomic,copy) NSString *text2;
@property (nonatomic,copy) NSString *time2;
@property (nonatomic,copy) NSString *text3;
@property (nonatomic,copy) NSString *time3;
@property (nonatomic,copy) NSString *text4;
@property (nonatomic,copy) NSString *time4;
@property(nonatomic,copy)  NSString *text5;
@property (nonatomic,copy) NSString *time5;
@property (nonatomic,copy) NSString *text6;
@property (nonatomic,copy) NSString *time6;
@property (nonatomic,copy) NSString *text7;
@property (nonatomic,copy) NSString *time7;
@property (nonatomic,copy) NSString *text8;
@property(nonatomic,copy)  NSString *time8;
@property (nonatomic,copy) NSString *hotpoint;
@property (nonatomic,copy) NSString *point0 ;
@property (nonatomic,copy) NSString *point1 ;
@property (nonatomic,copy) NSString *point2 ;
@property (nonatomic,copy) NSString *point3 ;
@property (nonatomic,copy) NSString *point4 ;
@property (nonatomic,copy) NSString *point5 ;
@property (nonatomic,copy) NSString *point6 ;
@property (nonatomic,copy) NSString *point7 ;
@property (nonatomic,copy) NSString *sl0;
@property (nonatomic,copy) NSString *sl1;
@property (nonatomic,copy) NSString *sl2;
@property (nonatomic,copy) NSString *sl3;
@property (nonatomic,copy) NSString *sl4;
@property (nonatomic,copy) NSString *sl5;
@property (nonatomic,copy) NSString *sl6;
@property (nonatomic,copy) NSString *sl7;
@property(nonatomic,copy)NSString *ssl;


#pragma mark - 方法
#pragma mark 根据字典初始化微博对象
-(G *)initWithDictionary:(NSDictionary *)dic;

#pragma mark 初始化微博对象（静态方法）
+(G *)statusWithDictionary:(NSDictionary *)dic;


@end

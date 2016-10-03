//
//  KCStatus.h
//  bnb
//
//  Created by 谭 卓勋 on 16/9/25.
//  Copyright (c) 2016年 Tidus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KCStatus : NSObject
@property (nonatomic,assign) long long Id;
@property (nonatomic,copy) NSString *wordsP;
@property (nonatomic,copy) NSString *readingP;
@property (nonatomic,copy) NSString *words;
@property(nonatomic,copy)NSString *reading;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *text;
@property (nonatomic,copy) NSString *product;



#pragma mark - 方法
#pragma mark 根据字典初始化微博对象
-(KCStatus *)initWithDictionary:(NSDictionary *)dic;

#pragma mark 初始化微博对象（静态方法）
+(KCStatus *)statusWithDictionary:(NSDictionary *)dic;
@end

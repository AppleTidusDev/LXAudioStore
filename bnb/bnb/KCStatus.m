//
//  KCStatus.m
//  bnb
//
//  Created by 谭 卓勋 on 16/9/25.
//  Copyright (c) 2016年 Tidus. All rights reserved.
//

#import "KCStatus.h"

@implementation KCStatus
-(KCStatus *)initWithDictionary:(NSDictionary *)dic{
    if(self=[super init]){
        self.Id=[dic[@"Id"] longLongValue];
        self.wordsP=dic[@"wordsP"];
        self.readingP=dic[@"readingP"];
        self.words=dic[@"words"];
        self.reading=dic[@"reading"];
        self.title=dic[@"title"];
        self.text=dic[@"text"];
        self.product=dic[@"product"];
    }
    return self;
}

#pragma mark 初始化微博对象（静态方法）
+(KCStatus *)statusWithDictionary:(NSDictionary *)dic{
    KCStatus *status=[[KCStatus alloc]initWithDictionary:dic];
    return status;
}

@end

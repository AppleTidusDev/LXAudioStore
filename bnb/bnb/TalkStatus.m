//
//  TalkStatus.m
//  bnb
//
//  Created by 谭 卓勋 on 16/10/26.
//  Copyright (c) 2016年 Tidus. All rights reserved.
//

#import "TalkStatus.h"

@implementation TalkStatus
-(TalkStatus *)initWithDictionary:(NSDictionary *)dic{
    if(self=[super init]){
        self.Id=[dic[@"Id"] longLongValue];
        self.label=dic[@"label"];
        self.name=dic[@"name"];
        self.level=dic[@"level"];
        self.day=dic[@"day"];
        self.title=dic[@"title"];
        self.number=dic[@"number"];
        self.time=dic[@"time"];
    }
    return self;
}

#pragma mark 初始化微博对象（静态方法）
+(TalkStatus *)statusWithDictionary:(NSDictionary *)dic{
    TalkStatus *status=[[TalkStatus alloc]initWithDictionary:dic];
    return status;
}
@end

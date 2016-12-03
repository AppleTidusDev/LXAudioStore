//
//  DaStatus.m
//  bnb
//
//  Created by 谭 卓勋 on 16/10/29.
//  Copyright (c) 2016年 Tidus. All rights reserved.
//

#import "DaStatus.h"

@implementation DaStatus
-(DaStatus *)initWithDictionary:(NSDictionary *)dic{
    if(self=[super init]){
        self.statu=dic[@"statu"];
        self.name=dic[@"name"];
        self.add=dic[@"add"];
        self.day=dic[@"day"];
        self.time=dic[@"time"];
        self.pro=dic[@"pro"];
        self.sa=dic[@"sa"];
        self.detail=dic[@"detail"];
        self.money=dic[@"money"];
        self.pay=dic[@"pay"];
    }
    return self;
}

#pragma mark 初始化微博对象（静态方法）
+(DaStatus *)statusWithDictionary:(NSDictionary *)dic{
    DaStatus *status=[[DaStatus alloc]initWithDictionary:dic];
    return status;
}

@end

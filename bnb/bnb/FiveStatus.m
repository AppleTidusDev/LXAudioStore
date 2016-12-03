//
//  FiveStatus.m
//  bnb
//
//  Created by 谭 卓勋 on 16/10/14.
//  Copyright (c) 2016年 Tidus. All rights reserved.
//

#import "FiveStatus.h"

@implementation FiveStatus
-(FiveStatus *)initWithDictionary:(NSDictionary *)dic{
    if(self=[super init]){
        self.Id=[dic[@"Id"] longLongValue];
        self.words1=dic[@"words1"];
        self.words2=dic[@"words2"];
        self.line1=dic[@"line1"];
        self.number1=dic[@"number1"];
        self.title=dic[@"title"];
        self.number2=dic[@"number2"];
        self.left=dic[@"left"];
        self.right=dic[@"right"];
        self.p1=dic[@"p1"];
        self.p2=dic[@"p2"];
        self.p3=dic[@"p3"];
        self.p4=dic[@"p4"];
        self.w1=dic[@"w1"];
        self.w2=dic[@"w2"];
        self.w3=dic[@"w3"];
        self.w4=dic[@"w4"];
        self.line2=dic[@"line2"];
        self.line3=dic[@"line3"];
        self.line4=dic[@"line4"];
        self.line0=dic[@"line0"];
    }
    return self;
}

#pragma mark 初始化微博对象（静态方法）
+(FiveStatus *)statusWithDictionary:(NSDictionary *)dic{
    FiveStatus *status=[[FiveStatus alloc]initWithDictionary:dic];
    return status;
}

@end

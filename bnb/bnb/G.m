//
//  G.m
//  bnb
//
//  Created by 谭 卓勋 on 16/11/1.
//  Copyright (c) 2016年 Tidus. All rights reserved.
//

#import "G.h"

@implementation G
-(G *)initWithDictionary:(NSDictionary *)dic{
    if(self=[super init]){
        self.text0=dic[@"text0"] ;
        self.text1=dic[@"text1"];
        self.text2=dic[@"text2"];
        self.text3=dic[@"text3"];
        self.text4=dic[@"text4"];
        self.text5=dic[@"text5"];
        self.text6=dic[@"text6"];
        self.text7=dic[@"text7"];
        self.text8=dic[@"text8"];
        self.time0=dic[@"time0"];
        self.time1=dic[@"time1"];
        self.time2=dic[@"time2"];
        self.time3=dic[@"time3"];
        self.time4=dic[@"time4"];
        self.time5=dic[@"time5"];
        self.time6=dic[@"time6"];
        self.time7=dic[@"time7"];
        self.time8=dic[@"time8"];
        self.point0=dic[@"point0"];
        self.point1=dic[@"point1"];
        self.point2=dic[@"point2"];
        self.point3=dic[@"point3"];
        self.point4=dic[@"point4"];
        self.point5=dic[@"point5"];
        self.point6=dic[@"point6"];
        self.point7=dic[@"point7"];
        
        self.hotpoint=dic[@"hotpoint"];
        self.sl0=dic[@"sl0"];
        self.sl1=dic[@"sl1"];
        self.sl2=dic[@"sl2"];
        self.sl3=dic[@"sl3"];
        self.sl4=dic[@"sl4"];
        self.sl5=dic[@"sl5"];
        self.sl6=dic[@"sl6"];
        self.sl7=dic[@"sl7"];
        self.ssl=dic[@"ssl"];
    }
    return self;
}

#pragma mark 初始化微博对象（静态方法）
+(G *)statusWithDictionary:(NSDictionary *)dic{
    G *status=[[G alloc]initWithDictionary:dic];
    return status;
}
@end

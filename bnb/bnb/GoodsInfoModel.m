//
//  GoodsInfoModel.m
//  bnb
//
//  Created by 谭 卓勋 on 16/9/28.
//  Copyright (c) 2016年 Tidus. All rights reserved.
//

#import "GoodsInfoModel.h"

@implementation GoodsInfoModel
-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init])
    {
        self.imageName = dict[@"imageName"];
        self.goodsTitle = dict[@"goodsTitle"];
        self.goodsPrice = dict[@"goodsPrice"];
        self.goodsNum = [dict[@"goodsNum"]integerValue];
        self.selectState = [dict[@"selectState"]boolValue];
        self.allNum=[dict[@"allNum"]integerValue];
        self.remainedNum=[dict[@"remainedNum"]integerValue];
    }
    
    return  self;
}
@end

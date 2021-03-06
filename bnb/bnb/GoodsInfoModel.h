//
//  GoodsInfoModel.h
//  bnb
//
//  Created by 谭 卓勋 on 16/9/28.
//  Copyright (c) 2016年 Tidus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoodsInfoModel : NSObject
@property(strong,nonatomic)NSString *imageName;//商品图片
@property(strong,nonatomic)NSString *goodsTitle;//商品标题
@property(strong,nonatomic)NSString *goodsPrice;//商品单价
@property(assign,nonatomic)BOOL selectState;//是否选中状态
@property(assign,nonatomic)NSInteger goodsNum;//商品个数
@property(assign,nonatomic)NSInteger allNum;//全部个数
@property(assign,nonatomic)NSInteger remainedNum;//还需个数
-(instancetype)initWithDict:(NSDictionary *)dict;
@end

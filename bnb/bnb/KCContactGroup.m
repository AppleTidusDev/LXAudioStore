//
//  KCContactGroup.m
//  bnb
//
//  Created by 谭 卓勋 on 16/9/20.
//  Copyright (c) 2016年 Tidus. All rights reserved.
//

#import "KCContactGroup.h"

@implementation KCContactGroup
-(KCContactGroup *)initWithName:(NSString *)name andButton:(UIButton*)button andDetail:(NSString *)detail andContacts:(NSMutableArray *)contacts{
    if (self=[super init]) {
        self.name=name;
        self.detail=detail;
        self.contacts=contacts;
        self.button=button;
    }
    return self;
}

+(KCContactGroup *)initWithName:(NSString *)name andButton:(UIButton*)button andDetail:(NSString *)detail andContacts:(NSMutableArray *)contacts{
    KCContactGroup *group1=[[KCContactGroup alloc]initWithName:name andButton:(UIButton*)button andDetail:detail andContacts:contacts];
    return group1;
}
@end

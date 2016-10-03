//
//  FourLines.m
//  Persistence
//
//  Created by 谭 卓勋 on 16/9/2.
//  Copyright (c) 2016年 Tidus. All rights reserved.
//

#import "FourLines.h"
static NSString *const kLinesKey =@"kLineKey";

@implementation FourLines


-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.lines forKey:kLinesKey];
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    self=[super init];
    if(self){
        self.lines=[aDecoder decodeObjectForKey:kLinesKey];
    }
    return self;
}



-(id)copyWithZone:(NSZone *)zone{
    FourLines *copy=[[[self class ]allocWithZone:zone]init];
    NSMutableArray *lineCopy=[NSMutableArray array];
    for(id line in self.lines){
        [lineCopy addObject:[line copyWithZone:zone]];
        
    }
    copy.lines=lineCopy;
    return  copy;
}
@end

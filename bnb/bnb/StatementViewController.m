//
//  StatementViewController.m
//  bnb
//
//  Created by 谭 卓勋 on 16/9/28.
//  Copyright (c) 2016年 Tidus. All rights reserved.
//

#import "StatementViewController.h"
#import "SC.pch"
@interface StatementViewController ()
@end

@implementation StatementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    UILabel *allPrice=[[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 160)];
    allPrice.text= [NSString stringWithFormat:@"-----%ld-------",(long)self.price];
    [self.view addSubview:allPrice];
    
}/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

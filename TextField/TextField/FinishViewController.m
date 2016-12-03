//
//  FinishViewController.m
//  TextField
//
//  Created by 谭 卓勋 on 16/11/15.
//  Copyright (c) 2016年 Tidus. All rights reserved.
//

#import "FinishViewController.h"

@interface FinishViewController ()

@end

@implementation FinishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor grayColor];
    UIView *whiteView=[[UIView alloc]initWithFrame:CGRectMake(10, 40, 350, 250)];
    whiteView.backgroundColor=[UIColor whiteColor];
    UILabel *bigL=[[UILabel alloc]initWithFrame:CGRectMake(100, 60, 200, 20)];
    bigL.font=[UIFont systemFontOfSize:20];
    bigL.text=@"你的订单已完成";
    [whiteView addSubview:bigL];
    UILabel *smallL=[[UILabel alloc]initWithFrame:CGRectMake(130, 110, 100, 10)];
    smallL.font=[UIFont systemFontOfSize:10];
    smallL.textColor=[UIColor grayColor];
    smallL.text=@"我们快尽快发货";
    [whiteView addSubview:smallL];
    UIImage *nike=[UIImage imageNamed:@"nike.png"];
    UIImageView *nikeV=[[UIImageView alloc]initWithFrame:CGRectMake(60, 60, 30, 30)];
    nikeV.image=nike;
    [whiteView addSubview:nikeV];
    [self.view addSubview:whiteView];
    
    UIButton *redButton=[[UIButton alloc]initWithFrame:CGRectMake(10, 310, 350, 40)];
    redButton.backgroundColor=[UIColor redColor];
    [redButton setTitle:@"确定" forState:UIControlStateNormal];
    [redButton addTarget:self action:@selector(tag:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:redButton];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  ViewController.m
//  mytimeline
//
//  Created by 谭 卓勋 on 16/10/30.
//  Copyright (c) 2016年 Tidus. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *times = @[@"sun",@"mon",@"tue",@"wed",@"thr",@"fri",@"sat"];
    NSArray *descriptions = @[@"state 1",@"state 2",@"state 3",@"state 4",@"very very long description if state 5",@"state 6",@"state 7"];
    TimeLineViewControl *timezone = [[TimeLineViewControl alloc] initWithTimeArray:times
                                                           andTimeDescriptionArray:descriptions
                                                                  andCurrentStatus:4];
    timezone. = self.view.center;
    [self.view addSubview:timezone];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

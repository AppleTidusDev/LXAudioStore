//
//  ViewController.m
//  TextField
//
//  Created by 谭 卓勋 on 16/11/13.
//  Copyright (c) 2016年 Tidus. All rights reserved.
//

#import "ViewController.h"
#import "FinishViewController.h"
@interface ViewController ()<UITextFieldDelegate>
{
    UITextField *topTX;
    
    NSMutableArray *dataSource;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
      self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"支付";
    
    dataSource = [[NSMutableArray alloc] initWithCapacity:10];
    UILabel *textLabel=[[UILabel alloc]initWithFrame:CGRectMake(120, 50, 200, 30)];
    textLabel.text=@"请输入支付密码：";
    textLabel.font=[UIFont systemFontOfSize:20];
    [self.view addSubview:textLabel];
    [self setUI];
    UIButton *redButton=[[UIButton alloc]initWithFrame:CGRectMake(10, 170, 350, 40)];
    redButton.backgroundColor=[UIColor redColor];
    [redButton setTitle:@"确定" forState:UIControlStateNormal];
    [redButton addTarget:self action:@selector(tag:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:redButton];
}
-(void)tag:(id)sender{
    FinishViewController *logonView = [[FinishViewController alloc]init];
    [self presentViewController:logonView animated:YES completion:nil];
}
- (void)setUI
{
    topTX = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    topTX.hidden = YES;
    topTX.keyboardType = UIKeyboardTypeNumberPad;
    [topTX addTarget:self action:@selector(txchange:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:topTX];
    
    //进入界面，topTX成为第一响应
    [topTX becomeFirstResponder];
    
    for (int i = 0; i < 6; i++)
    {
        UITextField *pwdLabel = [[UITextField alloc] initWithFrame:CGRectMake(10+i*60, 100, 60, 60)];
        pwdLabel.layer.borderColor = [UIColor grayColor].CGColor;
        pwdLabel.enabled = NO;
        pwdLabel.textAlignment = NSTextAlignmentCenter;//居中
        pwdLabel.secureTextEntry = YES;//设置密码模式
        pwdLabel.layer.borderWidth = 1;
        [self.view addSubview:pwdLabel];
        
        [dataSource addObject:pwdLabel];
    }
}
- (void)txchange:(UITextField *)tx
{
    NSString *password = tx.text;
    
    if (password.length == dataSource.count)
    {
        [tx resignFirstResponder];//隐藏键盘
    }
    
    for (int i = 0; i < dataSource.count; i++)
    {
        UITextField *pwdtx = [dataSource objectAtIndex:i];
        if (i < password.length)
        {
            NSString *pwd = [password substringWithRange:NSMakeRange(i, 1)];
            pwdtx.text = pwd;
        }
        
    }
    
    if (password.length == 6)
    {
        [tx resignFirstResponder];//隐藏键盘
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

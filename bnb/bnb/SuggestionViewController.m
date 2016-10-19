//
//  SuggestionViewController.m
//  bnb
//
//  Created by 谭 卓勋 on 16/10/19.
//  Copyright (c) 2016年 Tidus. All rights reserved.
//

#import "SuggestionViewController.h"

@interface SuggestionViewController ()

@end

@implementation SuggestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavigationbar];
    self.view.backgroundColor=[UIColor grayColor];
    
    UITextField *textN = [[UITextField alloc]initWithFrame:CGRectMake(10 , 80, self.view.frame.size.width-20, 30)];
    textN.borderStyle = UITextBorderStyleRoundedRect;
      textN.placeholder = @"商品型号";
    [self.view addSubview:textN];
    
    UITextField *textM=[[UITextField alloc]initWithFrame:CGRectMake(10, 110, self.view.frame.size.width-20, 80)];
    textM.borderStyle=UITextBorderStyleRoundedRect;
      textM.placeholder = @"商品咨询";
                       [self.view addSubview:textM];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)setNavigationbar
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    UINavigationBar *navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, screenRect.size.width, 60)];
    navigationBar.barTintColor=[UIColor redColor];
    //创建UINavigationItem
    UINavigationItem * navigationBarTitle = [[UINavigationItem alloc] initWithTitle:@"咨询／建议"];
    [navigationBar pushNavigationItem: navigationBarTitle animated:YES];
    [self.view addSubview: navigationBar];
    //创建UIBarButton 可根据需要选择适合自己的样式
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(back)];
    //设置barbutton
    leftItem.tintColor=[UIColor whiteColor];
    navigationBarTitle.leftBarButtonItem = leftItem;
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc ]initWithTitle:@"发送" style:UIBarButtonItemStyleDone target:self action:@selector(send)];
    rightItem.tintColor=[UIColor whiteColor];
    navigationBarTitle.rightBarButtonItem=rightItem;
    [navigationBar setItems:[NSArray arrayWithObject: navigationBarTitle]];
    
}
-(void)back
{
    //下面这行代码作用就是将弹出的模态视图移除，第一个yes表示移除的时候有动画效果，第二参数是设置一个回调，当模态视图移除消失后，会回到这里，可以在这里随便写句话打个断点，试一下就知道确实会回调到这个方法
    //    [self dismissViewControllerAnimated:YES completion:nil]; 或带有回调的如下方法
    [self dismissViewControllerAnimated:YES completion:^{
        
        NSLog(@"back");//这里打个断点，点击按钮模态视图移除后会回到这里
        //ios 5.0以上可以用该方法
    }];
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

//
//  DetailViewController.m
//  bnb
//
//  Created by 谭 卓勋 on 16/10/19.
//  Copyright (c) 2016年 Tidus. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView *myscrollview;
@property(nonatomic,strong)UITableView *leftTable;
@property(nonatomic,strong)UITableView *rightTable;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   self.navigationItem.title=@"商品详细";
        UIBarButtonItem *rightBarItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"more.png"] style:UIBarButtonItemStylePlain target:nil action:nil];
    rightBarItem.tintColor=[UIColor whiteColor];
    [self.navigationItem setRightBarButtonItem:rightBarItem];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [self setScrollerView];
    self.view.backgroundColor=[UIColor whiteColor];
    UILabel *text=[[UILabel alloc]initWithFrame:CGRectMake(10, 390, self.view.frame.size.width-20, 50)];
    text.text=@"Bule/dio蓝弦a新品时尚个方面";
    [self.view addSubview:text];
    
    UILabel *money=[[UILabel alloc]initWithFrame:CGRectMake(10, 430, 80, 30)];
    money.text=@"$559";
    
    [self.view addSubview:money];
    [self setTabbar];
    
        
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setScrollerView{
    _myscrollview = [[UIScrollView alloc]initWithFrame:CGRectMake(10, 0, self.view.frame.size.width-10, 400)];
    _myscrollview.directionalLockEnabled = NO; //只能一个方向滑动
    _myscrollview.pagingEnabled = YES; //是否翻页
    _myscrollview.backgroundColor = [UIColor blackColor];
    _myscrollview.showsVerticalScrollIndicator =NO; //垂直方向的滚动指示
    _myscrollview.indicatorStyle = UIScrollViewIndicatorStyleWhite;//滚动指示的风格
    _myscrollview.showsHorizontalScrollIndicator = NO;//水平方向的滚动指示
    _myscrollview.delegate = self;
    CGSize newSize = CGSizeMake(self.view.frame.size.width+1200, 30);
    [_myscrollview setContentSize:newSize];
    _myscrollview.backgroundColor=[UIColor whiteColor];
    UIImage *image1=[UIImage imageNamed:@"耳机.jpg"];
    
    UIImage *image2=[UIImage imageNamed:@"耳机.jpg"];
    
    UIImage *image3=[UIImage imageNamed:@"耳机.jpg"];
    
    UIImage *image4=[UIImage imageNamed:@"耳机.jpg"];
    NSArray *pickerArrary=@[image1,image2,image3,image4];
    
    //显示内容大小
    
    for(int i=0;i<pickerArrary.count;i++)
        
    {
        UIImageView *imageView=[[UIImageView alloc] initWithImage:pickerArrary[i]];
        //图片显示形式
        
        imageView.contentMode=UIViewContentModeTop;
        //图片显示范围
        
        imageView.frame=CGRectMake(i*self.view.frame.size.width, 30, self.view.frame.size.width,150);
        
        //加到scrollView中
        
        [_myscrollview addSubview:imageView];
        [self.view addSubview:_myscrollview];
    }
    CGPoint point=_myscrollview.contentOffset;
    
    //移动不能超过左边;
    
    if(point.x<0)
        
    {
        
        point.x=0;
        
        _myscrollview.contentOffset=point;
        
    }
    //移动不能超过右边
    
    if(point.x>(pickerArrary.count-1)*self.view.frame.size.width)
        
    {
        
        point.x=self.view.frame.size.width*(pickerArrary.count-1);
        
        _myscrollview.contentOffset=point;
        
    }
    
    NSInteger o=round(point.x/self.view.frame.size.width);
    
    UILabel *c=[[UILabel alloc ]initWithFrame:CGRectMake(280, 350, 20, 20)];
    NSString *s = [NSString stringWithFormat:@"%ld",o];
    c.text=s;
    [self.view addSubview:c];
    
    UILabel *q=[[UILabel alloc]initWithFrame:CGRectMake(300, 350, 20, 20)];
    q.text=@"/4";
    [self.view addSubview:q];
    
    NSString *picPath=[[NSBundle mainBundle]pathForResource:@"round" ofType:@"png"];
    UIImage  *round=[[UIImage alloc]initWithContentsOfFile:picPath];
    UIImageView *roundView=[[UIImageView alloc ]initWithFrame:CGRectMake(270, 320, 40, 40)];
    roundView.image=round;
    
    [self.view addSubview:roundView];
}

-(void)setTabbar{
    UIButton *zimuhei=[UIButton buttonWithType:UIButtonTypeCustom];
    zimuhei.frame=CGRectMake(50, 450, 120, 60);
    [zimuhei setTitle:@"字母黑" forState:UIControlStateNormal];
    [zimuhei setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [zimuhei setTitleColor:[UIColor  blackColor] forState:UIControlStateHighlighted];
    zimuhei.showsTouchWhenHighlighted = YES;
    [zimuhei addTarget:self action:@selector(buttonDonwRecover:) forControlEvents:UIControlEventTouchUpInside]; //button 点击回调方法
    

    [self.view addSubview:zimuhei];
    
    UIButton *xuancaibai=[UIButton buttonWithType:UIButtonTypeCustom];
    xuancaibai.frame=CGRectMake(130, 450, 120,60);
    [xuancaibai setTitle:@"炫彩白" forState:UIControlStateNormal];
                          [xuancaibai setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
                          [xuancaibai setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
                          xuancaibai.showsTouchWhenHighlighted=YES;
    
    [xuancaibai addTarget:self action:@selector(buttonDonwRecover:) forControlEvents:UIControlEventTouchUpInside]; //button 点击回调方法
    

    [self.view addSubview:xuancaibai];
    
    
}
                          
- (void)buttonDonwRecover:(id)sender

{
    
    UIButton *btn = (UIButton *)sender;
    [NSOperationQueue.mainQueue addOperationWithBlock:^{ btn.highlighted = YES; }];
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

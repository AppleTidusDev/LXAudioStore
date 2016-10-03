//
//  TwoViewController.m
//  bnb
//
//  Created by 谭 卓勋 on 16/9/9.
//  Copyright (c) 2016年 Tidus. All rights reserved.
//

#import "TwoViewController.h"
#import "KCStatus.h"
#import "KCStatusTableViewCell.h"
@interface TwoViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
@property(strong,nonatomic)UITableView *tableView;
@property(strong,nonatomic)NSMutableArray *status;
@property(strong,nonatomic)NSMutableArray *statusCells;


@end

@implementation  TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    
    //创建一个分组样式的UITableView
    _tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
[[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationItem.title = @"蓝弦社区";
    //设置数据源，注意必须实现对应的UITableViewDataSource协议
    _tableView.dataSource=self;
    //设置代理
    _tableView.delegate=self;
    [self setLayoutHeaderView];
    [self.view addSubview:_tableView];
    [self tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initData{
    NSString *path=[[NSBundle mainBundle] pathForResource:@"StatusInfo" ofType:@"plist"];
    NSArray *array=[NSArray arrayWithContentsOfFile:path];
    _status=[[NSMutableArray alloc]init];
    _statusCells=[[NSMutableArray alloc]init];
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [_status addObject:[KCStatus statusWithDictionary:obj]];
        KCStatusTableViewCell *cell=[[KCStatusTableViewCell alloc]init];
        [_statusCells addObject:cell];
    }];
}

#pragma mark 返回分组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

#pragma mark 返回每组行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _status.count;
}

#pragma mark返回每行的单元格
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier=@"UITableViewCellIdentifierKey1";
    KCStatusTableViewCell *cell;
    cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!cell){
        cell=[[KCStatusTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    //在此设置微博，以便重新布局
    KCStatus *status=_status[indexPath.row];
    cell.status=status;
    return cell;
}

#pragma mark 重新设置单元格高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //KCStatusTableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    KCStatusTableViewCell *cell= _statusCells[indexPath.row];
    cell.status=_status[indexPath.row];
    return cell.height;
}

#pragma mark 重写状态样式方法
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


- (void)setLayoutHeaderView {
    UIPageControl *page=[[UIPageControl alloc] init];
    
    page.frame = CGRectMake(0,60,self.view.frame.size.width,130);
    
    UIScrollView *scrollView=[[UIScrollView alloc] init];
    scrollView.showsHorizontalScrollIndicator = NO;
    
    CGRect frame=page.frame;
    
    scrollView.frame=frame;
    
    UIImage *image1=[UIImage imageNamed:@"1.jpg"];
    
    UIImage *image2=[UIImage imageNamed:@"2.jpg"];
    
    UIImage *image3=[UIImage imageNamed:@"3.jpg"];
    
    UIImage *image4=[UIImage imageNamed:@"4.jpg"];
    NSArray *pickerArrary=@[image1,image2,image3,image4];
    
    CGSize size=CGSizeMake(pickerArrary.count*self.view.frame.size.width, 70);
    
    //显示内容大小
    
    scrollView.contentSize=size;
    
    for(int i=0;i<pickerArrary.count;i++)
        
    {
        
        UIImageView *imageView=[[UIImageView alloc] initWithImage:pickerArrary[i]];
        //图片显示形式
        
        imageView.contentMode=UIViewContentModeTop;
        //图片显示范围
        
        imageView.frame=CGRectMake(i*self.view.frame.size.width, 30, self.view.frame.size.width,150);
        
        //加到scrollView中
        
        [scrollView addSubview:imageView];
    }
    //整页翻动
    
    scrollView.pagingEnabled=YES;
    
    //页面个数
    page.numberOfPages=pickerArrary.count;
    //将自己设置成.delegate
    scrollView.delegate=self;
    
    
    //得到图片移动相对原点的坐标
    
    CGPoint point=scrollView.contentOffset;
    
    //移动不能超过左边;
    
    if(point.x<0)
        
    {
        
        point.x=0;
        
        scrollView.contentOffset=point;
        
    }
    //移动不能超过右边
    
    if(point.x>(pickerArrary.count-1)*self.view.frame.size.width)
        
    {
        
        point.x=self.view.frame.size.width*(pickerArrary.count-1);
        
        scrollView.contentOffset=point;
        
    }
    
    //根据图片坐标判断页数
    NSInteger index=round(point.x/self.view.frame.size.width);
    
    page.numberOfPages =[pickerArrary count];
    
    page.userInteractionEnabled = NO;
    
    page.currentPage = index;
    
    page.currentPageIndicatorTintColor = [UIColor blackColor];
    
    UIView *bigView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 220)];
    
    
    UIButton *onebutton = [UIButton buttonWithType:UIButtonTypeCustom];//button的类型
    onebutton.frame = CGRectMake(0, 150,100, 50);//button的frame
    onebutton.backgroundColor = [UIColor redColor];//button的背景颜色
    
    [onebutton setTitle:@"官方公告" forState:UIControlStateNormal];//设置button的title
    onebutton.titleLabel.font = [UIFont systemFontOfSize:13];//title字体大小
    onebutton.titleLabel.textAlignment = NSTextAlignmentCenter;//设置title的字体居中
    [onebutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];//设置title在一般情况下为白色字体
    
    
    
    
    
    
    
    [onebutton addTarget:self action:@selector(tap) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *twobutton = [UIButton buttonWithType:UIButtonTypeCustom];//button的类型
    twobutton.frame = CGRectMake(220,150,100, 50);//button的frame
    twobutton.backgroundColor = [UIColor greenColor];//button的背景颜色
    
    [twobutton setTitle:@"意见反馈" forState:UIControlStateNormal];//设置button的title
    twobutton.titleLabel.font = [UIFont systemFontOfSize:13];//title字体大小
    twobutton.titleLabel.textAlignment = NSTextAlignmentCenter;//设置title的字体居中
    [twobutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];//设置title在一般情况下为白色字体
    
    [twobutton addTarget:self action:@selector(tap) forControlEvents:UIControlEventTouchUpInside];
    bigView.backgroundColor=[UIColor whiteColor];
    
    [bigView addSubview:page];
    [bigView addSubview:scrollView];
    [bigView addSubview:onebutton];
    [bigView addSubview:twobutton];
    self.tableView.tableHeaderView =bigView;
    
    
}

- (void)setTitle:(NSString *)title {
    
    UILabel *titleLabel         = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    titleLabel.text             = title;
    titleLabel.font             = [UIFont boldSystemFontOfSize:20.f];
    titleLabel.textAlignment    = NSTextAlignmentCenter;
    titleLabel.textColor        = [UIColor whiteColor];
    self.navigationItem.titleView = titleLabel;
    
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

//
//  OneViewController.m
//  bnb
//
//  Created by 谭 卓勋 on 16/9/9.
//  Copyright (c) 2016年 Tidus. All rights reserved.
//

#import "OneViewController.h"
#import "OneStatus.h"
#import "OneTableViewCell.h"
#import "SuggestionViewController.h"
#import "TalkTableViewController.h"
@interface OneViewController ()<UISearchDisplayDelegate,UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
@property(strong,nonatomic)UITableView *tableView;
@property(strong,nonatomic)NSMutableArray *contacts;//联系人模型
@property (retain, nonatomic) NSMutableArray *images;
@property (retain, nonatomic) UIScrollView *scrollView;
@property(strong,nonatomic)UIView *searchView;
@property(strong,nonatomic)NSMutableArray *status;
@property(strong,nonatomic)NSMutableArray *statusCells;

@end

@implementation OneViewController
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    UIBarButtonItem *leftItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"6.6.png"] style:UIBarButtonItemStylePlain target:self action:@selector(das:)];
    self.navigationItem.leftBarButtonItem=leftItem;
    leftItem.tintColor=[UIColor whiteColor];
    self.searchView=[[UIView alloc]initWithFrame:CGRectMake(5, 0, 300, 30)];
    UISearchBar *searchBar=[[UISearchBar alloc] initWithFrame:CGRectMake(5,0, 300, 30)];
    searchBar.backgroundColor=[UIColor whiteColor];
    [_searchView addSubview:searchBar];
    [searchBar setSearchBarStyle:UISearchBarStyleMinimal];
    
    [searchBar setPlaceholder:@""];
    
    self.navigationItem.titleView =_searchView;
    
    //创建一个分组样式的UITableView
    
    _tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    //设置数据源，注意必须实现对应的UITableViewDataSource协议
    _tableView.dataSource=self;
    self.tableView.rowHeight=70;
    UIImage *first=[UIImage imageNamed:@"100.png"];
    UIImage *second=[UIImage imageNamed:@"101.png"];
    UIImage *three=[UIImage imageNamed:@"102.png"];
    
    UIImage *longImage=[UIImage imageNamed:@"long"];
    UIImageView *longImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 32, 25)];
    [longImageView setImage:longImage];
    UILabel *longLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 32, 25)];
    UIButton *longButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [longLabel setText:@"asdas"];
    [longButton addSubview:longLabel];
    [longButton addSubview:longImageView];
        
    self.images = [[NSMutableArray alloc]initWithObjects:first,second,three, nil];
    [self.view addSubview:_tableView];
    [self initData];
    [self setLayoutHeaderView];
      

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 加载数据
-(void)initData{
    NSString *path=[[NSBundle mainBundle] pathForResource:@"One" ofType:@"plist"];
    NSArray *array=[NSArray arrayWithContentsOfFile:path];
    _status=[[NSMutableArray alloc]init];
    _statusCells=[[NSMutableArray alloc]init];
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [_status addObject:[OneStatus statusWithDictionary:obj]];
        OneTableViewCell *cell=[[OneTableViewCell alloc]init];
        [_statusCells addObject:cell];
    }];
}

#pragma mark - 数据源方法
#pragma mark 返回分组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    NSLog(@"计算分组数");
    return 1;
}

#pragma mark 返回每组行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _status.count;
}

#pragma mark返回每行的单元格
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //NSIndexPath是一个结构体，记录了组和行信息

    
    static NSString *cellIdentifier=@"UITableViewCellIdentifierKey1";

    OneTableViewCell *cell;
    cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!cell){
        cell=[[OneTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    //在此设置微博，以便重新布局
    OneStatus *status=_status[indexPath.row];
    cell.status=status;
    cell.textLabel.textColor=[UIColor redColor];

    NSInteger row = [indexPath row];  //关键点之一  cell的位置
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(230, 55*row, 110, 55)];
    _scrollView.delegate = self;
    _scrollView.backgroundColor=[UIColor blackColor];
    _scrollView.pagingEnabled=YES;
    
    //当超出边界时表示是否可以反弹
    
    _scrollView.bounces=YES;
    _scrollView.userInteractionEnabled = YES;//是否滚动
    _scrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    _scrollView.scrollEnabled=YES;
     [_scrollView setScrollEnabled:YES];
    //将自己设置成.delegate
    _scrollView.delegate=self;
    CGSize size=CGSizeMake(2000,80);
    //显示内容大小
    
    _scrollView.contentSize=size;
    

    for(int i=0;i+1<4;i++){
        UIImageView *imageView=[[UIImageView alloc] initWithImage:self.images[i]];
        //图片显示形式
                imageView.contentMode=UIViewContentModeTop;
        //图片显示范围
        
        imageView.frame=CGRectMake(55*i ,55*row, 55,55);
        
        //加到scrollView中
       

        
        [_scrollView addSubview:imageView];
        
    }
    
        [cell.contentView addSubview:_scrollView];
    
    UIButton *leftbutton=[[UIButton alloc]initWithFrame:CGRectMake(220, 55*row, 10, 55)];
    [leftbutton  setImage:[UIImage imageNamed:@"left.png"] forState:UIControlStateNormal];
        [leftbutton addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [cell.contentView addSubview:leftbutton];
    
    UIButton *rightbutton=[[UIButton alloc]initWithFrame:CGRectMake(340, 55*row, 10, 55)];
    [rightbutton  setImage:[UIImage imageNamed:@"right.png"] forState:UIControlStateNormal];
    [rightbutton addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [cell.contentView addSubview:rightbutton];

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TalkTableViewController *tV=[[TalkTableViewController alloc]init];
    [self.navigationController  pushViewController:tV animated:NO ];
}//跳转界面
-(void)btnClicked:(id)sender
{

}

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
    
    UIView *bigView=[[UIView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 180)];

    
    UIButton *longbutton = [UIButton buttonWithType:UIButtonTypeCustom];//button的类型
    longbutton.frame = CGRectMake(0, 140,200, 40);//button的frame
    longbutton.backgroundColor = [UIColor redColor];//button的背景颜色
    [longbutton setImage:[UIImage imageNamed:@"long.png"] forState:UIControlStateNormal];//给button添加image
    
    [longbutton setTitle:@"国庆优惠活动，点击请进" forState:UIControlStateNormal];//设置button的title
    longbutton.titleLabel.font = [UIFont systemFontOfSize:13];//title字体大小
    longbutton.titleLabel.textAlignment = NSTextAlignmentLeft;//设置title的字体居中
    [longbutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];//设置title在一般情况下为白色字体
   
    [longbutton addTarget:self action:@selector(tap) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *shortbutton = [UIButton buttonWithType:UIButtonTypeCustom];//button的类型
    shortbutton.frame = CGRectMake(220,140,100, 40);//button的frame
    shortbutton.backgroundColor = [UIColor redColor];//button的背景颜色
    [shortbutton setImage:[UIImage imageNamed:@"short.png"] forState:UIControlStateNormal];//给button添加image
    
    [shortbutton setTitle:@"询问／建议" forState:UIControlStateNormal];//设置button的title
    shortbutton.titleLabel.font = [UIFont systemFontOfSize:13];//title字体大小
    shortbutton.titleLabel.textAlignment = NSTextAlignmentLeft;//设置title的字体居中
    [shortbutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];//设置title在一般情况下为白色字体
    
    [shortbutton addTarget:self action:@selector(suggestionViewGO)forControlEvents:UIControlEventTouchUpInside];
    bigView.backgroundColor=[UIColor whiteColor];
    
    [bigView addSubview:page];
    [bigView addSubview:scrollView];
    [bigView addSubview:longbutton];
    [bigView addSubview:shortbutton];
    self.tableView.tableHeaderView =bigView;
    
 
}
-(void) suggestionViewGO
{
    SuggestionViewController * SView = [[SuggestionViewController alloc]init];
    SView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentViewController:SView animated:YES completion:nil];
}



//设置表头高度
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

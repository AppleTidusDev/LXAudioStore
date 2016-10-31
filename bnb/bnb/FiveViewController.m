//
//  FiveViewController.m
//  bnb
//
//  Created by 谭 卓勋 on 16/9/9.
//  Copyright (c) 2016年 Tidus. All rights reserved.
//

#import "FiveViewController.h"
#import "FiveStatus.h"
#import "FiveStatusTableViewCell.h"
#import "DaTableViewController.h"
@interface FiveViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(strong,nonatomic)UITableView *tableView;
@property(strong,nonatomic)NSMutableArray *status;
@property(strong,nonatomic)NSMutableArray *statusCells;

@end

@implementation FiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];

    // Do any additional setup after loading the view.
    //创建一个分组样式的UITableView
    _tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationItem.title = @"我的";
    //设置数据源，注意必须实现对应的UITableViewDataSource协议
    _tableView.dataSource=self;
    //设置代理
    _tableView.delegate=self;
    [self setTableHeaderView];
    
    [self.view addSubview:_tableView];
    [self tableView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)initData{
    NSString *path=[[NSBundle mainBundle] pathForResource:@"five" ofType:@"plist"];
    NSArray *array=[NSArray arrayWithContentsOfFile:path];
    _status=[[NSMutableArray alloc]init];
    _statusCells=[[NSMutableArray alloc]init];
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [_status addObject:[FiveStatus statusWithDictionary:obj]];
        FiveStatusTableViewCell *cell=[[FiveStatusTableViewCell alloc]init];
        [_statusCells addObject:cell];
    }];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _status.count;
}

#pragma mark返回每行的单元格
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier=@"UITableViewCellIdentifierKey1";
    FiveStatusTableViewCell *cell;
    cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!cell){
        cell=[[FiveStatusTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    //在此设置微博，以便重新布局
    FiveStatus *status=_status[indexPath.row];
    cell.status=status;
    UIButton *rightbutton=[[UIButton alloc]initWithFrame:CGRectMake(340, 55, 10, 55)];
    rightbutton.backgroundColor=[UIColor blackColor];
    [rightbutton addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [cell addSubview:rightbutton];
    //添加黑色按钮
        return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    FiveStatusTableViewCell *cell= _statusCells[indexPath.row];
    cell.status=_status[indexPath.row];
    return cell.height;
}

#pragma mark 重写状态样式方法
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
-(void)btnClicked:(UIButton*)btn
{
    DaTableViewController * SView = [[DaTableViewController alloc]init];
    SView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self.navigationController pushViewController:SView animated:YES];
}//按钮方法

-(void)setTableHeaderView{
    UIView *bigView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    bigView.backgroundColor=[UIColor redColor];
    
    UIImage *cus=[UIImage imageNamed:@"cus.png"];
    UIImageView *cusView=[[UIImageView alloc]initWithFrame:CGRectMake(30, 50, 70, 70)];
    cusView.image=cus;
    
    UIImage *bg=[UIImage imageNamed:@"bg.png"];
    UIImageView *bgView=[[UIImageView alloc]initWithFrame:CGRectMake(30, 50, 70, 70)];
    bgView.image=bg;
    
    UILabel *name=[[UILabel alloc]initWithFrame:CGRectMake(100, 30, 100, 100)];
    name.text=@"罗晓琳";
    name.textColor=[UIColor whiteColor];
    
    
    
    UILabel *action=[[UILabel alloc]initWithFrame:CGRectMake(300, 120, 100, 30)];
    action.text=@"asdhkaf>";
    action.textColor=[UIColor whiteColor];
    
    UILabel *ff=[[UILabel alloc]initWithFrame:CGRectMake(50, 7, 100, 13)];
    ff.text=@"关注的商品";
    ff.font=[UIFont systemFontOfSize:13];
    ff.textColor=[UIColor grayColor];
    
    UILabel *ffn=[[UILabel alloc]initWithFrame:CGRectMake(80, 25, 10, 13)];
    ffn.text=@"0";
    ffn.textColor=[UIColor grayColor];
    ffn.font=[UIFont systemFontOfSize:13];
    ffn.textAlignment=NSTextAlignmentCenter;
    
    
    UILabel *liu=[[UILabel alloc]initWithFrame:CGRectMake(243, 7, 100, 13)];
    liu.text=@"浏览记录";
    liu.textColor=[UIColor grayColor];
    liu.font=[UIFont systemFontOfSize:13];
    
    UILabel *liun=[[UILabel alloc]initWithFrame:CGRectMake(245, 25, 50, 13)];
    liun.text=@"2";
    liun.textColor=[UIColor grayColor];
    liun.font=[UIFont systemFontOfSize:13];
    liun.textAlignment=NSTextAlignmentCenter;
    
    
    UIImage *line9=[UIImage imageNamed:@"line1.png"];
    UIImageView *line9View=[[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-10, 7, 1, 35)];
    line9View.image=line9;

    UIView *smallView=[[UIView alloc]initWithFrame:CGRectMake(0,150 , self.view.frame.size.width, 50)];
    smallView.backgroundColor=[UIColor whiteColor];
    [smallView addSubview:line9View];
    [smallView addSubview:ff];
    [smallView addSubview:ffn];
    [smallView addSubview:liu];
    [smallView addSubview:liun];
    [bigView addSubview:smallView];
    [bigView addSubview:bgView];
    [bigView addSubview:cusView];
    [bigView addSubview:name];
    [bigView addSubview:action];
    
    self.tableView.tableHeaderView=bigView;
    
   ///
    

    
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

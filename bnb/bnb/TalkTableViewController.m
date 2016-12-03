//
//  TalkTableViewController.m
//  bnb
//
//  Created by 谭 卓勋 on 16/10/27.
//  Copyright (c) 2016年 Tidus. All rights reserved.
//

#import "TalkTableViewController.h"
#import "TalkStatus.h"
#import "TalkTableViewCell.h"
@interface TalkViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(strong,nonatomic)UITableView *tableView;
@property(strong,nonatomic)NSMutableArray *status;
@property(strong,nonatomic)NSMutableArray *statusCells;

@end

@implementation TalkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self tableView];
    //创建一个分组样式的UITableView
    self.tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    //设置数据源，注意必须实现对应的UITableViewDataSource协议
  self.tableView.dataSource=self;
    //设置代理
    self.tableView.delegate=self;
    [self.view addSubview:self.tableView];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    self.navigationItem.title=@"话题详细";
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [self setLayoutHeaderView];
    [self pushTabbar];
}

-(void)initData{
    NSString *path=[[NSBundle mainBundle] pathForResource:@"Talk" ofType:@"plist"];
    NSArray *array=[NSArray arrayWithContentsOfFile:path];
    _status=[[NSMutableArray alloc]init];
    _statusCells=[[NSMutableArray alloc]init];
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [_status addObject:[TalkStatus statusWithDictionary:obj]];
        TalkTableViewCell *cell=[[TalkTableViewCell alloc]init];
        [_statusCells addObject:cell];
    }];
}

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
    TalkTableViewCell *cell;
    cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!cell){
        cell=[[TalkTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    //在此设置微博，以便重新布局
    TalkStatus *status=_status[indexPath.row];
    cell.status=status;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //KCStatusTableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    TalkTableViewCell *cell= _statusCells[indexPath.row];
    cell.status=_status[indexPath.row];
    return cell.height;
}

#pragma mark 重写状态样式方法
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)setLayoutHeaderView{
    UIView *bigView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 400)];
    UIImage *label=[UIImage imageNamed:@"楼主.png"];

    UIImageView *labelV=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 30, 30)];
    labelV.image=label;
    
    UILabel *name=[[UILabel alloc]initWithFrame:CGRectMake(50, 10, 100, 13)];
    name.text=@"蓝弦小蓝";
    [name setFont:[UIFont systemFontOfSize:13] ];
    
    UILabel *level=[[UILabel alloc]initWithFrame:CGRectMake(100, 10, 50, 13)];
    level.text=@"LV10";
    [level setFont:[UIFont systemFontOfSize:11]];
    
    UILabel *day=[[UILabel alloc]initWithFrame:CGRectMake(50, 25, 80, 8)];
    day.text=@"2015-10-16 21:28";
    [day setFont:[UIFont systemFontOfSize:8]];
    
    UILabel *reply=[[UILabel alloc]initWithFrame:CGRectMake(150, 25, 80, 8)];
    reply.text=@"回复：38   查看：569";
    [reply setFont:[UIFont systemFontOfSize:8]];
    
    UILabel *text=[[UILabel alloc]initWithFrame:CGRectMake(11, 50, 150, 16)];
    text.text=@"如何打造一款出色的耳机";
    [text setFont:[UIFont systemFontOfSize:16]];
    
    UILabel *detail=[[UILabel alloc]initWithFrame:CGRectMake(10, 60, self.view.bounds.size.width, 80)];
    detail.text=@"卡号发了卡拉斯京份卢卡斯减肥啦减肥 i 哦啊叫卡和沙发";
    [text setFont:[UIFont systemFontOfSize:13]];
    
    UIImage *pi=[UIImage imageNamed:@"蓝弦新品p.png"];
    UIImageView *pV=[[UIImageView alloc]initWithFrame:CGRectMake(10, 110, self.view.bounds.size.width-10, 250)];
    pV.image=pi;
    
    [bigView addSubview:labelV];
    [bigView addSubview:name];
    [bigView addSubview:level];
    [bigView addSubview:day];
    [bigView addSubview:reply];
    [bigView addSubview:text];
    [bigView addSubview:detail];
    [bigView addSubview:pV];
    self.tableView.tableHeaderView =bigView;
     

    
}

-(void)pushTabbar{
    
    UITabBar *tb=[[UITabBar alloc]initWithFrame:CGRectMake(0, 619, self.view.frame.size.width, 25)];
    UITabBarItem *first=[[UITabBarItem alloc]initWithTitle:@"" image:[UIImage imageNamed:@"connect.png"] tag:4];
    UITabBarItem *second=[[UITabBarItem alloc]initWithTitle:@"" image:[UIImage imageNamed:@"more.png"] tag:5];
    UITabBarItem *third=[[UITabBarItem alloc]init];
    UITabBarItem *fourth=[[UITabBarItem alloc]init];
    UITabBarItem *fiveth=[[UITabBarItem alloc]initWithTitle:@"" image:[UIImage imageNamed:@"talk.png"] tag:3];
    fiveth.badgeValue=@"38";
    NSArray *items=[[NSArray alloc]initWithObjects:third,fourth, fiveth,first,second,nil];
    
    tb.items=items;
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(65, 5, 60,30)];
    btn.backgroundColor=[UIColor clearColor];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitle:@"写评论" forState:UIControlStateNormal];
    UIButton *label=[[UIButton alloc]initWithFrame:CGRectMake(45, 10, 20 ,20)];
    label.backgroundColor=[UIColor clearColor];
    [label setImage:[UIImage imageNamed:@"write.png"] forState:UIControlStateNormal];
    [tb addSubview:label];
    [tb addSubview:btn];
    
    UIButton *line=[[UIButton alloc]initWithFrame:CGRectMake(150, 10, 1, 30)];
    line.backgroundColor=[UIColor blackColor];
    [line setImage:[UIImage imageNamed:@"line1.png"] forState:UIControlStateNormal];
    [tb addSubview:line];
    tb.barTintColor = [UIColor blackColor];
    tb.selectedImageTintColor = [UIColor redColor];
    
    
    [self.view addSubview:tb];
    
    
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:] forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

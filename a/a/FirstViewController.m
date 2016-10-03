//
//  FirstViewController.m
//  a
//
//  Created by 谭 卓勋 on 16/8/16.
//  Copyright (c) 2016年 Tidus. All rights reserved.
//

#import "FirstViewController.h"
#import "header.h"
@interface FirstViewController ()


@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title=@"main";
    self.view.backgroundColor=[UIColor whiteColor];
    //注意通过tabBarController或者parentViewController可以得到其俯视图控制器（也就是KCTabBarViewController）
    NSLog(@"%i",self.tabBarController==self.parentViewController);//对于当前应用二者相等
    
    //设置图标、标题(tabBarItem是显示在tabBar上的标签)
    self.tabBarItem.title=@"Main";//注意如果这个标题不设置默认在页签上显示视图控制器标题
    self.tabBarItem.image=[UIImage imageNamed:@"singleicon.png"];//默认图片
    
    self.officerTextField=[[UITextField alloc] initWithFrame:CGRectMake(150,55,180,30)];
    self.officerTextField.textAlignment =NSTextAlignmentLeft;
    self.officerTextField.placeholder = @"officer";//为空白文本字段绘制一个灰色字符串作为占位符
    [self.view addSubview:self.officerTextField];
    
    self.authorizationCodeTextField=[[UITextField alloc ]initWithFrame:CGRectMake(150, 95, 180, 30)];
    self.authorizationCodeTextField.textAlignment=NSTextAlignmentLeft;
    self.authorizationCodeTextField.placeholder=@"authorization";
    [self.view addSubview:self.authorizationCodeTextField];
    
    self.rankTextField=[[UITextField alloc]initWithFrame:CGRectMake(150, 135, 100, 30)];
    self.rankTextField.textAlignment=NSTextAlignmentLeft;
    self.rankTextField.placeholder=@"rank";
    [self.view addSubview:self.rankTextField];
    
    self.warpDriveTextField=[[UITextField alloc]initWithFrame:CGRectMake(150, 175, 180, 30)];
    self.warpDriveTextField.textAlignment=NSTextAlignmentLeft;
    self.warpDriveTextField.placeholder=@"warpDrive";
    [self.view addSubview:self.warpDriveTextField];
    
    self.favoriteFactorTextField=[[UITextField alloc]initWithFrame:CGRectMake(150, 215, 180, 30)];
    self.favoriteFactorTextField.textAlignment=NSTextAlignmentLeft;
    self.favoriteFactorTextField.placeholder=@"favoriteFactor";
    [self.view addSubview:self.favoriteFactorTextField];
    
    self.favoriteTeaTextField=[[UITextField alloc]initWithFrame:CGRectMake(150, 255, 180, 30)];
    self.favoriteTeaTextField.textAlignment=NSTextAlignmentLeft;
    self.favoriteTeaTextField.placeholder=@"favoriteTea";
    [self.view addSubview:self.favoriteTeaTextField];
    
    self.favoriteCaptainTextField=[[UITextField alloc]initWithFrame:CGRectMake(150, 295, 180, 30)];
    self.favoriteCaptainTextField.textAlignment=NSTextAlignmentLeft;
    self.favoriteCaptainTextField.placeholder=@"favoriteCaptain";
    [self.view addSubview:self.favoriteCaptainTextField];
    
    self.favoriteGadgetTextField=[[UITextField alloc]initWithFrame:CGRectMake(150, 335, 180, 30)];
    self.favoriteGadgetTextField.textAlignment=NSTextAlignmentLeft;
    self.favoriteGadgetTextField.placeholder=@"favoriteGadget";
    [self.view addSubview:self.favoriteGadgetTextField];
    
    self.favoriteAlienTextField=[[UITextField alloc]initWithFrame:CGRectMake(150, 375, 180, 30)];
    self.favoriteAlienTextField.textAlignment=NSTextAlignmentLeft;
    self.favoriteAlienTextField.placeholder=@"favoriteAlien";
    [self.view addSubview:self.favoriteAlienTextField];
    
    [self addLoginForm];

    
    

}

-(void)refreshFields{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.officerTextField.text = [defaults objectForKey:Officer];
    self.officerTextField.userInteractionEnabled = NO;
    self.authorizationCodeTextField.text = [defaults objectForKey:AuthorizationCode];
    self.authorizationCodeTextField.userInteractionEnabled=NO;
    self.rankTextField.text = [defaults objectForKey:Rank];
    self.rankTextField.userInteractionEnabled=NO;
    self.warpDriveTextField.text = [defaults boolForKey:WarpDrive] ? @"engaged" : @"Disabled";
    self.warpDriveTextField.userInteractionEnabled=NO;
    self.warpFactorTextField.text = [[defaults objectForKey:WarpFactor] stringValue];
    self.warpFactorTextField.userInteractionEnabled=NO;
    self.favoriteTeaTextField.text = [defaults objectForKey:FavoriteTea];
    self.favoriteAlienTextField.userInteractionEnabled=NO;
    self.favoriteCaptainTextField.text = [defaults objectForKey:FavoriteCaptain];
    self.favoriteAlienTextField.userInteractionEnabled=NO;
    self.favoriteGadgetTextField.text = [defaults objectForKey:FavoriteGadget];
    self.favoriteGadgetTextField.userInteractionEnabled=NO;
    self.favoriteAlienTextField.text = [defaults objectForKey:FavoriteAlien];
    self.favoriteCaptainTextField.userInteractionEnabled=NO;
}
-(void)addLoginForm{
    //用户名
    UILabel *lbUserName=[[UILabel alloc]initWithFrame:CGRectMake(10, 60, 80, 30)];
    lbUserName.text=@"              Officer：";
    [lbUserName sizeToFit];
    
    lbUserName.textAlignment=NSTextAlignmentRight;
    
    [self.view addSubview:lbUserName];
    
    
    
    //密码
    UILabel *lbPassword=[[UILabel alloc]initWithFrame:CGRectMake(10, 100,80, 30)];
    lbPassword.text=@"    Authorization：";
     [lbPassword sizeToFit];
    [lbPassword setTextAlignment:NSTextAlignmentCenter];
    
    [self.view addSubview:lbPassword];
    
    UILabel *rank=[[UILabel alloc]initWithFrame:CGRectMake(10, 140, 80, 30)];
    rank.text=@"                Rank: ";
    [rank sizeToFit];
    [rank setTextAlignment:NSTextAlignmentRight];
    [self.view addSubview:rank];
    
    UILabel *warpDrive=[[UILabel alloc]initWithFrame:CGRectMake(10,180 , 80, 30)];
    warpDrive.text=@"         WarpDrive: ";
    
    [warpDrive sizeToFit];
    [self.view addSubview:warpDrive];
    
    UILabel *warpFactor=[[UILabel alloc]initWithFrame:CGRectMake(10, 220, 80, 30)];
    warpFactor.text=@"      Warp Factor: ";
    [warpFactor sizeToFit];
    [self.view addSubview:warpFactor];

    UILabel *favoriteTea=[[UILabel alloc]initWithFrame:CGRectMake(10, 260, 80, 30)];
    favoriteTea.text=@"      Favorite Tea:";
    [favoriteTea sizeToFit];
    [self.view addSubview:favoriteTea];
    
    UILabel *favoriteCaptain=[[UILabel alloc]initWithFrame:CGRectMake(10, 300, 80, 30)];
    favoriteCaptain.text=@"Favorite Captain:";
    [favoriteCaptain sizeToFit];
    [self.view addSubview:favoriteCaptain];
    
    UILabel *favoriteGadget=[[UILabel alloc]initWithFrame:CGRectMake(10, 340, 80, 30)];
    favoriteGadget.text=@" Favorite Gadget:";
    [favoriteGadget sizeToFit];
    [self.view addSubview:favoriteGadget];
    
    UILabel *favoriteAlien=[[UILabel alloc]initWithFrame:CGRectMake(10, 380, 80, 30)];
    favoriteAlien.text=@"     Favorite Alien:";
    [favoriteAlien sizeToFit];
    [self.view addSubview:favoriteAlien];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
        [self refreshFields];
    //注册观测者
    UIApplication *app= [UIApplication sharedApplication];

    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(applicationWillEnterForeground:)
                                                name:UIApplicationWillEnterForegroundNotification
                                              object:app];
}

-(void)applicationWillEnterForeground:(NSNotification *)notification{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize];
    [self refreshFields];
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:(BOOL)animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end

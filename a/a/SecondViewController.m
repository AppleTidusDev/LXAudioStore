//
//  SecondViewController.m
//  a
//
//  Created by 谭 卓勋 on 16/8/16.
//  Copyright (c) 2016年 Tidus. All rights reserved.
//

#import "SecondViewController.h"
#import "header.h"
@interface SecondViewController ()
@property(strong,nonatomic)UISwitch *engineSwitch;
@property(strong,nonatomic)UISlider *WarpSlider;
@property(strong,nonatomic)UIButton *settring;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor whiteColor];
    self.tabBarItem.title=@"setting";
    self.tabBarItem.image=[UIImage imageNamed:@"doubleicon.png"];
    UILabel *engine=[[UILabel alloc]initWithFrame:CGRectMake(10, 50, 30, 30)];
    engine.text=@"Warp Engines:";
    [engine sizeToFit];
    [self.view addSubview:engine];
    
    UILabel *factor=[[UILabel alloc]initWithFrame:CGRectMake(10, 80, 30, 30)];
    factor.text=@"Warp Factor:";
    [factor sizeToFit];
    [self.view addSubview:factor];
    
    self.engineSwitch= [[UISwitch alloc] initWithFrame:CGRectMake(300.f, 50.0f, 1, 1)] ;
    [self.engineSwitch addTarget:self action:@selector(enginesSwitchBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.engineSwitch];

    self.WarpSlider=[[UISlider alloc]initWithFrame:CGRectMake(50, 110, 320, 20)];
    self.WarpSlider.minimumValue = 0.0f;
    self.WarpSlider.maximumValue = 100.0f;
    self.WarpSlider.value = 50.0f;
    self.WarpSlider.maximumValueImage=[UIImage imageNamed:@"rabbit.png"];
    self.WarpSlider.minimumValueImage=[UIImage imageNamed:@"turtle.png"];
    [self.WarpSlider addTarget:self action:@selector(WarpSliderBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    self.settring=[[UIButton alloc]initWithFrame:CGRectMake(150,550, 60, 30)];
    [self.settring setTitle:@"Setting" forState:UIControlStateNormal];
    [self.settring setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.settring addTarget:self action:@selector(settingInfoClicked:) forControlEvents:UIControlEventTouchUpInside ];
    [self.view addSubview:self.settring];
    
    [self.view addSubview:self.WarpSlider];
    
    
    
        }
-(void)refreshField
{
    NSUserDefaults *defaults =  [NSUserDefaults standardUserDefaults];
    
    self.engineSwitch.on = [defaults boolForKey:IsWarp];
    self.WarpSlider.value = [defaults floatForKey:SliderValue];
    
}

- (void)WarpSliderBtn:(UISlider *)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setFloat:self.WarpSlider.value forKey:SliderValue];
    [defaults synchronize];
}

- (void)enginesSwitchBtn:(UISwitch *)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:self.engineSwitch.on forKey:IsWarp];
    [defaults synchronize];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self refreshField];

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
    [self refreshField];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:(BOOL)animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
-(void)settingInfoClicked:(UIButton*)sender{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
}

@end

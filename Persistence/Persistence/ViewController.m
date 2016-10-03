//
//  ViewController.m
//  Persistence
//
//  Created by 谭 卓勋 on 16/9/2.
//  Copyright (c) 2016年 Tidus. All rights reserved.
//

#import "ViewController.h"
#import "FourLines.h"
static NSString *const kRootKey=@"kRootKey";
@interface ViewController ()
@property(strong,nonatomic)IBOutletCollection(UITextField) NSArray *lineFields;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *path=[self dataFilePath];
    if([[NSFileManager defaultManager] fileExistsAtPath:path]){
        
        }
    
    NSData *data=[[NSMutableData alloc]initWithContentsOfFile:path];
    NSKeyedUnarchiver *unarchiver=[[NSKeyedUnarchiver alloc]initForReadingWithData:data];
    FourLines *fourlines=[unarchiver decodeObjectForKey:kRootKey];
    [unarchiver finishDecoding];
    
    for(int i=0;i<4;i++){
        UITextField *textField=self.lineFields[i];
        textField.text=fourlines.lines[i];
    }
    
    UIApplication *app=[UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(applicationWillResignActive:) name:UIApplicationWillResignActiveNotification object:app];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)applicationWillResignActive:(NSNotification*)notification{
    NSString *filePath=[self dataFilePath];
    NSMutableData *data=[[NSMutableData alloc]init];
    FourLines *fourlines=[[FourLines alloc]init];
    fourlines.lines=[self.lineFields valueForKey:@"text"];
    
    NSKeyedArchiver *archiver=[[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
    [archiver encodeObject:fourlines forKey:kRootKey];
    [archiver finishEncoding];
    [data writeToFile:filePath atomically:YES];
}

-(NSString*)dataFilePath{
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    NSString *filePath=[paths objectAtIndex:0];
    return [filePath stringByAppendingPathComponent:@"data.archiver"];
}

@end

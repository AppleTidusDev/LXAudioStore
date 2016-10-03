//
//  ViewController.m
//  SQLite Persistence
//
//  Created by 谭 卓勋 on 16/9/2.
//  Copyright (c) 2016年 Tidus. All rights reserved.
//

#import "ViewController.h"
#import  <sqlite3.h>
@interface ViewController ()
@property(strong,nonatomic)IBOutletCollection(UITextField) NSArray *lineFilds;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    sqlite3 *database;
    if(sqlite3_open([[self dataFilePath]UTF8String], &database)!=SQLITE_OK){
        sqlite3_close(database);
        NSAssert(0, @"Failed to open database");
    }
    
    // Useful C trivia: If two inline strings are separated by nothing
    // but whitespace (including line breaks), they are concatenated into
    // a single string:
    
    NSString *createSQL=@"CREATE TABLE IF NOT EXIST FIELDS"
    "(ROW INTEGER PRIMARY KEY,FIELD_DATA TEXT);";
    char *errorMsg;
    if(sqlite3_exec(database, [createSQL UTF8String], NULL, NULL, &errorMsg)){
        sqlite3_close(database);
        NSAssert(0, @"ERROR");
    }
    
    NSString *query=@"SELECT ROW,FIELD_DATA FROM FIELD ORDER BY ROW";
    sqlite3_stmt *statament;
    if(sqlite3_prepare_v2(database, [query UTF8String], -1, &statament, NULL)==SQLITE_OK){
        while (sqlite3_step(statament)==SQLITE_ROW) {
            int row=sqlite3_column_int(statament, 0);
            char *rowData=(char*)sqlite3_column_text(statament, 1);
            
            NSString *textValue=[[NSString alloc ]initWithUTF8String:rowData];
            
            UITextField *text=self.lineFilds[row];
            text.text=textValue;
        }
        sqlite3_finalize(statament);
    }
    sqlite3_close(database);
    
    UIApplication *app = [UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(applicationWillResignActive:)
     name:UIApplicationWillResignActiveNotification
     object:app];
}


- (void)applicationWillResignActive:(NSNotification *)notification
{
    sqlite3 *database;
    if (sqlite3_open([[self dataFilePath] UTF8String], &database)
        != SQLITE_OK) {
        sqlite3_close(database);
        NSAssert(0, @"Failed to open database");
    }
    for (int i = 0; i < 4; i++) {
        UITextField *field = self.lineFilds[i];
        // Once again, inline string concatenation to the rescue:

        char *updata="INSERT OR REPLACE INTO FIELDS(ROW,FIELDS_DATA)"
        "VALUE(?,?)";
        char *error=NULL;
        sqlite3_stmt *statement;
        if(sqlite3_prepare_v2(database, updata, -1, &statement, NULL)==SQLITE_OK){
            sqlite3_bind_int(statement, 1, i);
            sqlite3_bind_text(statement, 1, [field.text UTF8String], -1, NULL);
        }
        if(sqlite3_step(statement)!=SQLITE_OK){
            NSAssert(0,@"ERROR :%s",error);
        }
        sqlite3_finalize(statement);
}
    sqlite3_close(database);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString*)dataFilePath{
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory=[paths objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:@"data.sqlite"];
}



@end

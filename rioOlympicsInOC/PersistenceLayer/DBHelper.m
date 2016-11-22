//
//  DBHelper.m
//  rioOlympicsInOC
//
//  Created by derex pan on 2016/11/13.
//  Copyright © 2016年 derex pan. All rights reserved.
//

#import "DBHelper.h"
#import "sqlite3.h"
@implementation DBHelper



//获取沙箱目录方法
+(const char *) applicationDirectoryPath: (NSString*)fileName {
    NSString *documentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true) lastObject];
    NSString *filePath = [documentDirectory stringByAppendingPathComponent:fileName];
    
    const char *cPath = [filePath UTF8String];
    return cPath;
}
//初始化数据库
+(void) initDB {
    //比较属性列表版本号和数据库版本号，不一致则升级数据库
    NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"DBConfig" ofType:@"plist"];
    NSDictionary *plistDic = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    //从属性列表文件中取出版本号
    NSNumber *configVersion = plistDic[@"DB_VERSION"];
    
    if (configVersion == nil) {
        configVersion = 0;
    }
    int versionNumber = [DBHelper dbVersion_number];
    if (versionNumber != configVersion.intValue) {
        const char *dbFilePath = [self applicationDirectoryPath:DB_FILENAME];
        NSLog(@"dbFilePath: %s",dbFilePath);
        if (sqlite3_open(dbFilePath, &db) == SQLITE_OK) {
            NSLog(@"数据库升级中");
            //取到create_load.sql的path
            NSString *sqlPath = [[NSBundle mainBundle] pathForResource:@"create_load" ofType:@"sql"];
            NSString *sql = [[NSString alloc] initWithContentsOfFile:sqlPath encoding:NSUTF8StringEncoding error:nil];
            
            //执行create_load.sql文件
            sqlite3_exec(db, [sql UTF8String], NULL, NULL, NULL);
            //把当前版本号写到文件中
            NSString *updateSQL = [[NSString alloc] initWithFormat:@"UPDATE DBVersionInfo SET version_number = %@",configVersion];
            sqlite3_exec(db, [updateSQL UTF8String], NULL, NULL, NULL);
            
        } else {
            NSLog(@"数据打开失败");
        }
        sqlite3_close(db);
    }

    
    
}

//从数据库获取版本号方法
+(int) dbVersion_number {
    int dbVersionNumber = -1;
    const char *dbPath = [self applicationDirectoryPath:DB_FILENAME];
    if (sqlite3_open(dbPath, &db) == SQLITE_OK) {
        NSString *createTableSQL = @"CREATE TABLE IF NOT EXISTS DBVersionInfo(version_number int)";
        sqlite3_exec(db, [createTableSQL UTF8String], NULL, NULL, NULL);
        
        NSString *qsql = @"SELECT version_number FROM DBVersionInfo";
        
        sqlite3_stmt *statement;
        //预处理过程
        if (sqlite3_prepare_v2(db, [qsql UTF8String], -1, &statement, NULL) == SQLITE_OK) {
            //执行查询
            if (sqlite3_step(statement) == SQLITE_ROW) {
                NSLog(@"有数据");
                dbVersionNumber = sqlite3_column_int(statement, 0);
            } else {
                NSLog(@"无数据");
                NSString *insertSQL= @"INSERT INTO DBVersionInfo(version_number) VALUES(-1)";
                sqlite3_exec(db, [insertSQL UTF8String], NULL, NULL, NULL);
            }
        }
        sqlite3_finalize(statement);
        sqlite3_close(db);
    } else {
        sqlite3_close(db);
    }
    return dbVersionNumber;
}

@end


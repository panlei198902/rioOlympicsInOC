//
//  BaseDAO.m
//  rioOlympicsInOC
//
//  Created by Derexpan on 2016/11/14.
//  Copyright © 2016年 derex pan. All rights reserved.
//

#import "BaseDAO.h"
#import "DBHelper.h"

@implementation BaseDAO

+ (BOOL)openDB {
    const char *dbPath = [DBHelper applicationDirectoryPath:DB_FILENAME];
    if (sqlite3_open(dbPath, &db) != SQLITE_OK) {
        NSLog(@"数据库失败");
        sqlite3_close(db);
        return false;
    }
    return true;
}


@end

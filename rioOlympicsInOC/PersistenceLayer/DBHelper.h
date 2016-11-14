//
//  DBHelper.h
//  rioOlympicsInOC
//
//  Created by derex pan on 2016/11/13.
//  Copyright © 2016年 derex pan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"

#define DB_FILENAME @"app.db"

static sqlite3 *db;

@interface DBHelper : NSObject

//初始化数据库
+(void) initDB;
//从数据库获取版本号方法
+(int) dbVersion_number;
//获取沙箱目录的方法;
+(const char *) applicationDirectoryPath: (NSString*)fileName;
@end

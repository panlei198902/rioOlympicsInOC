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

//初始化数据库
+(void) initDB {
    
}

//获取沙箱目录方法
-(NSString*) applicationDirectoryPath: (NSString*)fileName {
    NSString *appDirectorPath = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, true);
    NSString *a = @"ss";
    return a;
}

//获取属性列表文件内版本号方法
-(int) plistVersion_number {
    NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"DBConfig" ofType:@"plist"];
    NSDictionary *plistDic = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    int versionNumber = [[plistDic objectForKey:@"DB_VERSION"] intValue];
    return versionNumber;
}
//从数据库获取版本号方法
-(int) dbVersion_number {

    return 0;
}

@end

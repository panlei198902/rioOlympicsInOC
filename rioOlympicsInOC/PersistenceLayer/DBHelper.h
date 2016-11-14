//
//  DBHelper.h
//  rioOlympicsInOC
//
//  Created by derex pan on 2016/11/13.
//  Copyright © 2016年 derex pan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"
@interface DBHelper : NSObject

@property(nonatomic,strong) NSString *DBFILE_NAME;

//初始化数据库
+(void) initDB;
//获取属性列表文件内版本号方法
-(int) plistVersion_number;
//从数据库获取版本号方法
-(int) dbVersion_number;
//获取沙箱目录的方法;
-(NSString*) applicationDirectoryPath: (NSString*)fileName;
@end

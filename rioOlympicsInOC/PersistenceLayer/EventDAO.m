//
//  EventDAO.m
//  rioOlympicsInOC
//
//  Created by Derexpan on 2016/11/14.
//  Copyright © 2016年 derex pan. All rights reserved.
//

#import "EventDAO.h"

@implementation EventDAO

+ (NSMutableArray*) findAll {
    NSMutableArray *listData = [[NSMutableArray alloc] init];
    if ([self openDB]) {
        NSString *sql = @"SELECT EventID, EventName, EventIcon, KeyInfo, BasicsInfo, OlympicInfo FROM Events";
        
        //预处理
        sqlite3_stmt *statement;
        if (sqlite3_prepare_v2(, [sql UTF8String], -1, &statement, NULL) == SQLITE_ROW) {
            
        }
    }
}
/*
 EventID            INTEGER   primary key autoincrement     not null,
 EventName          VARCHAR(20),
 EventIcon          VARCHAR(20),
 KeyInfo            CLOB,
 BasicsInfo         CLOB,
 OlympicInfo        CLOB
 */

@end
